import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../models/generated_question.dart';

class QuestionDetailController extends GetxController {
  late final GeneratedQuestion question;
  final RxnString selected = RxnString();
  final RxBool isAnswered = false.obs;
  final RxBool isCorrect = false.obs;
  final RxInt pointEarned = 0.obs;

  final RxBool alreadySolved = false.obs;

  @override
  void onInit() {
    super.onInit();
    question = Get.arguments as GeneratedQuestion;
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

    logger.d(question.questionId!);
    logger.d(selected.value!);
    try {
      final result = await ApiService().submitAnswer(
        questionId: question.questionId!,
        selected: selected.value!,
      );
      // 결과 표시
    } catch (e) {
      if (e.toString().contains('이미 푼 문제')) {
        Get.snackbar('문제 풀이 불가', '이 문제는 이미 풀었습니다!');
      } else {
        logger.e(e);
        Get.snackbar('오류', '문제를 제출하는 데 실패했습니다.');
      }
    }
  }
}
