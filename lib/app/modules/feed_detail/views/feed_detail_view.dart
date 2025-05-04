import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/utils/app_utils.dart';
import '../../../../common/utils/logger.dart';
import '../../../models/feed_content_block.dart';
import '../../../models/feed_quiz.dart';
import '../controllers/feed_detail_controller.dart';

class FeedDetailView extends GetView<FeedDetailController> {
  const FeedDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final feed = controller.feed;

    return Scaffold(
      appBar: AppBar(title: const Text('먹로그 상세')),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      feed.avatarUrl.isNotEmpty
                          ? NetworkImage(feed.avatarUrl)
                          : const AssetImage('assets/images/default_avatar.png')
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
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '1시간 전', // 시간 처리 유틸리티로 바꾸세요
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...feed.contentBlocks.map((block) {
              if (block is FeedContentImage) {
                final quiz = feed.quizzes!.firstWhereOrNull(
                  (q) => q.imageUrl == block.value,
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(block.value),
                        ),
                        if (quiz != null)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: InkWell(
                              onTap: () {
                                controller.toggleQuiz(block.value);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "퀴즈",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    controller.showQuiz[block.value] == true
                                        ? Icons.expand_more
                                        : Icons.quiz_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (quiz != null)
                          Obx(
                            () => AnimatedPositioned(
                              duration: const Duration(milliseconds: 300),
                              bottom: 0,
                              left: 0,
                              right: 0,
                              height:
                                  controller.showQuiz[block.value] == true
                                      ? 100
                                      : 0,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.95),
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(8),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Q. ${quiz.question}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children:
                                            quiz.choices.map((choice) {
                                              if (choice.isEmpty)
                                                return const SizedBox();
                                              final isAnswered = controller
                                                  .isAnswered(block.value);
                                              final isSelected = controller
                                                  .isSelected(
                                                    block.value,
                                                    choice,
                                                  );
                                              final isCorrect =
                                                  quiz.answer == choice;

                                              Color? bgColor;
                                              Color fgColor = Colors.black;
                                              if (isAnswered) {
                                                if (isCorrect) {
                                                  bgColor = Colors.green[100];
                                                  fgColor = Colors.black;
                                                } else if (isSelected) {
                                                  bgColor = Colors.red[100];
                                                  fgColor = Colors.white;
                                                } else {
                                                  bgColor = Colors.grey[200];
                                                }
                                              } else {
                                                bgColor = Colors.grey[100];
                                              }

                                              return Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border:
                                                      isSelected
                                                          ? Border.all(
                                                            color: Colors.black,
                                                            width: 1.5,
                                                          )
                                                          : null,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (isAnswered) return;
                                                    controller.selectAnswer(
                                                      block.value,
                                                      choice,
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: bgColor,
                                                    foregroundColor: fgColor,
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 10,
                                                        ),
                                                    textStyle: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  child: Text(choice),
                                                ),
                                              );
                                            }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              } else if (block is FeedContentText) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    block.value,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }
              return const SizedBox.shrink();
            }).toList(),
          ],
        ),
      ),
    );
  }
}
