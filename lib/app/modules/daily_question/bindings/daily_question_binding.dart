import 'package:get/get.dart';

import '../controllers/daily_question_controller.dart';

class DailyQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyQuestionController>(
      () => DailyQuestionController(),
    );
  }
}
