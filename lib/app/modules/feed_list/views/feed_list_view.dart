import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/feed_tile_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/feed_list_controller.dart';

class FeedListView extends GetView<FeedListController> {
  const FeedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('먹로그'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.fetchFeeds(loadMore: false);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isFetchingMore.value &&
                scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 200) {
              controller.fetchFeeds(loadMore: true);
            }
            return false;
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.feeds.length,
            itemBuilder: (context, index) {
              final feed = controller.feeds[index];
              return FeedTileCard(feed: feed);
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.FEED_UPLOAD),
        child: const Icon(Icons.add),
        tooltip: '피드 작성하기',
      ),
    );
  }
}
