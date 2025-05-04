import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/utils/api_service.dart';
import '../../../models/feed_content_block.dart';
import '../../../models/feed_quiz.dart';

class FeedUploadController extends GetxController {
  final RxList<FeedContentBlock> contentBlocks = <FeedContentBlock>[].obs;
  final RxMap<int, TextEditingController> textControllers =
      <int, TextEditingController>{}.obs;
  final RxBool isSubmitting = false.obs;
  final RxBool isUploadingImage = false.obs;
  final RxMap<String, FeedQuiz> quizzes = <String, FeedQuiz>{}.obs;

  Future<void> addImageBlock() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 1080,
      maxHeight: 768,
    );
    if (picked != null) {
      isUploadingImage.value = true;
      try {
        final url = await ApiService().uploadFileToStorage(xFile: picked);
        contentBlocks.add(FeedContentBlock.image(value: url));
      } catch (e) {
        Get.snackbar('오류', '이미지 업로드에 실패했습니다');
      } finally {
        isUploadingImage.value = false;
      }
    }
  }

  void addTextBlock() {
    final index = contentBlocks.length;
    final controller = TextEditingController();
    textControllers[index] = controller;
    contentBlocks.add(FeedContentBlock.text(value: ''));
  }

  void reorderBlocks(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final block = contentBlocks.removeAt(oldIndex);
    contentBlocks.insert(newIndex, block);
  }

  Future<void> submitFeed() async {
    isSubmitting.value = true;
    try {
      for (var i = 0; i < contentBlocks.length; i++) {
        final block = contentBlocks[i];
        if (block is FeedContentText && textControllers.containsKey(i)) {
          contentBlocks[i] = FeedContentBlock.text(
            value: textControllers[i]!.text,
          );
        }
      }

      await ApiService().createFeed(
        contentBlocks: contentBlocks,
        quizzes: quizzes.values.toList(),
      );
      Get.back();
    } catch (e) {
      Get.snackbar('오류', '피드를 업로드하지 못했습니다.');
    } finally {
      isSubmitting.value = false;
    }
  }
}
