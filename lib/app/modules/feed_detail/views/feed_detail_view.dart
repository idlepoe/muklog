import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/utils/app_utils.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/app_exit_button.dart';
import '../../../models/feed_comment.dart';
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
          controller: controller.scrollController,
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
                        if (controller.isCompleted(block.value))
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Lottie.asset(
                                    'assets/animations/confetti.json',
                                    width: 80,
                                    height: 80,
                                    repeat: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    '+${quiz!.rewardPoint} 포인트 획득!',
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
            const Divider(height: 32),

            // 리액션 영역
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildReactionButton(
                    '😍',
                    controller.countLike.value,
                    () => controller.sendReaction('like'),
                  ),
                  _buildReactionButton(
                    '😂',
                    controller.countFunny.value,
                    () => controller.sendReaction('funny'),
                  ),
                  _buildReactionButton(
                    '😕',
                    controller.countBad.value,
                    () => controller.sendReaction('bad'),
                  ),
                  _buildReactionButton(
                    '💰',
                    controller.countExpensive.value,
                    () => controller.sendReaction('expensive'),
                  ),
                  _buildReactionButton(
                    '🤔',
                    controller.countInteresting.value,
                    () => controller.sendReaction('interesting'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 댓글 입력
            const Divider(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.commentController,
                    decoration: const InputDecoration(
                      hintText: '댓글을 입력하세요',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    minLines: 1,
                    maxLines: 5,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: controller.addComment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('작성'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 댓글 목록
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: Text(
                '💬 댓글',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ...controller.comments.map((FeedComment c) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage:
                          c.avatarUrl.isNotEmpty
                              ? NetworkImage(c.avatarUrl)
                              : const AssetImage(
                                    'assets/images/default_avatar.png',
                                  )
                                  as ImageProvider,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                c.nickname,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                AppUtils.timeAgo(c.createdAt),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.reportCount >= 3 ? '🚨 신고당한 댓글입니다' : c.text,
                            style: TextStyle(
                              fontStyle:
                                  c.reportCount >= 3
                                      ? FontStyle.italic
                                      : FontStyle.normal,
                              color:
                                  c.reportCount >= 3
                                      ? Colors.redAccent
                                      : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // TODO: 좋아요 처리
                                  controller.likeComment(c.commentId);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up_alt_outlined,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '좋아요 ${c.likeCount == 0 ? "" : c.likeCount}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // TODO: 신고 처리
                                  controller.reportComment(c.commentId);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.flag_outlined,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '신고',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            AppExitButton(
              text: "나가기",
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReactionButton(String emoji, int count, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF3F3F3),
            ),
            child: Text(emoji, style: const TextStyle(fontSize: 24)),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
