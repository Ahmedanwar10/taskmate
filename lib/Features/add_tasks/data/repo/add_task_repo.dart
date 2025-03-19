import 'package:dartz/dartz.dart';
import 'package:taskmate_app/core/failure/failure.dart';

abstract class AddTaskRepo {
  Future<Either<Failure, dynamic>> fetchAddTask(
      String title, String description);
}
