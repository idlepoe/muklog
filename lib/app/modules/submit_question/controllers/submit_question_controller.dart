import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muklog/common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/point_gain_dialog.dart';
import '../../../models/generated_question.dart';

class SubmitQuestionController extends GetxController {
  final Rx<XFile?> selectedImage = Rx<XFile?>(null);
  final Rx<GeneratedQuestion?> generatedQuestion = Rx<GeneratedQuestion?>(null);
  final RxBool isLoading = false.obs;

  final TextEditingController priceController = TextEditingController();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  Future<void> generateQuestion() async {
    if (selectedImage.value == null || priceController.text.isEmpty) {
      Get.snackbar('입력 필요', '사진과 가격을 모두 입력해주세요.');
      return;
    }

    isLoading.value = true;
    try {
      final question = await ApiService().generateQuestionFromImage(
        xFile: selectedImage.value!,
        userPrice: priceController.text,
      );
      generatedQuestion.value = question;
    } catch (e) {
      logger.e(e);
      Get.snackbar('오류 발생', '문제 생성에 실패했습니다.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitQuestion() async {
    if (generatedQuestion.value == null) return;

    isLoading.value = true;
    try {
      final response = await ApiService().createQuestion(
        generatedQuestion.value!,
      );
      final point = response['pointGained'] ?? 0;

      resetForm();

      await showDialog(
        context: Get.context!,
        builder: (_) => PointGainDialog(points: point),
      );

      Get.back(); // 출제 후 메인으로 복귀
    } catch (e) {
      Get.snackbar('출제 실패', '서버와의 통신 중 오류가 발생했습니다.');
    } finally {
      isLoading.value = false;
    }
  }

  void resetForm() {
    selectedImage.value = null;
    priceController.clear();
    generatedQuestion.value = null;
  }
}
