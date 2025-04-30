import 'package:get/get.dart';

import '../controllers/init_user_profile_controller.dart';

class InitUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitUserProfileController>(
      () => InitUserProfileController(),
    );
  }
}
