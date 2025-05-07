import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:muklog/app/routes/app_pages.dart';

import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';

class LoginController extends GetxController {
  Timer? _loginCheckTimer;
  bool isChecking = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _api = ApiService();

  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        if (_loginCheckTimer != null) {
          _loginCheckTimer?.cancel();
        }
        // 🔥 Web에서 popup 방식 사용
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        FirebaseAuth.instance.signInWithPopup(googleProvider);
        startLoginChecker();
        isChecking = true;
      } else {
        final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: ['email'],
          serverClientId:
              '68241899379-31ma7fhvmgu4gpirqvk4lgim401lrp6g.apps.googleusercontent.com',
        );

        // Mobile 방식
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        if (googleUser == null) return; // 로그인 취소 시
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        logger.d(credential);

        await FirebaseAuth.instance.signInWithCredential(credential);

        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      logger.e("로그인 실패: $e");
      Get.snackbar('로그인 오류', e.toString());
    }
  }

  /// 🔹 게스트 로그인
  Future<void> signInAsGuest() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      final user = userCredential.user;
      logger.i("✅ 게스트 로그인: ${user?.uid}");

      // 향후 닉네임 설정 등의 분기 필요 시 구분 가능
      Get.offAllNamed(Routes.SPLASH);
    } catch (e) {
      logger.e("게스트 로그인 실패: $e");
      Get.snackbar('게스트 로그인 오류', e.toString());
    }
  }

  void startLoginChecker() {
    _loginCheckTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        logger.d("✅ 로그인 성공: ${user.displayName}");
        timer.cancel();
        Get.offAllNamed(Routes.SPLASH);
      }
    });
  }
}
