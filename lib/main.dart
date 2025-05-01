import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:muklog/constants/theme.dart';

import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';
import 'common/utils/fcm.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotification();
  setUrlStrategy(PathUrlStrategy()); // 🔥 이 줄 추가

  runApp(
    FlutterWebFrame(
      builder:
          (context) => GetMaterialApp(
        title: "진품먹품",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        unknownRoute: GetPage(
          name: '/notfound',
          page: () => SplashView(),
          transition: Transition.fade,
        ),
      ),
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      backgroundColor: Colors.grey.shade300,
    ),
  );
}
