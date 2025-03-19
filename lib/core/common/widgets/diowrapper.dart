import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class DioWrapper {
  static final DioWrapper _instance = DioWrapper._internal();
  factory DioWrapper() => _instance;

  late final Dio _dio;
  final int _timeOut = 120 * 1000;
  String? _authToken;
  bool _isRefreshing = false;
  final List<void Function(String)> _tokenQueue = []; // 🔥 تخزين التوكن هنا

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

  Future<void> initialize() async {
    var box = Hive.box<String>('authBox');

    String? token = box.get('token');
    String? refreshToken = box.get('refresh_token');

    print("🔑 Token from Hive: $token");
    print("🔄 Stored Refresh Token from Hive: $refreshToken");

    if (token != null) {
      setToken(token);
    } else {
      print("⚠️ No Access Token Found in Hive!");
    }
  }

  /// 🚀 **Interceptor لتسجيل الطلبات**
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("🚀 Requesting: ${options.method} ${options.uri}");
    print("📤 Headers: ${options.headers}"); // ✅ ستظهر هنا أي توكن مُرسل
    print("📦 Data Sent: ${options.data}");
    handler.next(options);
  }

  /// ✅ **Interceptor لتسجيل الاستجابات**
  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ Response: \${response.statusCode}");
    print("📥 Response Data: \${response.data}");
    handler.next(response);
  }

  /// ❌ **Interceptor لتسجيل الأخطاء**
  void _onError(DioException error, ErrorInterceptorHandler handler) async {
    print("❌ Dio Error: \${error.response?.statusCode}");
    print("⚠️ Error Message: \${error.message}");

    if (error.response?.statusCode == 401) {
      bool refreshed = (await handleTokenRefresh()) != null;

      if (refreshed) {
        final retryResponse = await _dio.fetch(error.requestOptions);
        return handler.resolve(retryResponse);
      }
    }
    handler.next(error);
  }

  /// 🔄 **تحديث التوكن عند انتهاء صلاحيته**
  Future<String?> handleTokenRefresh() async {
    if (_isRefreshing) {
      final completer = Completer<String?>();
      _tokenQueue.add((newToken) => completer.complete(newToken));
      return completer.future;
    }

    _isRefreshing = true;
    var box = Hive.box<String>('authBox');

    String? refreshToken = box.get('refresh_token');

    if (refreshToken == null) {
      print("⚠️ No refresh_token found, user needs to re-login.");
      _isRefreshing = false;
      return null;
    }

    try {
      final response = await _dio.post(
        'https://nti-production.up.railway.app/api/auth/refresh',
        options: Options(
          headers: {
            "Authorization":
                "Bearer $refreshToken", // استخدم Refresh Token في الهيدر
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        String newAccessToken =
            response.data['accessToken']; // تأكد من المفتاح الصحيح
        box.put('token', newAccessToken);
        setToken(newAccessToken);

        print("✅ Token refreshed successfully!");
        _tokenQueue.forEach((callback) => callback(newAccessToken));
        _tokenQueue.clear();
        return newAccessToken;
      } else {
        print("⚠️ Token refresh failed, user needs to re-login.");
        return null;
      }
    } catch (e) {
      print("⚠️ Error refreshing token: $e");
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  /// 🔑 **إدارة التوكن**
  void setToken(String? token) {
    _authToken = token;
    // if (token != null) {
    //   _dio.options.headers["Authorization"] = "Bearer \$token";
    // } else {
    //   _dio.options.headers.remove("Authorization");
    // }
  }

  /// 🚪 **مسح التوكن عند تسجيل الخروج**
  void clearToken() {
    _authToken = null;
    _dio.options.headers.remove("Authorization");
  }

  /// 📌 **إرسال `POST`**
  Future<Response?> postRequest(String endpoint,
      {Map<String, dynamic>? data, bool requiresAuth = false}) async {
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
  Future<Response?> putRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
    bool useRefreshToken = false, // أضف هذا الباراميتر
  }) async {
    return _handleRequest(() async {
      return await _dio.put(
        endpoint,
        data: FormData.fromMap(data ?? {}),
        options: Options(
          contentType: "multipart/form-data",
          headers: _getHeaders(requiresAuth, useRefreshToken),
        ),
      );
    });
  }

  /// 📡 **إرسال `GET`**
  Future<Response?> getRequest(String endpoint,
      {bool requiresAuth = false}) async {
    return _handleRequest(() async {
      return await _dio.get(
        endpoint,
        options: Options(headers: _getHeaders(requiresAuth)),
      );
    });
  }

  /// 🗑 **إرسال `DELETE`**
  Future<Response?> deleteRequest(String endpoint,
      {bool requiresAuth = false}) async {
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
      print("⚠️ DioException: \${e.response?.statusCode} - \${e.message}");
      return e.response;
    } catch (e) {
      print("⚠️ Unexpected Error: \$e");
      return null;
    }
  }

  /// 🔥 **إرجاع الهيدرز بناءً على الحاجة لـ Authorization**
  Map<String, String> _getHeaders(bool requiresAuth,
      [bool useRefreshToken = false]) {
    final headers = {"Accept": "application/json"};
    if (requiresAuth) {
      final box = Hive.box<String>('authBox');
      final token = useRefreshToken
          ? box.get('refresh_token') // 🔑 استخدم 'refresh_token' كمفتاح
          : box.get('token'); // 🔑 استخدم 'token' للـ Access Token
      if (token != null) {
        headers["Authorization"] = "Bearer $token";
      }
    }
    print(
        "🔑 Using ${useRefreshToken ? 'Refresh Token' : 'Access Token'}: ${headers["Authorization"]}");

    return headers;
  }
}
