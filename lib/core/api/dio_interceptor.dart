import 'package:dio/dio.dart';
import 'package:lms/core/consts/shared_prefs_keys.dart';
import 'package:lms/core/exceptions/my_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
       // Get SharedPreferences instance
      final prefs = await SharedPreferences.getInstance();

      // Add auth token if available
      final authToken = prefs.getString(SharedPrefsKeys.authToken);
      if (authToken != null && authToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $authToken';
      }

      // Continue with the request
      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: CacheException("Failed to access local storage"),
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    
    super.onError(err, handler);
  }
}
