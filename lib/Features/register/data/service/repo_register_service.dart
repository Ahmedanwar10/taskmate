import 'package:dio/dio.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class RegisterService {
   final DioWrapper _dioWrapper = DioWrapper();

  RegisterService(DioWrapper dioWrapper);

  Future<Response?> register({required String username, required String password,// required String confirmPassword
  }) async {
    Map<String, dynamic> body = {
      'username': username,
      'password': password,
//'confirmPassword': confirmPassword,
    };
        print("🔍 Attempting register with: $body");

     Response? response = await _dioWrapper.postRequest(
      '/register',
      data: body,
    );
     if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: register');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ Register Failed: No Response from Server');
    }
    return response;
    }
}