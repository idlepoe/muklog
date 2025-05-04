import 'package:get/get.dart';

import '../controllers/feed_upload_controller.dart';

class FeedUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedUploadController>(
      () => FeedUploadController(),
    );
  }
}
