import 'package:dartz/dartz.dart';
import 'package:taskmate_app/core/failure/failure.dart';

abstract class RegisterRepo {
  Future<Either<Failure, dynamic>> register({
    required String username,
    required String password,
  //  required String confirmPassword,
  });
}