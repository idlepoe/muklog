import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muklog/app/modules/feed_list/controllers/feed_list_controller.dart';
import 'package:muklog/app/modules/feed_list/views/feed_list_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../daily_question/controllers/daily_question_controller.dart';
import '../../daily_question/views/daily_question_view.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/views/profile_view.dart';
import '../../ranking/controllers/ranking_controller.dart';
import '../../ranking/views/ranking_view.dart';
import '../../submit_question/controllers/submit_question_controller.dart';
import '../../submit_question/views/submit_question_view.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final updater = ShorebirdUpdater();

  final pages = [
    const DailyQuestionView(), // 🏠 홈: 오늘의 문제
    const SubmitQuestionView(), // 📸 출제
    const FeedListView(), // 📸 출제
    const RankingView(), // 🏅 랭킹
    const ProfileView(), // 👤 프로필
  ];

  @override
  void onInit() {
    super.onInit();
    Get.put(DailyQuestionController());
    Get.put(SubmitQuestionController());
    Get.put(FeedListController());
    Get.put(RankingController());
    Get.put(ProfileController());
  }

  @override
  void onReady() {
    super.onReady();
    requestPushPermissionIfNeeded(); // 추가
    checkAndUpdateFcmToken();
    checkPatchNoteIfNeeded();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTab(int index) {
    currentIndex.value = index;
    if (index == 0) {
      Get.put(DailyQuestionController());
    } else if (index == 1) {
      Get.put(SubmitQuestionController());
    } else if (index == 2) {
      Get.put(FeedListController());
    } else if (index == 3) {
      Get.put(RankingController());
    } else if (index == 4) {
      Get.put(ProfileController());
    }
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
          "BFjZaaFy8M_AS_u_M3ynsZVO0HdIVEZI_VWMCx9Ivu0qDfNDNiMRGXPb74MDopX2vtDH6XX1uL1JfVTrOS1jeqM",
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

  void checkPatchNoteIfNeeded() async {
    final patch = await updater.readCurrentPatch(); // null일 수 있음
    final patchNumber = patch?.number;

    if (patchNumber == null) return; // Shorebird가 적용 안된 빌드일 수도 있음

    final prefs = await SharedPreferences.getInstance();
    final lastSeenPatch = prefs.getInt('last_seen_patch') ?? 0;

    if (patchNumber > lastSeenPatch) {
      await prefs.setInt('last_seen_patch', patchNumber);

      final patchNotes = {
        1: '🛠 버그 수정: 알림 클릭 시 앱이 튕기던 문제 해결',
        2: '✨ 새 기능: 메시지에 이모지 반응 추가!',
        3: '버그 수정',
        4: '버그 수정',
        5: '버그 수정',
        6: '버그 수정',
      };

      final note = patchNotes[patchNumber] ?? '새로운 업데이트가 적용되었습니다!';
      Get.dialog(
        AlertDialog(
          title: Text('업데이트 안내'),
          content: Text(note),
          actions: [TextButton(onPressed: () => Get.back(), child: Text('확인'))],
        ),
      );
    }
  }
}
