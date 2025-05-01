import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muklog/app/routes/app_pages.dart';

import '../../../../common/utils/app_service.dart';

class InitUserProfileController extends GetxController {
  final nickname = ''.obs;
  final intro = ''.obs;
  final imageFile = Rxn<XFile>();

  final isLoading = false.obs;

  final picker = ImagePicker();
  final api = ApiService();

  void pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile.value = picked;
    }
  }

  Future<void> submitProfile() async {
    if (nickname.value.trim().isEmpty) {
      Get.snackbar('입력 오류', '닉네임을 입력해주세요');
      return;
    }

    isLoading.value = true;
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw Exception('로그인 정보 없음');

      String avatarUrl = '';
      if (imageFile.value != null) {
        avatarUrl = await api.uploadFileToStorage(xFile: imageFile.value!);
      }

      await api.createUserProfile(
        uid: uid,
        nickname: nickname.value.trim(),
        intro: intro.value.trim(),
        avatarUrl: avatarUrl,
      );

      Get.offAllNamed(Routes.SPLASH);
    } catch (e) {
      Get.snackbar('프로필 생성 실패', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
