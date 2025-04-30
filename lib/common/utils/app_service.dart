import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


import 'dio.dart';
import 'logger.dart';

class ApiService {
  final FirebaseStorage _db = FirebaseStorage.instance;
  final _gemini = FirebaseVertexAI.instance.generativeModel(
    model: 'gemini-2.0-flash', // 또는 flash
  );

  Future<String> uploadFileToStorage({required XFile xFile}) async {
    logger.d(xFile.toString());

    String result = "";
    try {
      Reference reference = _db.ref().child(
        "uploads/${DateTime.now().millisecondsSinceEpoch.toString()}_${xFile.name}",
      );
      await reference.putData(await xFile.readAsBytes());
      result = await reference.getDownloadURL();
      logger.d(result);
    } catch (e) {
      logger.e(e);
      logger.e(e.toString());
      return e.toString();
    }

    return result;
  }

  Future<void> checkAndUpdateFcmToken() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final messaging = FirebaseMessaging.instance;

    // 🔥 웹은 권한 먼저 요청해야 함
    if (GetPlatform.isWeb) {
      NotificationSettings permission = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      final PermissionStatus status = await Permission.notification.request();
      if (status != PermissionStatus.granted) {
        print('🔔 알림 권한이 거부되었습니다.');
        return;
      }
    }

    final fcmToken = await messaging.getToken(
      vapidKey:
          "BDW8-S9gbb_dTewnGcMn35KLwmqxDW6kHK6ZoppLd8E7K74iTUymGCloskngbm_1-AXRm3UWYr705s8nMepxjUc",
    );
    if (fcmToken == null) {
      print('🔔 FCM 토큰을 가져오지 못했습니다.');
      return;
    }

    // 🔥 서버에 저장 (Firestore users 문서에 업데이트)
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'fcmToken': fcmToken,
    });

    print('✅ FCM 토큰 업데이트 완료: $fcmToken');
  }

  Future<void> requestPushPermissionIfNeeded() async {
    if (await Permission.notification.isDenied) {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        print('✅ 푸시 알림 권한 허용됨');
      } else {
        print('❌ 푸시 알림 권한 거부됨');
      }
    } else {
      print('✅ 이미 푸시 알림 권한 있음');
    }
  }

  checkUserProfile({required String uid}) {}

}
