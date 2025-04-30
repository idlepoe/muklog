import 'package:get/get.dart';

import '../controllers/my_questions_controller.dart';

class MyQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyQuestionsController>(
      () => MyQuestionsController(),
    );
  }
}
