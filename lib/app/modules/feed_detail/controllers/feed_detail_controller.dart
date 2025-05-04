import 'package:get/get.dart';

import '../../../../common/utils/logger.dart';
import '../../../models/feed.dart';


class FeedDetailController extends GetxController {
  late final Feed feed;
  final RxMap<String, bool> showQuiz = <String, bool>{}.obs;
  final RxMap<String, String> selectedAnswers = <String, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    feed = Get.arguments as Feed;
  }

  void toggleQuiz(String imageUrl) {
    showQuiz[imageUrl] = !(showQuiz[imageUrl] ?? false);
  }

  void selectAnswer(String imageUrl, String choice) {
    if (selectedAnswers.containsKey(imageUrl)) return;
    selectedAnswers[imageUrl] = choice;
  }

  bool isAnswered(String imageUrl) => selectedAnswers.containsKey(imageUrl);
  bool isSelected(String imageUrl, String choice) => selectedAnswers[imageUrl] == choice;
}
