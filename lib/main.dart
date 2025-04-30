import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'UhBee',
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, // AppBar 배경 흰색
            elevation: 0, // 그림자 없애면 더 깔끔
            titleTextStyle: TextStyle(
              color: Colors.black87, // 타이틀 글자 색
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'UhBee',
            ),
            iconTheme: IconThemeData(
              color: Colors.black87, // AppBar 아이콘 색
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFCC66), // 밝은 노란색
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              elevation: 0,
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'UhBee',
                color: Colors.brown.shade800, // 텍스트 색 (하지만 여기만 쓰면 적용은 안 돼)
              ),
              foregroundColor: Colors.brown.shade800, // 실제 텍스트/아이콘 색 지정!
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            // 하단 네비게이션 바 배경 흰색
            selectedItemColor: Colors.black87,
            // 선택된 아이콘 색
            unselectedItemColor: Colors.grey,
            // 선택 안된 아이콘 색
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
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
