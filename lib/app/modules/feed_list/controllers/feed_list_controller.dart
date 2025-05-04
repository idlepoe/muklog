import 'package:get/get.dart';

import '../../../../common/utils/api_service.dart';
import '../../../models/feed.dart';

class FeedListController extends GetxController {
  final feeds = <Feed>[].obs;
  final isLoading = true.obs;
  String? lastFeedId;
  final isMoreAvailable = true.obs;
  final isFetchingMore = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeeds();
  }

  Future<void> fetchFeeds({bool loadMore = false}) async {
    if (loadMore && !isMoreAvailable.value) return;
    if (!loadMore) {
      lastFeedId = "";
    }
    if (loadMore)
      isFetchingMore.value = true;
    else
      isLoading.value = true;

    try {
      final result = await ApiService().getFeeds(startAfterId: lastFeedId);
      final newFeeds = result.map<Feed>((e) => Feed.fromJson(e)).toList();

      if (loadMore) {
        feeds.addAll(newFeeds);
      } else {
        feeds.assignAll(newFeeds);
      }

      if (newFeeds.isNotEmpty) {
        lastFeedId = newFeeds.last.feedId;
      }

      isMoreAvailable.value = newFeeds.length >= 20;
    } catch (e) {
      Get.snackbar('오류', '피드를 불러오지 못했습니다.');
    } finally {
      isLoading.value = false;
      isFetchingMore.value = false;
    }
  }
}