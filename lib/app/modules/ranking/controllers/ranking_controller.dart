import 'package:get/get.dart';

import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../models/user_ranking.dart';

class RankingController extends GetxController {
  final RxList<UserRanking> pointRanking = <UserRanking>[].obs;
  final RxList<UserRanking> levelUpRanking = <UserRanking>[].obs;
  final RxList<UserRanking> questionRanking = <UserRanking>[].obs;
  final RxList<UserRanking> accuracyRanking = <UserRanking>[].obs;
  final Rxn<Map<String, dynamic>> myPointRank = Rxn<Map<String, dynamic>>();

  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRankings();
  }

  Future<void> fetchRankings() async {
    try {
      isLoading.value = true;
      final result = await ApiService().getRankingList();
      pointRanking.assignAll(
        result['pointRanking'] as List<UserRanking>? ?? [],
      );
      levelUpRanking.assignAll(
        result['levelUpRanking'] as List<UserRanking>? ?? [],
      );
      questionRanking.assignAll(
        result['questionRanking'] as List<UserRanking>? ?? [],
      );
      accuracyRanking.assignAll(
        result['accuracyRanking'] as List<UserRanking>? ?? [],
      );
      if (result['myPointRank'] != null) {
        myPointRank.value = result['myPointRank'] as Map<String, dynamic>?;
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar('랭킹 오류', '랭킹 데이터를 불러오는 데 실패했어요.');
    } finally {
      isLoading.value = false;
    }
  }
}
