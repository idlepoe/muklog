import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/point_gain_dialog.dart';
import '../../../models/generated_question.dart';
import '../../../models/question.dart';
import '../../../routes/app_pages.dart';
import '../../profile/controllers/profile_controller.dart';

class QuestionDetailController extends GetxController {
  late final Question question;
  final RxnString selected = RxnString();
  final RxBool isAnswered = false.obs;
  final RxBool isCorrectAnswer = false.obs;
  final RxInt pointEarned = 0.obs;

  final RxBool alreadySolved = false.obs;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg == null || arg is! Question) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(Routes.HOME);
      });
      return;
    }
    question = arg;
    checkAlreadySolved();
  }

  Future<void> checkAlreadySolved() async {
    try {
      alreadySolved.value = await ApiService().hasUserSolvedQuestion(
        questionId: question.questionId!,
      );
    } catch (_) {
      alreadySolved.value = false;
    }
  }

  void selectChoice(String choice) {
    if (isAnswered.value) return; // 이미 제출했으면 선택 막기
    selected.value = choice;
  }

  Future<void> submitAnswer() async {
    if (selected.value == null || isAnswered.value) return;

    isAnswered.value = true;

    try {
      final result = await ApiService().submitAnswer(
        questionId: question.questionId!,
        selected: selected.value!,
      );

      final isCorrect = result['isCorrect'] == true;
      final point = result['pointGained'] ?? 0;
      final levelUp = result['levelUp'] == true;
      final newLevel = result['newLevel'];
      final correctRate = result['correctRate'];
      final authorUid = result['authorUid'];
      final authorNickname = result['authorNickname'];
      final avatarUrl = result['avatarUrl'];
      final isFollowing = result['isFollowing'];

      isCorrectAnswer.value = isCorrect;
      pointEarned.value = point;

      // 1. 포인트 획득 다이얼로그 먼저
      if (point > 0) {
        await showDialog(
          context: Get.context!,
          builder:
              (_) => PointGainDialog(
                points: point,
                levelUp: levelUp,
                newLevel: newLevel,
              ),
        );
      }

      if (!isFollowing) {
        // 2. 팔로우 다이얼로그 표시
        final follow = await showDialog<bool>(
          context: Get.context!,
          builder:
              (_) => AlertDialog(
                title: Row(
                  children: [
                    if (avatarUrl.isNotEmpty)
                      CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl),
                        radius: 20,
                      ),
                    const SizedBox(width: 12),
                    Expanded(child: Text('$authorNickname님을 팔로우하시겠어요?')),
                  ],
                ),
                content: const Text('팔로우하면 이 사용자의 문제를 더 많이 볼 수 있어요!'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(result: false),
                    child: const Text('아니요'),
                  ),
                  TextButton(
                    onPressed: () => Get.back(result: true),
                    child: const Text('팔로우'),
                  ),
                ],
              ),
        );

        if (follow == true) {
          await ApiService().toggleFollow(authorUid);
          Get.snackbar('팔로우 완료', '$authorNickname님을 팔로우했어요!');
        }
      }

      await Get.find<ProfileController>().loadUserProfile();
    } catch (e) {
      if (e.toString().contains('이미 푼 문제')) {
        Get.snackbar('문제 풀이 불가', '이 문제는 이미 풀었습니다!');
      } else {
        logger.e(e);
        Get.snackbar('오류', '문제를 제출하는 데 실패했습니다.');
      }
    }
  }

  Future<void> likeQuestion() async {
    try {
      await ApiService().likeQuestion(question.questionId);
      Get.back();
    } catch (e) {
      logger.e(e);
      Get.snackbar('오류', '좋아요를 누를 수 없습니다.');
    }
  }
}
