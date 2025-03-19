import 'package:dio/dio.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class AddTaskApiService {
  final DioWrapper _dioWrapper = DioWrapper();
  AddTaskApiService(DioWrapper dioWrapper);
  Future<Response?> fetchAddTask({
    required String title,
    required String description,
  }) async {
    Map<String, dynamic> body = {
      'title': title,
      'description': description,
    };

    print("🔍 Attempting Login with: $body");

    Response? response = await _dioWrapper.postRequest(
      '/new_task',
      data: body,
    );

    if (response != null) {
      print("✅ Add task successful: ${response.data}");
    } else {
      print("❌ Add task failed");
    }
    return response;
  }
}
