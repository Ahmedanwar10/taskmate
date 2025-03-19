import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/add_tasks/data/repo/add_task_repo.dart';
import 'package:taskmate_app/Features/add_tasks/data/service/add_task_api_service.dart';
import 'package:taskmate_app/core/failure/failure.dart';

class AddTaskRepoImpl implements AddTaskRepo {
  final AddTaskApiService addTaskApiService;

  AddTaskRepoImpl({required this.addTaskApiService});
  @override
  Future<Either<Failure, dynamic>> fetchAddTask(
      String title, String description) async {
    try {
      var responseAddTask = await addTaskApiService.fetchAddTask(
        title: title,
        description: description,
      );
      if (responseAddTask == null) {
        return Left(
            ServerFailure("خطأ غير متوقع، لم يتم استلام رد من السيرفر"));
      }
      return Right(responseAddTask);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
