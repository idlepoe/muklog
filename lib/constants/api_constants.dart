class ApiConstants {
  static const baseUrl = "https://asia-northeast3-eunhasu-message.cloudfunctions.net";

  // 경로 정의
  static const String onUserSignup = "/onUserSignup";
  static const String getUserProfile = "/getUserProfile";
  static const String updateUserProfile = "/updateUserProfile";
  static const String sendStarMessage = "/sendStarMessage";
  static const String getStarMessages = "/getStarMessages";
  static const String createChatRoom = "/createChatRoom";
  static const String sendChatMessage = "/sendChatMessage";
  static const String getChatRoomMessages = "/getChatRoomMessages";
  static const String getChatRoomList = "/getChatRoomList";
  static const String blockUser = "/blockUser";
  static const String getBlockedUsers = "/getBlockedUsers";
  static const String deleteAccount = "/deleteAccount";
  static const String sendNewMessageNotification = "/sendNewMessageNotification";
}