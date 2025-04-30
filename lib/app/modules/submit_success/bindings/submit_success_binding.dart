import 'package:get/get.dart';

import '../controllers/submit_success_controller.dart';

class SubmitSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmitSuccessController>(
      () => SubmitSuccessController(),
    );
  }
}
