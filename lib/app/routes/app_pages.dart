import 'package:get/get.dart';

import '../modules/daily_question/bindings/daily_question_binding.dart';
import '../modules/daily_question/views/daily_question_view.dart';
import '../modules/feed_following/bindings/feed_following_binding.dart';
import '../modules/feed_following/views/feed_following_view.dart';
import '../modules/followers/bindings/followers_binding.dart';
import '../modules/followers/views/followers_view.dart';
import '../modules/following/bindings/following_binding.dart';
import '../modules/following/views/following_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image_preview/bindings/image_preview_binding.dart';
import '../modules/image_preview/views/image_preview_view.dart';
import '../modules/init_user_profile/bindings/init_user_profile_binding.dart';
import '../modules/init_user_profile/views/init_user_profile_view.dart';
import '../modules/item_edit/bindings/item_edit_binding.dart';
import '../modules/item_edit/views/item_edit_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_questions/bindings/my_questions_binding.dart';
import '../modules/my_questions/views/my_questions_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/point_history/bindings/point_history_binding.dart';
import '../modules/point_history/views/point_history_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/profile_edit/views/profile_edit_view.dart';
import '../modules/question_detail/bindings/question_detail_binding.dart';
import '../modules/question_detail/views/question_detail_view.dart';
import '../modules/ranking/bindings/ranking_binding.dart';
import '../modules/ranking/views/ranking_view.dart';
import '../modules/ranking_following/bindings/ranking_following_binding.dart';
import '../modules/ranking_following/views/ranking_following_view.dart';
import '../modules/recent_levelup/bindings/recent_levelup_binding.dart';
import '../modules/recent_levelup/views/recent_levelup_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/submit_question/bindings/submit_question_binding.dart';
import '../modules/submit_question/views/submit_question_view.dart';
import '../modules/submit_success/bindings/submit_success_binding.dart';
import '../modules/submit_success/views/submit_success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.INIT_USER_PROFILE,
      page: () => const InitUserProfileView(),
      binding: InitUserProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_QUESTION,
      page: () => const DailyQuestionView(),
      binding: DailyQuestionBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_DETAIL,
      page: () => const QuestionDetailView(),
      binding: QuestionDetailBinding(),
    ),
    GetPage(
      name: _Paths.FEED_FOLLOWING,
      page: () => const FeedFollowingView(),
      binding: FeedFollowingBinding(),
    ),
    GetPage(
      name: _Paths.SUBMIT_QUESTION,
      page: () => const SubmitQuestionView(),
      binding: SubmitQuestionBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_PREVIEW,
      page: () => const ImagePreviewView(),
      binding: ImagePreviewBinding(),
    ),
    GetPage(
      name: _Paths.ITEM_EDIT,
      page: () => const ItemEditView(),
      binding: ItemEditBinding(),
    ),
    GetPage(
      name: _Paths.SUBMIT_SUCCESS,
      page: () => const SubmitSuccessView(),
      binding: SubmitSuccessBinding(),
    ),
    GetPage(
      name: _Paths.RANKING,
      page: () => const RankingView(),
      binding: RankingBinding(),
    ),
    GetPage(
      name: _Paths.RECENT_LEVELUP,
      page: () => const RecentLevelupView(),
      binding: RecentLevelupBinding(),
    ),
    GetPage(
      name: _Paths.RANKING_FOLLOWING,
      page: () => const RankingFollowingView(),
      binding: RankingFollowingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT,
      page: () => const ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.MY_QUESTIONS,
      page: () => const MyQuestionsView(),
      binding: MyQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.FOLLOWERS,
      page: () => const FollowersView(),
      binding: FollowersBinding(),
    ),
    GetPage(
      name: _Paths.FOLLOWING,
      page: () => const FollowingView(),
      binding: FollowingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.POINT_HISTORY,
      page: () => const PointHistoryView(),
      binding: PointHistoryBinding(),
    ),
  ];
}
