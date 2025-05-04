import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/utils/api_service.dart';
import '../../../../common/utils/logger.dart';
import '../../../models/feed.dart';
import '../../../models/feed_comment.dart';

class FeedDetailController extends GetxController {
  late final Feed feed;
  final RxMap<String, bool> showQuiz = <String, bool>{}.obs;
  final RxMap<String, String> selectedAnswers = <String, String>{}.obs;
  final RxSet<String> completedQuizImages = <String>{}.obs;

  final RxInt countLike = 0.obs;
  final RxInt countFunny = 0.obs;
  final RxInt countBad = 0.obs;
  final RxInt countExpensive = 0.obs;
  final RxInt countInteresting = 0.obs;

  final RxList<FeedComment> comments = <FeedComment>[].obs;
  final TextEditingController commentController = TextEditingController();


  final RxSet<String> reactedTypes = <String>{}.obs;
  final RxMap<String, bool> animateReactions = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    feed = Get.arguments as Feed;
    _loadCompletedQuizzes();
    countLike.value = feed.countLike;
    countFunny.value = feed.countFunny;
    countBad.value = feed.countBad;
    countExpensive.value = feed.countExpensive;
    countInteresting.value = feed.countInteresting;
  }

  void toggleQuiz(String imageUrl) {
    showQuiz[imageUrl] = !(showQuiz[imageUrl] ?? false);
  }

  Future<void> selectAnswer(String imageUrl, String choice) async {
    if (selectedAnswers.containsKey(imageUrl)) return;
    selectedAnswers[imageUrl] = choice;
    final quiz = feed.quizzes!.firstWhereOrNull((q) => q.imageUrl == imageUrl);
    if (quiz != null && quiz.answer == choice) {
      await _rewardUser(quiz.rewardPoint);
    }
    completedQuizImages.add(imageUrl);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'completedQuizzes_${feed.feedId}',
      completedQuizImages.toList(),
    );
  }

  bool isAnswered(String imageUrl) => selectedAnswers.containsKey(imageUrl);

  bool isSelected(String imageUrl, String choice) =>
      selectedAnswers[imageUrl] == choice;

  bool isCompleted(String imageUrl) => completedQuizImages.contains(imageUrl);

  Future<void> _loadCompletedQuizzes() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('completedQuizzes_${feed.feedId}') ?? [];
    completedQuizImages.addAll(stored);
  }

  Future<int> _rewardUser(int reward) async {
    try {
      final response = await ApiService().rewardPoint({'point': reward});
      return response['currentPoint'] ?? reward;
    } catch (_) {
      return reward;
    }
  }

  Future<void> sendReaction(String type) async {
    if (reactedTypes.contains(type)) return; // 1회 제한
    try {
      await ApiService().sendFeedReaction(feed.feedId, type);
      reactedTypes.add(type);
      animateReactions[type] = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        animateReactions[type] = false;
      });

      if (type == 'like') countLike.value++;
      if (type == 'funny') countFunny.value++;
      if (type == 'bad') countBad.value++;
      if (type == 'expensive') countExpensive.value++;
      if (type == 'interesting') countInteresting.value++;
    } catch (_) {
      Get.snackbar('오류', '리액션 처리 중 문제가 발생했습니다.');
    }
  }

  Future<void> addComment() async {
    final text = commentController.text.trim();
    if (text.isEmpty) return;

    try {
      final newCommentJson = await ApiService().addFeedComment(feed.feedId, text);
      final newComment = FeedComment.fromJson(newCommentJson);
      comments.add(newComment);
      commentController.clear();
    } catch (e) {
      Get.snackbar('오류', '댓글 작성에 실패했습니다.');
    }
  }


  Future<void> likeComment(String commentId) async {
    try {
      await ApiService().likeFeedComment(feed.feedId, commentId);
      final idx = comments.indexWhere((c) => c.commentId == commentId);
      if (idx != -1) comments[idx] = comments[idx].copyWith(likeCount: comments[idx].likeCount + 1);
    } catch (_) {
      Get.snackbar('오류', '댓글 좋아요 실패');
    }
  }

  Future<void> reportComment(String commentId) async {
    try {
      await ApiService().reportFeedComment(feed.feedId, commentId);
      Get.snackbar('신고 완료', '신고가 접수되었습니다.');
    } catch (_) {
      Get.snackbar('오류', '신고 실패');
    }
  }
}
