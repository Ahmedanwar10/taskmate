import 'package:dio/dio.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class UpdateProfileRepoService {
     final DioWrapper _dioWrapper = DioWrapper();
       UpdateProfileRepoService(DioWrapper dioWrapper);
Future<Response?> updateProfile({required String username}) async {
    Map<String,dynamic> body ={
      'username':username
    };
     print("🔍 Attempting update profile with: $body");

     Response? response = await _dioWrapper.putRequest(
      '/update_profile',
      data: body,
      requiresAuth: true,
    );
     if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: update profile');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ update profile Failed: No Response from Server');
    }
    return response;
    }
}