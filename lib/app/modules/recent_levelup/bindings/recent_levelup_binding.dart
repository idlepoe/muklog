import 'package:get/get.dart';

import '../controllers/recent_levelup_controller.dart';

class RecentLevelupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecentLevelupController>(
      () => RecentLevelupController(),
    );
  }
}
