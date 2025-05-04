import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app/models/feed.dart';
import '../../app/models/feed_content_block.dart';
import '../../app/routes/app_pages.dart';

class FeedTileCard extends StatelessWidget {
  final Feed feed;

  const FeedTileCard({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    final imageBlock =
        feed.contentBlocks.whereType<FeedContentImage>().firstOrNull;

    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FEED_DETAIL, arguments: feed);
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageBlock != null)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(imageBlock.value, fit: BoxFit.cover),
              ),
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: Text(
            //     '${feed.uid} 님의 먹로그',
            //     style: const TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        feed.avatarUrl.isNotEmpty
                            ? NetworkImage(feed.avatarUrl)
                            : AssetImage('assets/images/default_avatar.png')
                                as ImageProvider,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feed.nickname,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${feed.title} · Lv.${feed.level}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text('🍽️ ${feed.countLike}'),
                  const SizedBox(width: 12),
                  Text('😂 ${feed.countFunny}'),
                  const SizedBox(width: 12),
                  Text('😕 ${feed.countBad}'),
                  const SizedBox(width: 12),
                  Text('💬 ${feed.commentCount}'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                timeAgo(feed.createdAt),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return '방금 전';
    if (diff.inMinutes < 60) return '${diff.inMinutes}분 전';
    if (diff.inHours < 24) return '${diff.inHours}시간 전';
    if (diff.inDays < 7) return '${diff.inDays}일 전';
    return '${date.month}월 ${date.day}일';
  }
}
