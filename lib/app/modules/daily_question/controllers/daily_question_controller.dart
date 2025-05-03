import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:muklog/common/utils/api_service.dart';

import '../../../models/generated_question.dart';
import '../../../models/question.dart';
import '../../../models/user_summary.dart';

class DailyQuestionController extends GetxController {
  final users = <UserSummary>[].obs;

  final Rxn<Question> randomQuestion = Rxn();
  final Rxn<Question> friendQuestion = Rxn();
  final Rxn<Question> popularQuestion = Rxn();
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    fetchQuestions();
    fetchRecentLevelUps();
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

  Future<void> fetchRecentLevelUps() async {
    isLoading.value = true;
    try {
      final result = await ApiService().getRecentLevelUps();
      users.assignAll(
        result.map<UserSummary>((e) => UserSummary.fromJson(e)).toList(),
      );
    } catch (e) {
      Get.snackbar('오류', '레벨업 유저 정보를 불러오지 못했습니다.');
    } finally {
      isLoading.value = false;
    }
  }
}
