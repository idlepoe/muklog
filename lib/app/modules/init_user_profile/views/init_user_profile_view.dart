import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/init_user_profile_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/init_user_profile_controller.dart';

class InitUserProfileView extends GetView<InitUserProfileController> {
  const InitUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('프로필 설정')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(
              () => Column(
            children: [
              GestureDetector(
                onTap: controller.pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: controller.imageFile.value != null
                      ? FileImage(File(controller.imageFile.value!.path))
                      : const AssetImage('assets/images/default_avatar.png')
                  as ImageProvider,
                  child: controller.imageFile.value == null
                      ? const Icon(Icons.add_a_photo, size: 28,color: Colors.deepPurpleAccent,)
                      : null,
                ),
              ),
              const SizedBox(height: 16),

              // 닉네임 입력
              TextField(
                onChanged: (v) => controller.nickname.value = v,
                decoration: const InputDecoration(
                  labelText: '닉네임',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // 자기소개 입력
              TextField(
                onChanged: (v) => controller.intro.value = v,
                decoration: const InputDecoration(
                  labelText: '자기소개 (선택)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 24),

              // 완료 버튼
              ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.submitProfile,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('시작하기'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
