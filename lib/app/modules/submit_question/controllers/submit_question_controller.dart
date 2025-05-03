import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muklog/app/modules/home/controllers/home_controller.dart';
import 'package:muklog/common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/point_gain_dialog.dart';
import '../../../models/generated_question.dart';
import '../../../routes/app_pages.dart';
import '../../profile/controllers/profile_controller.dart';

class SubmitQuestionController extends GetxController {
  final Rx<SubmitStep> step = SubmitStep.idle.obs;

  String get loadingMessage {
    switch (step.value) {
      case SubmitStep.pickingImage:
        return '사진을 선택 중입니다...';
      case SubmitStep.generatingQuestion:
        return 'AI가 문제를 생성 중입니다...';
      case SubmitStep.submittingToServer:
        return '문제를 서버에 전송 중입니다...';
      default:
        return '';
    }
  }

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

    try {
      step.value = SubmitStep.pickingImage;
      final imageUrl = await ApiService().uploadFileToStorage(
        xFile: selectedImage.value!,
      );
      step.value = SubmitStep.submittingToServer;
      final question = await ApiService().generateQuestionFromImage(
        imageUrl: imageUrl,
        userPrice: priceController.text,
      );
      generatedQuestion.value = question;
    } catch (e) {
      logger.e(e);
      Get.snackbar('오류 발생', '문제 생성에 실패했습니다.');
    } finally {
      step.value = SubmitStep.idle;
    }
  }

  Future<void> submitQuestion() async {
    if (generatedQuestion.value == null) return;

    step.value = SubmitStep.submittingToServer;
    try {
      final response = await ApiService().createQuestion(
        generatedQuestion.value!,
      );

      final point = response['pointGained'] ?? 0;
      final levelUp = response['levelUp'] == true;
      final newLevel = response['newLevel'];

      resetForm();

      await showDialog(
        context: Get.context!,
        builder:
            (_) => PointGainDialog(
              points: point,
              levelUp: levelUp,
              newLevel: newLevel,
            ),
      );

      await Get.find<ProfileController>().loadUserProfile();

      Get.back(); // 출제 후 메인으로 복귀
    } catch (e) {
      Get.snackbar('출제 실패', '서버와의 통신 중 오류가 발생했습니다.');
    } finally {
      step.value = SubmitStep.idle;
      final currentRoute = Get.currentRoute;
      if (currentRoute == Routes.SUBMIT_QUESTION) {
        Get.back(); // 이미 같은 화면이라면 뒤로 가기
      } else {
        Get.find<HomeController>().changeTab(3);
      }
    }
  }

  void resetForm() {
    selectedImage.value = null;
    priceController.clear();
    generatedQuestion.value = null;
  }
}

enum SubmitStep { idle, pickingImage, generatingQuestion, submittingToServer }
