import 'package:get/get.dart';

import '../controllers/feed_list_controller.dart';

class FeedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedListController>(
      () => FeedListController(),
    );
  }
}
