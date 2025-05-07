import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../models/user_profile.dart';
import '../../../routes/app_pages.dart'; // user profile 불러오는 서비스

class ProfileController extends GetxController {
  final Rxn<UserProfile> user = Rxn<UserProfile>();

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      final result = await ApiService().getUserProfile(); // Cloud Function 호출
      user.value = result;
    } catch (e) {
      Get.snackbar('오류', '프로필 정보를 불러오지 못했습니다.');
    }
  }

  Future<void> upgradeGuestToGoogle() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null || !currentUser.isAnonymous) {
        Get.snackbar('오류', '익명 계정이 아닙니다.');
        return;
      }

      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        // ✅ 익명 계정 → Google 계정으로 전환
        await currentUser.linkWithCredential(credential);
        Get.snackbar('성공', 'Google 계정과 연결되었습니다!');
        Get.offAllNamed(Routes.SPLASH);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'credential-already-in-use') {
          // ❗ 이미 연결된 경우: 해당 계정으로 로그인
          final result = await FirebaseAuth.instance.signInWithCredential(
            credential,
          );
          Get.snackbar('연결된 계정 사용됨', '기존 Google 계정으로 로그인되었습니다.');
          Get.offAllNamed(Routes.SPLASH);
        } else {
          rethrow;
        }
      }
    } catch (e) {
      logger.e("Google 계정 전환 실패: $e");
      Get.snackbar('전환 실패', e.toString());
    }
  }
}
