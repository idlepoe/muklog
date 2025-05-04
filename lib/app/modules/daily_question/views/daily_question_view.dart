import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/feed_content_block.dart';
import '../../../models/generated_question.dart';
import '../../../routes/app_pages.dart';
import '../controllers/daily_question_controller.dart';

class DailyQuestionView extends GetView<DailyQuestionController> {
  const DailyQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 진품먹품'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchData,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (controller.randomQuestion.value != null)
              buildSection("🎯 오늘의 추천 문제", controller.randomQuestion.value!),
            if (controller.friendQuestion.value != null)
              buildSection("👥 친구가 낸 문제", controller.friendQuestion.value!),
            if (controller.popularQuestion.value != null)
              buildSection("🔥 인기 문제", controller.popularQuestion.value!),
            if (controller.randomQuestion.value == null &&
                controller.friendQuestion.value == null &&
                controller.popularQuestion.value == null) ...[
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    const Text(
                      '😶 아직 퀴즈가 없어요!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '당신이 첫 번째 출제자가 되어보세요 ✨',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await Get.toNamed(Routes.SUBMIT_QUESTION);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('퀴즈 출제하러 가기'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const Divider(height: 32),
            const Text(
              '🆙 최근 레벨업한 유저',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (controller.users.isEmpty) ...[
              const SizedBox(height: 12),
              Center(
                child: Text(
                  '아직 오늘은 레벨업한 유저가 없어요...\n첫 번째 주인공이 되어보세요! 🌟',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ),
            ],
            ...controller.users.map(
              (user) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: user.avatarUrl.isNotEmpty
                      ? NetworkImage(user.avatarUrl)
                      : AssetImage('assets/images/default_avatar.png') as ImageProvider,
                ),
                title: Text(user.nickname),
                subtitle: Text('Lv. ${user.level}'),
              ),
            ),
            if (controller.latestFeeds.isNotEmpty) ...[
              const Divider(height: 32),
              const Text('🍱 오늘의 먹로그', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              ...controller.latestFeeds.map((feed) {
                final imageBlock = feed.contentBlocks.whereType<FeedContentImage>().firstOrNull;
                final textBlock = feed.contentBlocks.whereType<FeedContentText>().firstOrNull;

                return ListTile(
                  leading: imageBlock != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(imageBlock.value, width: 60, height: 60, fit: BoxFit.cover),
                  )
                      : null,
                  title: Text('${feed.nickname} 님의 먹로그'),
                  subtitle: textBlock != null
                      ? Text(textBlock.value, maxLines: 2, overflow: TextOverflow.ellipsis)
                      : const Text('내용이 없습니다.'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Get.toNamed(Routes.FEED_DETAIL, arguments: feed),
                );
              }).toList(),
            ]
          ],
        );
      }),
    );
  }

  Widget buildSection(String title, question) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: Image.network(question.imageUrl, width: 60, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(question.question),
        trailing: ElevatedButton(
          onPressed:
              () => Get.toNamed(Routes.QUESTION_DETAIL, arguments: question),
          child: const Text('풀기'),
        ),
      ),
    );
  }
}
