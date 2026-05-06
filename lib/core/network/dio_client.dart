import 'package:dio/dio.dart';
import 'package:nti_final_project/core/storage/token_storage.dart';
import 'package:nti_final_project/core/utils/app_constants.dart';

class DioClient {
  DioClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage.getToken();

        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },
    ),
  );
}