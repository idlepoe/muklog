import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/feed_quiz_dialog.dart';
import '../../../models/feed_content_block.dart';
import '../controllers/feed_upload_controller.dart';

class FeedUploadView extends GetView<FeedUploadController> {
  const FeedUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('먹로그 작성')),
      body: Obx(() {
        if (controller.isUploadingImage.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                Text("이미지를 업로드 중입니다..."),
              ],
            ),
          );
        }
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: controller.contentBlocks.length,
          onReorder: controller.reorderBlocks,
          itemBuilder: (context, index) {
            final block = controller.contentBlocks[index];
            if (block is FeedContentImage) {
              return Card(
                key: ValueKey('image_$index'),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Image.network(block.value),
                          trailing: ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // TODO: 퀴즈 추가 다이얼로그 열기
                          final quiz = await showFeedQuizDialog(
                            context,
                            block.value,
                            existingQuiz: controller.quizzes[block.value],
                          );
                          if (quiz != null) {
                            controller.quizzes[block.value] = quiz;
                          }
                        },
                        icon: const Icon(Icons.quiz),
                        label: const Text('퀴즈'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          textStyle: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (block is FeedContentText) {
              final textController = controller.textControllers.putIfAbsent(
                index,
                () => TextEditingController(text: block.value),
              );
              return Card(
                key: ValueKey('text_$index'),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: theme.cardColor,
                child: ListTile(
                  title: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: '설명을 입력하세요',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                  trailing: ReorderableDragStartListener(
                    index: index,
                    child: const Icon(Icons.drag_handle),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      }),
      floatingActionButton: Obx(
        () =>
            controller.isSubmitting.value
                ? const CircularProgressIndicator()
                : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      heroTag: 'addImage',
                      onPressed: controller.addImageBlock,
                      child: const Icon(Icons.image),
                      tooltip: '사진 추가',
                    ),
                    const SizedBox(height: 12),
                    FloatingActionButton(
                      heroTag: 'addText',
                      onPressed: controller.addTextBlock,
                      child: const Icon(Icons.text_fields),
                      tooltip: '설명 추가',
                    ),
                    const SizedBox(height: 12),
                    FloatingActionButton(
                      heroTag: 'submit',
                      onPressed: controller.submitFeed,
                      child: const Icon(Icons.send),
                      tooltip: '업로드',
                    ),
                  ],
                ),
      ),
    );
  }
}
