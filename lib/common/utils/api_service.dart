import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muklog/app/models/feed_content_block.dart';
import 'package:muklog/app/models/generated_question.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/models/answer_result.dart';
import '../../app/models/api_response.dart';
import '../../app/models/app_notification.dart';
import '../../app/models/feed_quiz.dart';
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
  Future<Map<String, Question?>> getDailyQuestions() async {
    final response = await dio.get(ApiConstants.getDailyQuestions);

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '오늘의 문제 불러오기 실패');
    }

    final data = response.data['data'] as Map<String, dynamic>;
    return {
      'random':
          data['random'] == null ? null : Question.fromJson(data['random']),
      'friend':
          data['friend'] == null ? null : Question.fromJson(data['friend']),
      'popular':
          data['popular'] == null ? null : Question.fromJson(data['popular']),
    };
  }

  /// 문제 상세 조회
  Future<ApiResponse<Question>> getQuestionDetail(String questionId) async {
    try {
      final res = await dio.get(
        '${ApiConstants.getQuestionDetail}?id=$questionId',
      );
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
  Future<Map<String, dynamic>> createQuestion(
    GeneratedQuestion question,
  ) async {
    final response = await dio.post(
      ApiConstants.createQuestion,
      data: question.toJson(),
    );

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '문제 출제 실패');
    }

    final String questionId = response.data['data']['questionId'];
    final int pointGained = response.data['data']['pointGained'] ?? 0;

    logger.d('출제 성공: $questionId, 포인트 +$pointGained');

    return {'questionId': questionId, 'pointGained': pointGained};
  }

  /// 정답 제출
  Future<Map<String, dynamic>> submitAnswer({
    required String questionId,
    required String selected,
  }) async {
    final response = await dio.post(
      ApiConstants.submitAnswer,
      data: {'questionId': questionId, 'selected': selected},
    );

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '정답 제출 실패');
    }

    final data = response.data['data'];
    final author = data['author'];
    final isFollowing = author['isFollowing'] == true;

    return {
      'isCorrect': data['isCorrect'],
      'pointGained': data['pointGained'],
      'newLevel': data['newLevel'],
      'levelUp': data['levelUp'],
      'correctRate': data['correctRate'],
      'authorUid': author['uid'],
      'authorNickname': author['nickname'],
      'avatarUrl': author['avatarUrl'],
      'isFollowing': isFollowing,
    };
  }

  Future<Map<String, dynamic>> getRankingList() async {
    final response = await dio.get(ApiConstants.getRankingList);

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '랭킹 데이터 조회 실패');
    }

    final data = response.data['data'] as Map<String, dynamic>;

    return {
      'pointRanking':
          (data['pointRanking'] as List)
              .map((e) => UserRanking.fromJson(e))
              .toList(),
      'levelUpRanking':
          (data['levelUpRanking'] as List)
              .map((e) => UserRanking.fromJson(e))
              .toList(),
      'questionRanking':
          (data['questionRanking'] as List)
              .map((e) => UserRanking.fromJson(e))
              .toList(),
      'accuracyRanking':
          (data['accuracyRanking'] as List)
              .map((e) => UserRanking.fromJson(e))
              .toList(),
      'myPointRank': data['myPointRank'], // e.g., { rank: 12, point: 1850 }
    };
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

  Future<GeneratedQuestion> generateQuestionFromImage({
    required String imageUrl,
    required String userPrice,
  }) async {
    final buffer = StringBuffer();

    buffer.writeln('이 음식의 이름과 사용자가 입력한 가격을 바탕으로, 사용자 참여형 객관식 퀴즈를 만들어줘.');
    buffer.writeln('**절대로 설명 없이 JSON 형식만 반환해줘.**\n');
    buffer.writeln('조건:');
    buffer.writeln('- 문제는 이 음식의 가격을 맞히는 객관식 퀴즈 형식이어야 해.');
    buffer.writeln('- 정답은 반드시 사용자가 입력한 가격 ($userPrice 원)이어야 해.');
    buffer.writeln('- 사용자가 입력한 가격을 선택지 중 하나로 포함해 혼동을 유도해줘.');
    buffer.writeln('- 나머지 3개의 선택지는 plausible하지만 정답이 아닌 가격으로 구성해줘.');
    buffer.writeln('- 해설에는 평균 가격과 사용자의 가격이 왜 다른지에 대한 추측을 포함해줘.');
    buffer.writeln('- 반드시 아래와 같은 JSON 구조로만 응답해줘:\n');
    buffer.writeln('```json');
    buffer.writeln('{');
    buffer.writeln('  "type": "objective",');
    buffer.writeln('  "question": "이 음식의 가격은 얼마일까요?",');
    buffer.writeln('  "choices": ["2500원", "3200원", "3000원", "4000원"],');
    buffer.writeln('  "answer": "3200원",');
    buffer.writeln(
      '  "explanation": "이 음식의 평균 가격은 약 2,800원이지만, 사용자가 구매한 가격은 3,200원입니다. 포장 상태가 좋거나 유명 맛집에서 구매했을 가능성이 있습니다.",',
    );
    buffer.writeln('  "foodName": "김밥"');
    buffer.writeln('}');
    buffer.writeln('```');

    final promptAppend = buffer.toString();

    final prompt = [
      Content.multi([TextPart(promptAppend)]),
      Content("user", [FileData("image/jpeg", imageUrl)]),
    ];

    final response = await _gemini.generateContent(prompt);

    final resultText =
        ((response.candidates.first.content.parts.first) as TextPart).text;
    final cleaned = resultText.replaceAll(RegExp(r'^```json|```$'), '').trim();
    logger.d(cleaned);
    final decoded = json.decode(cleaned);

    return GeneratedQuestion.fromJson(
      decoded,
    ).copyWith(imageUrl: imageUrl, userPrice: userPrice);
  }

  Future<bool> hasUserSolvedQuestion({required String questionId}) async {
    final response = await dio.get(
      ApiConstants.checkAlreadySolved,
      queryParameters: {'questionId': questionId},
    );

    if (!(response.data['success'] ?? false)) return false;
    return response.data['data']['alreadySolved'] ?? false;
  }

  /// 팔로우 토글 (팔로우 or 언팔로우)
  Future<bool> toggleFollow(String targetUid) async {
    final response = await dio.post(
      ApiConstants.toggleFollow,
      data: {'targetUid': targetUid},
    );

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '팔로우 처리 실패');
    }

    return response.data['data']['isFollowing'] == true;
  }

  /// 내가 팔로우한 유저 목록
  Future<List<Map<String, dynamic>>> getFollowing() async {
    final response = await dio.get(ApiConstants.getFollowing);

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '팔로잉 목록 조회 실패');
    }

    return List<Map<String, dynamic>>.from(response.data['data']);
  }

  /// 나를 팔로우한 유저 목록
  Future<List<Map<String, dynamic>>> getFollowers() async {
    final response = await dio.get(ApiConstants.getFollowers);

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '팔로워 목록 조회 실패');
    }

    return List<Map<String, dynamic>>.from(response.data['data']);
  }

  Future<bool> isFollowing(String targetUid) async {
    final response = await dio.get(
      ApiConstants.isFollowing,
      queryParameters: {'targetUid': targetUid},
    );

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '팔로우 상태 조회 실패');
    }

    return response.data['data']['isFollowing'] == true;
  }

  Future<List<Map<String, dynamic>>> getRecentLevelUps() async {
    final response = await dio.get(ApiConstants.getRecentLevelUps);

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '레벨업 유저 불러오기 실패');
    }

    return List<Map<String, dynamic>>.from(response.data['data']);
  }

  Future<void> likeQuestion(String questionId) async {
    final response = await dio.post(
      ApiConstants.likeQuestion,
      data: {'questionId': questionId},
    );

    if (!(response.data['success'] ?? false)) {
      throw Exception(response.data['message'] ?? '좋아요 실패');
    }
  }

  // lib/app/data/services/api_service.dart
  Future<List<Map<String, dynamic>>> getFeeds({String? startAfterId}) async {
    final response = await dio.post(
      '/getFeeds',
      data: {'startAfterId': startAfterId},
    );

    if (response.data['success'] == true) {
      final List list = response.data['data'];
      return List<Map<String, dynamic>>.from(list);
    } else {
      throw Exception(response.data['message'] ?? '피드 불러오기 실패');
    }
  }

  Future<void> createFeed({
    required List<FeedContentBlock> contentBlocks,
    List<FeedQuiz> quizzes = const [],
  }) async {
    final response = await dio.post(
      '/createFeed',
      data: {
        'contentBlocks': contentBlocks.map((e) => e.toJson()).toList(),
        'quizzes': quizzes.map((e) => e.toJson()).toList(),
      },
    );

    if (response.data['success'] != true) {
      throw Exception(response.data['message'] ?? '피드 생성 실패');
    }
  }
}
