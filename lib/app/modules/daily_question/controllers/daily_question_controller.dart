import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:muklog/common/utils/api_service.dart';

import '../../../models/generated_question.dart';

class DailyQuestionController extends GetxController {
  final Rxn<GeneratedQuestion> randomQuestion = Rxn();
  final Rxn<GeneratedQuestion> friendQuestion = Rxn();
  final Rxn<GeneratedQuestion> popularQuestion = Rxn();
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      isLoading.value = true;
      final result = await ApiService().getDailyQuestions();
      randomQuestion.value = result['random'];
      friendQuestion.value = result['friend'];
      popularQuestion.value = result['popular'];
    } catch (e) {
      Get.snackbar('오류', '오늘의 문제를 불러오지 못했습니다.');
    } finally {
      isLoading.value = false;
    }
  }
}
