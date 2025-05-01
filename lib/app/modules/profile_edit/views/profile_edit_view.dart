import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('프로필 수정')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap:
                    controller.isAvatarLoading.value
                        ? null
                        : controller.changeAvatar,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(controller.avatarUrl.value),
                    ),
                    if (controller.isAvatarLoading.value)
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    else
                      const Positioned(
                        right: 4,
                        bottom: 4,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit, size: 16),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.nicknameController,
                decoration: const InputDecoration(labelText: '닉네임'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.introController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: '소개글'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: controller.isSaving.value ? null : controller.save,
              child:
                  controller.isSaving.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('저장하기'),
            ),
          ),
        ),
      ),
    );
  }
}
