import 'package:get/get.dart';

import '../controllers/submit_question_controller.dart';

class SubmitQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmitQuestionController>(
      () => SubmitQuestionController(),
    );
  }
}
