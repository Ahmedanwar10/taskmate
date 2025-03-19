import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/model_all_tasks/model_all/model_all.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/repo/repo_all_tasks.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/service/all_tasks_api_service.dart';
import 'package:taskmate_app/core/failure/failure.dart';

class RepoAllTasksImpl implements RepoAllTasks {
  final AllTasksApiService allTasksApiService;

  RepoAllTasksImpl({required this.allTasksApiService});

  @override
  Future<Either<Failure, ModelAll>> fetchAllTasks() async {
    try {
      ModelAll? responseAllTasks = await allTasksApiService.fetchAllTasks();

      if (responseAllTasks == null) {
        return Left(ServerFailure("Failed to fetch tasks"));
      }

      return Right(responseAllTasks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
