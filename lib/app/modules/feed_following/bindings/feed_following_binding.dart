import 'package:get/get.dart';

import '../controllers/feed_following_controller.dart';

class FeedFollowingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedFollowingController>(
      () => FeedFollowingController(),
    );
  }
}
