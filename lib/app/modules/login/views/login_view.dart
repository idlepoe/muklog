import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 로고 이미지 or 텍스트
                Image.asset('assets/images/logo.png', width: size.width * 0.4),
                const SizedBox(height: 48),
                const Text(
                  '진짜 가격을 맞춰보세요!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 64),

                // Google 로그인 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: controller.signInWithGoogle,
                    icon: Image.asset(
                      'assets/images/google_logo.webp',
                      width: 24,
                      height: 24,
                    ),
                    label: const Text('Google로 시작하기'),
                  ),
                ),
                const SizedBox(height: 64),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => controller.signInAsGuest(),
                    icon: const Icon(Icons.person_outline),
                    label: const Text('게스트로 시작하기'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
