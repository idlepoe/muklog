import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/models/answer_result.dart';
import '../../app/models/api_response.dart';
import '../../app/models/app_notification.dart';
import '../../app/models/point_history.dart';
import '../../app/models/question.dart';
import '../../app/models/user_profile.dart';
import '../../app/models/user_ranking.dart';
import '../../constants/api_constants.dart';
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

  /// 프로필 생성 (Cloud Function)
  Future<ApiResponse<UserProfile>> createUserProfile({
    required String uid,
    required String nickname,
    required String intro,
    required String avatarUrl,
  }) async {
    try {
      final res = await dio.post(
        ApiConstants.createUserProfile,
        data: {
          'uid': uid,
          'nickname': nickname,
          'intro': intro,
          'avatarUrl': avatarUrl,
        },
      );

      final json = res.data as Map<String, dynamic>;
      final parsed = ApiResponse<UserProfile>.fromJson(
        json,
        UserProfile.fromJson,
      );

      logger.i('✅ createUserProfile: ${parsed.message}');
      return parsed;
    } catch (e) {
      logger.e('❌ createUserProfile error: $e');
      rethrow;
    }
  }

  /// 현재 로그인된 사용자의 프로필 조회
  Future<UserProfile?> getUserProfile() async {
    try {
      final res = await dio.get(ApiConstants.getUserProfile);
      logger.i('✅ getUserProfile success');

      final json = res.data as Map<String, dynamic>;
      final parsed = ApiResponse<UserProfile>.fromJson(
        json,
        UserProfile.fromJson,
      );

      if (parsed.success) {
        logger.i('✅ createUserProfile: ${parsed.data}');
        return parsed.data;
      } else {
        logger.w('⚠️ 서버 응답 실패: ${parsed.message}');
        return null;
      }
    } catch (e) {
      logger.e('❌ getUserProfile error: $e');
      rethrow;
    }
  }

  /// 현재 로그인된 사용자의 프로필 수정
  Future<bool> updateUserProfile({
    required String nickname,
    required String intro,
    required String avatarUrl,
  }) async {
    try {
      final res = await dio.post(
        ApiConstants.updateUserProfile,
        data: {'nickname': nickname, 'intro': intro, 'avatarUrl': avatarUrl},
      );

      logger.i('✅ updateUserProfile success');

      final json = res.data as Map<String, dynamic>;
      final parsed = ApiResponse<UserProfile>.fromJson(
        json,
        UserProfile.fromJson,
      );

      if (parsed.success) {
        logger.i('✅ updateUserProfile result: ${parsed.data}');
        return true;
      } else {
        logger.w('⚠️ updateUserProfile failed: ${parsed.message}');
        return false;
      }
    } catch (e) {
      logger.e('❌ updateUserProfile error: $e');
      rethrow;
    }
  }

  /// 포인트 히스토리 조회
  Future<ApiResponse<List<PointHistory>>> getPointHistory() async {
    try {
      final res = await dio.get(ApiConstants.getPointHistory);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse.fromJsonList(json, PointHistory.fromJson);
    } catch (e) {
      logger.e('❌ getPointHistory error: $e');
      rethrow;
    }
  }

  /// 오늘의 문제 조회
  Future<ApiResponse<Question>> getTodayQuestion() async {
    try {
      final res = await dio.get(ApiConstants.getTodayQuestion);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse<Question>.fromJson(json, Question.fromJson);
    } catch (e) {
      logger.e('❌ getTodayQuestion error: $e');
      rethrow;
    }
  }

  /// 문제 상세 조회
  Future<ApiResponse<Question>> getQuestionDetail(String questionId) async {
    try {
      final res = await dio.get('${ApiConstants.getQuestionDetail}?id=$questionId');
      final json = res.data as Map<String, dynamic>;
      return ApiResponse<Question>.fromJson(json, Question.fromJson);
    } catch (e) {
      logger.e('❌ getQuestionDetail error: $e');
      rethrow;
    }
  }

  /// 내 출제 문제 목록 조회
  Future<ApiResponse<List<Question>>> getMyQuestions() async {
    try {
      final res = await dio.get(ApiConstants.getMyQuestions);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse.fromJsonList(json, Question.fromJson);
    } catch (e) {
      logger.e('❌ getMyQuestions error: $e');
      rethrow;
    }
  }

  /// 문제 출제
  Future<ApiResponse<bool>> createQuestion(Map<String, dynamic> data) async {
    try {
      final res = await dio.post(ApiConstants.createQuestion, data: data);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse<bool>.fromJson(json, (v) => true);
    } catch (e) {
      logger.e('❌ createQuestion error: $e');
      rethrow;
    }
  }

  /// 정답 제출
  Future<ApiResponse<AnswerResult>> submitAnswer(String questionId, int choiceIndex) async {
    try {
      final res = await dio.post(ApiConstants.submitAnswer, data: {
        'questionId': questionId,
        'choiceIndex': choiceIndex,
      });
      final json = res.data as Map<String, dynamic>;
      return ApiResponse<AnswerResult>.fromJson(json, AnswerResult.fromJson);
    } catch (e) {
      logger.e('❌ submitAnswer error: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<UserRanking>>> getRankingList() async {
    try {
      final res = await dio.get(ApiConstants.getRankingList);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse.fromJsonList(json, UserRanking.fromJson);
    } catch (e) {
      logger.e('❌ getRankingList error: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<UserProfile>>> getFollowers() async {
    try {
      final res = await dio.get(ApiConstants.getFollowers);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse.fromJsonList(json, UserProfile.fromJson);
    } catch (e) {
      logger.e('❌ getFollowers error: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<UserProfile>>> getFollowing() async {
    try {
      final res = await dio.get(ApiConstants.getFollowing);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse.fromJsonList(json, UserProfile.fromJson);
    } catch (e) {
      logger.e('❌ getFollowing error: $e');
      rethrow;
    }
  }

  Future<ApiResponse<bool>> toggleFollow(String targetUid) async {
    try {
      final res = await dio.post(ApiConstants.toggleFollow, data: {
        'targetUid': targetUid,
      });
      final json = res.data as Map<String, dynamic>;
      return ApiResponse<bool>.fromJson(json, (v) => true);
    } catch (e) {
      logger.e('❌ toggleFollow error: $e');
      rethrow;
    }
  }

  Future<ApiResponse<List<AppNotification>>> getNotifications() async {
    try {
      final res = await dio.get(ApiConstants.getNotifications);
      final json = res.data as Map<String, dynamic>;
      return ApiResponse.fromJsonList(json, AppNotification.fromJson);
    } catch (e) {
      logger.e('❌ getNotifications error: $e');
      rethrow;
    }
  }

}
