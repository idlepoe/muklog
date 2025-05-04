import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(feed.avatarUrl)),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(block.value),
                  ),
                  if (quiz != null)
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () => controller.toggleQuiz(block.value),
                            child: Text(
                              controller.showQuiz[block.value] == true
                                  ? '🔽 퀴즈 닫기'
                                  : '🧠 퀴즈 열기',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                          if (controller.showQuiz[block.value] == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  'Q. ${quiz.question}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children:
                                      quiz.choices.map((choice) {
                                        final isSelected =
                                            controller.selectedAnswers[block
                                                .value] ==
                                            choice;
                                        final isCorrect = choice == quiz.answer;
                                        final alreadyAnswered = controller
                                            .selectedAnswers
                                            .containsKey(block.value);

                                        return choice.isEmpty
                                            ? SizedBox()
                                            : ElevatedButton(
                                              onPressed:
                                                  alreadyAnswered
                                                      ? null
                                                      : () => controller
                                                          .selectAnswer(
                                                            block.value,
                                                            choice,
                                                          ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    isSelected
                                                        ? (isCorrect
                                                            ? Colors.green
                                                            : Colors.red[300])
                                                        : Colors.grey[200],
                                                foregroundColor: Colors.black,
                                              ),
                                              child: Text(choice),
                                            );
                                      }).toList(),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              );
            } else if (block is FeedContentText) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(block.value, style: const TextStyle(fontSize: 16)),
              );
            }
            return const SizedBox.shrink();
          }).toList(),
        ],
      ),
    );
  }
}
