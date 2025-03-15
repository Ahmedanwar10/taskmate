import 'package:dio/dio.dart';
import 'dart:convert';

class DioWrapper {
  static final DioWrapper _instance = DioWrapper._internal();
  late final Dio _dio;

  factory DioWrapper() {
    return _instance;
  }

  DioWrapper._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://nti-production.up.railway.app/api/', // تأكد من صحة الـ API URL
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("🚀 Requesting: ${options.uri}");
          print("📤 Headers: ${options.headers}");
          print("📦 Data Sent: ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ Response: ${response.statusCode}");
          print("📥 Response Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          print("❌ Dio Error: ${error.response?.statusCode}");
          print("⚠️ Error Message: ${error.message}");
          print("📦 Error Response Data: ${error.response?.data}");
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response?> postRequest(String endpoint, {Map<String, dynamic>? data}) async {
  try {
    Response response = await _dio.post(
      endpoint,
      data: jsonEncode(data),
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (status) => status! < 500, // لن يرمي خطأ عند HTTP 400
      ),
    );
    return response;
  } catch (e) {
    print("⚠️ POST Error: $e");
    return null;
  }
}
}