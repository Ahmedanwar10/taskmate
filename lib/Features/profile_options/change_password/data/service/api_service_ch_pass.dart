import 'package:dio/dio.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class ChangePasswordRepoService {
  final DioWrapper _dioWrapper;

  // المُنشئ الذي يستقبل DioWrapper
  ChangePasswordRepoService(this._dioWrapper);

  // دالة لتغيير كلمة المرور
  Future<Response?> changePassword({
    required String username,
    required String current_password,
    required String new_password,
    required String new_password_confirm,
  }) async {
    // تحديد البيانات التي سيتم إرسالها
    Map<String, dynamic> body = {
      'username': username,
      'current_password': current_password,
      'new_password': new_password,
      'new_password_confirm': new_password_confirm,
    };

    print("🔍 Attempting Change Password with: $body");

    try {
      // إرسال الطلب باستخدام DioWrapper
      Response? response = await _dioWrapper.postRequest(
        '/change_password',
        data: body,
        requiresAuth: true,
      );

      // التحقق من الاستجابة
      if (response != null) {
        print('=======================================');
        print('✅ Endpoint Name: change_password');
        print('📄 Status Code: ${response.statusCode}');
        print('📦 Data: ${response.data}');
        print('=======================================');
      } else {
        print('❌ No Response from Server: خطأ في استلام البيانات من السيرفر');
      }

      return response;

    } catch (e) {
      // التعامل مع الأخطاء بشكل صحيح
      print('❌ Error occurred: $e');
      return null;
    }
  }
}
