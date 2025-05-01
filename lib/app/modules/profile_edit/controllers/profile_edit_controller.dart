import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/image_picker_helper.dart';
import '../../../models/user_profile.dart';

class ProfileEditController extends GetxController {
  final nicknameController = TextEditingController();
  final introController = TextEditingController();
  final avatarUrl = ''.obs;
  final isSaving = false.obs;
  final isAvatarLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final user = Get.arguments as UserProfile;
    nicknameController.text = user.nickname;
    introController.text = user.intro;
    avatarUrl.value = user.avatarUrl;
  }

  Future<void> changeAvatar() async {
    isAvatarLoading.value = true;
    try {
      final imageFile = await ImagePickerHelper.pickImage();
      if (imageFile != null) {
        final url = await ApiService().uploadFileToStorage(xFile: imageFile);
        avatarUrl.value = url;
      }
    } catch (e) {
      Get.snackbar('오류', '이미지를 변경하는 도중 문제가 발생했습니다.');
    } finally {
      isAvatarLoading.value = false;
    }
  }


  Future<void> save() async {
    final nickname = nicknameController.text.trim();
    final intro = introController.text.trim();
    final url = avatarUrl.value;

    if (nickname.isEmpty) {
      Get.snackbar('오류', '닉네임을 입력해주세요.');
      return;
    }

    isSaving.value = true;
    try {
      await ApiService().updateUserProfile(
        nickname: nickname,
        intro: intro,
        avatarUrl: url,
      );
      Get.back(result: true);
      Get.snackbar('성공', '프로필이 수정되었습니다.');
    } catch (e) {
      Get.snackbar('실패', '저장 중 오류 발생');
    } finally {
      isSaving.value = false;
    }
  }
}
