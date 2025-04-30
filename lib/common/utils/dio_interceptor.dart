import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as g;
import 'package:logger/logger.dart';

import '../../app/routes/app_pages.dart';
import 'logger.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logger.i("🚀 [REQUEST] ${options.method} ${options.uri}");
    logger.d("Headers: ${options.headers}");
    logger.d("Data: ${options.data}");

    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user?.getIdToken();

    if (idToken != null) {
      options.headers['Authorization'] = 'Bearer $idToken';
    }

    return handler.next(options); // 계속 진행

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      "✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}",
    );
    logger.d("Response Data: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e("❌ [ERROR] ${err.response?.statusCode} ${err.requestOptions.uri}");
    logger.e("Message: ${err.message}");
    logger.e("Error Data: ${err.response?.data}");

    // 🔥 401 Unauthorized 에러 처리 추가
    if (err.response?.statusCode == 401) {
      logger.w("⚠️ Unauthorized! Signing out...");
      await FirebaseAuth.instance.signOut();
      g.Get.offAllNamed(Routes.SPLASH); // 로그인 화면으로 보내기 (라우트는 네 앱에 맞게 수정)
    }

    super.onError(err, handler);
  }
}
