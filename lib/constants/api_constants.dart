class ApiConstants {
  static const baseUrl = "https://asia-northeast3-muklog.cloudfunctions.net";

  // 🧑‍💼 USER
  static const String createUserProfile = "/createUserProfile";
  static const String getUserProfile = "/getUserProfile";
  static const String updateUserProfile = "/updateUserProfile";
  static const String updateFcmToken = "/updateFcmToken";
  static const String getPointHistory = "/getPointHistory";

  // ❓ QUESTION
  static const String createQuestion = "/createQuestion";
  static const String getMyQuestions = "/getMyQuestions";
  static const String getQuestionDetail = "/getQuestionDetail";
  static const String getDailyQuestions = "/getDailyQuestions";
  static const String submitAnswer = "/submitAnswer";
  static const String checkAlreadySolved = "/checkAlreadySolved";
  static const String likeQuestion = "/likeQuestion";

  // 👥 FOLLOW
  static const String getFollowers = "/getFollowers";
  static const String getFollowing = "/getFollowing";
  static const String toggleFollow = "/toggleFollow";
  static const String isFollowing = "/isFollowing";

  // 🏆 RANKING
  static const String getRankingList = "/getRankingList";
  static const String getFollowingRanking = "/getFollowingRanking";
  static const String getRecentLevelUps = "/getRecentLevelUps";

  // 🔔 NOTIFICATION
  static const String getNotifications = "/getNotifications";

  // 📰 FEED
  static const String getFollowingFeed = "/getFollowingFeed";
  static const String getFeeds = "/getFeeds";
  static const String createFeed = "/createFeed";
  static const String rewardPoint = "/rewardPoint";
  static const String addFeedComment = "/addFeedComment";
  static const String sendFeedReaction = "/sendFeedReaction";
  static const String likeFeedComment = "/likeFeedComment";
  static const String reportFeedComment = "/reportFeedComment";
  static const String getFeedComments = "/getFeedComments";
}
