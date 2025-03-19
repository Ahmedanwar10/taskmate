import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/model_all_tasks/model_all/model_all.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';

class AllTasksApiService {
  final DioWrapper _dioWrapper;

  AllTasksApiService(this._dioWrapper);

  Future<ModelAll?> fetchAllTasks() async {
    try {
      Response? response = await _dioWrapper.getRequest(
        '/tasks', // تأكد أن هذا هو المسار الصحيح للـ API
        requiresAuth: true, // إذا كانت تحتاج إلى توثيق
      );

      if (response != null && response.statusCode == 200) {
        return ModelAll.fromJson(response.data);
      } else {
        print("⚠️ Failed to fetch tasks: ${response?.statusCode}");
        return null;
      }
    } catch (e) {
      print("⚠️ Error fetching tasks: $e");
      return null;
    }
  }
}
