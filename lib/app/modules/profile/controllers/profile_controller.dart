import 'package:get/get.dart';
import '../../../../common/utils/api_service.dart';
import '../../../models/user_profile.dart'; // user profile 불러오는 서비스

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
}
