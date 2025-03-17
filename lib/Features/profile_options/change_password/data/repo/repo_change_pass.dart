import 'package:dartz/dartz.dart';
import 'package:taskmate_app/core/failure/failure.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, dynamic>> changePassword({
    required String username,
    // ignore: non_constant_identifier_names
    required String current_password,
     // ignore: non_constant_identifier_names
     required String new_password,
     // ignore: non_constant_identifier_names
     required String new_password_confirm,
     });
}