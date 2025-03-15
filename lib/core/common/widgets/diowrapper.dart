import 'dart:convert';
import 'package:dio/dio.dart';

class DioWrapper {
  static final DioWrapper _instance = DioWrapper._internal();
  late final Dio _dio;
  final int _timeOut = 120 * 1000;

  factory DioWrapper() {
    return _instance;
  }

  DioWrapper._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://nti-production.up.railway.app/api/', 
        connectTimeout: Duration(milliseconds: _timeOut),
        receiveTimeout: Duration(milliseconds: _timeOut),
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
      if (data == null || data.isEmpty) {
        print("⚠️ Error: No data provided for POST request!");
        return null;
      }

print("🔍 Attempting register with: ${data.toString()}");
      if (!data.containsKey("username") || data["username"] == null || data["username"].trim().isEmpty) {
  print("❌ Error: Username is missing or empty!");
  return null;
}

      Response response = await _dio.post(
        endpoint,
  data: FormData.fromMap(data),
options: Options(
  contentType: "multipart/form-data",
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      return response;
    } on DioException catch (e) {
      print("⚠️ DioException: ${e.response?.statusCode} - ${e.message}");
      return e.response;
    } catch (e) {
      print("⚠️ Unexpected Error: $e");
      return null;
    }
  }
}
