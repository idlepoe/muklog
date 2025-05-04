import 'package:get/get.dart';

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
    if (selectedAnswers.containsKey(imageUrl)) return; // 이미 선택된 경우 무시
    selectedAnswers[imageUrl] = choice;
  }

  bool isCorrect(String imageUrl) {
    final quiz = feed.quizzes!.firstWhereOrNull((q) => q.imageUrl == imageUrl);
    return quiz != null && selectedAnswers[imageUrl] == quiz.answer;
  }
}