import 'package:dartz/dartz.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/model_all_tasks/model_all/model_all.dart';
import 'package:taskmate_app/core/failure/failure.dart';

abstract class RepoAllTasks {
  Future<Either<Failure, ModelAll>> fetchAllTasks();
}
