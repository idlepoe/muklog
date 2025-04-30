import 'package:get/get.dart';

import '../controllers/ranking_following_controller.dart';

class RankingFollowingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingFollowingController>(
      () => RankingFollowingController(),
    );
  }
}
