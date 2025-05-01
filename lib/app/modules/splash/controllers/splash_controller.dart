import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/utils/api_service.dart';
import '../../../routes/app_pages.dart'; // ← AppService import

class SplashController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _api = ApiService();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 1));

    final user = _auth.currentUser;

    if (user == null) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    }
    try {
      final hasProfile = await _api.getUserProfile();
      if (hasProfile != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.INIT_USER_PROFILE);
      }
    } catch (e) {
      Get.snackbar(e.toString(),e.toString());
    }
  }
}
