import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/model_all_tasks/model_all/model_all.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class AllTasksApiService {
  final DioWrapper _dioWrapper;
   
  AllTasksApiService(this._dioWrapper);

Future<ModelAll?> fetchAllTasks() async {
  try {
    
    print("📡 Sending GET request to /tasks...");
print("🔑 Token in Request Headers: ${_dioWrapper.dio.options.headers['Authorization']}");

    Response? response = await _dioWrapper.getRequest('/tasks', requiresAuth: true);

    if (response != null) {
      print("✅ Response received: ${response.statusCode}");
      print("📥 Data: ${response.data}");

      if (response.statusCode == 200) {
        return ModelAll.fromJson(response.data);
      } else {
        print("⚠️ Failed to fetch tasks: ${response.statusCode}");
      }
    } else {
      print("❌ Response is null. Possible network issue.");
    }
    return null;
  } catch (e) {
    print("❌ Exception: $e");
    return null;
  }
}

}