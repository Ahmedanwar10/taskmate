import 'package:dio/dio.dart';

class DioWrapper {
  static final DioWrapper _instance = DioWrapper._internal();
  factory DioWrapper() => _instance;

  late final Dio _dio;
  final int _timeOut = 120 * 1000;
  String? _authToken; // 🔥 تخزين التوكن هنا

  /// 🔹 **تهيئة Dio وإضافة Interceptors**
  DioWrapper._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://nti-production.up.railway.app/api/',
      connectTimeout: Duration(milliseconds: _timeOut),
      receiveTimeout: Duration(milliseconds: _timeOut),
      headers: {"Accept": "application/json"},
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  /// 🚀 **Interceptor لتسجيل الطلبات**
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("🚀 Requesting: ${options.method} ${options.uri}");
    print("📤 Headers: ${options.headers}");
    print("📦 Data Sent: ${options.data}");
    handler.next(options);
  }

  /// ✅ **Interceptor لتسجيل الاستجابات**
  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ Response: ${response.statusCode}");
    print("📥 Response Data: ${response.data}");
    handler.next(response);
  }

  /// ❌ **Interceptor لتسجيل الأخطاء**
  void _onError(DioException error, ErrorInterceptorHandler handler) {
    print("❌ Dio Error: ${error.response?.statusCode}");
    print("⚠️ Error Message: ${error.message}");
    print("📦 Error Response Data: ${error.response?.data}");
    handler.next(error);
  }

  /// 🔑 **إدارة التوكن**
  void setToken(String? token) {
    _authToken = token;
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    } else {
      _dio.options.headers.remove("Authorization");
    }
  }

  /// 🚪 **مسح التوكن عند تسجيل الخروج**
  void clearToken() {
    _authToken = null;
    _dio.options.headers.remove("Authorization");
  }

  /// 📌 **إرسال `POST`**
  Future<Response?> postRequest(String endpoint, {Map<String, dynamic>? data, bool requiresAuth = false}) async {
    return _handleRequest(() async {
      return await _dio.post(
        endpoint,
        data: FormData.fromMap(data ?? {}),
        options: Options(
          contentType: "multipart/form-data",
          headers: _getHeaders(requiresAuth),
        ),
      );
    });
  }

  /// ✏️ **إرسال `PUT`**
  Future<Response?> putRequest(String endpoint, {Map<String, dynamic>? data, bool requiresAuth = false}) async {
    return _handleRequest(() async {
      return await _dio.put(
        endpoint,
        data: FormData.fromMap(data ?? {}),
        options: Options(
          contentType: "multipart/form-data",
          headers: _getHeaders(requiresAuth),
        ),
      );
    });
  }

  /// 📡 **إرسال `GET`**
  Future<Response?> getRequest(String endpoint, {bool requiresAuth = false}) async {
    return _handleRequest(() async {
      return await _dio.get(
        endpoint,
        options: Options(headers: _getHeaders(requiresAuth)),
      );
    });
  }

  /// 🗑 **إرسال `DELETE`**
  Future<Response?> deleteRequest(String endpoint, {bool requiresAuth = false}) async {
    return _handleRequest(() async {
      return await _dio.delete(
        endpoint,
        options: Options(headers: _getHeaders(requiresAuth)),
      );
    });
  }

  /// ⚙️ **دالة لمعالجة الطلبات وتقليل التكرار**
  Future<Response?> _handleRequest(Future<Response> Function() request) async {
    try {
      Response response = await request();
      return response;
    } on DioException catch (e) {
      print("⚠️ DioException: ${e.response?.statusCode} - ${e.message}");
      return e.response;
    } catch (e) {
      print("⚠️ Unexpected Error: $e");
      return null;
    }
  }

  /// 🔥 **إرجاع الهيدرز بناءً على الحاجة لـ Authorization**
  Map<String, String> _getHeaders(bool requiresAuth) {
    final headers = {"Accept": "application/json"};
    if (requiresAuth && _authToken != null) {
      headers["Authorization"] = "Bearer $_authToken";
    }
    return headers;
  }
}
