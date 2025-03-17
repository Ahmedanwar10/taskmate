import 'package:dio/dio.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class ChangePasswordRepoService {
  final DioWrapper _dioWrapper = DioWrapper();
  ChangePasswordRepoService(DioWrapper dioWrapper) ;
  Future<Response?>changePassword(
    {
      required String username,
      required String current_password,
      required String new_password,
      required String new_password_confirm, 
      }
      ) async {
    Map<String, dynamic> body = {
      'username': username,
      "current_password": current_password,
      "new_password": new_password,
      "new_password_confirm": new_password_confirm,
    };
        print("🔍 Attempting Login with: $body");

        Response? response = await _dioWrapper.postRequest(
          '/change_password',
          data: body,
          requiresAuth: true,

        );
         if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: change_password');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ Login Failed: No Response from Server: ${("خطاء في استلام البيانات من السيرفر")}))');
    }
        return response;
      }
}