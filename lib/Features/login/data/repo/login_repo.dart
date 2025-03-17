import 'package:dartz/dartz.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user_model.dart';
import 'package:taskmate_app/core/failure/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login({ // ✅ تعديل نوع الإرجاع
    required String username ,
    required String password,
  });
}
