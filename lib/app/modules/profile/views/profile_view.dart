import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../routes/app_pages.dart';
import '../../profile_edit/views/profile_edit_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('프로필')),
      body: Obx(() {
        final user = controller.user.value;
        if (user == null)
          return const Center(child: CircularProgressIndicator());

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage:
                    user.avatarUrl.isNotEmpty
                        ? NetworkImage(user.avatarUrl)
                        : AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
              ),
              const SizedBox(height: 12),
              Text(
                user.nickname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(user.title, style: const TextStyle(color: Colors.blueGrey)),
              const SizedBox(height: 8),
              if (user.intro.isNotEmpty)
                Text(
                  user.intro,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),

              const SizedBox(height: 24),
              _StatRow(label: '레벨', value: 'Lv. ${user.level}'),
              _StatRow(label: '포인트', value: '${user.point}'),
              _StatRow(label: '출제 수', value: '${user.questionCount}개'),
              _StatRow(
                label: '정답률',
                value: '${user.correctRate.toStringAsFixed(1)}%',
              ),
              _StatRow(label: '팔로워', value: '${user.followerCount}명'),
              _StatRow(label: '팔로잉', value: '${user.followingCount}명'),

              const SizedBox(height: 16),
              Text(
                '가입일: ${user.createdAt.toLocal().toString().split(' ').first}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 50),
              AppButton(
                text: "프로필 수정",
                onPressed: () async {
                  await Get.toNamed(Routes.PROFILE_EDIT, arguments: user);
                  await controller.loadUserProfile();
                },
              ),
              SizedBox(height: 50),

              if (FirebaseAuth.instance.currentUser?.isAnonymous == true)
                AppButton(
                  text: "Google 계정으로 전환",
                  onPressed: () => controller.upgradeGuestToGoogle(),
                ),

              AppButton(
                text: "로그아웃",
                onPressed: () async {
                  // 🔥 GoogleSignIn 연결 해제
                  await GoogleSignIn().signOut();

                  // ✅ Firebase 인증 해제
                  await FirebaseAuth.instance.signOut();

                  await Get.offAllNamed(Routes.SPLASH);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
