import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user_model.dart';
import 'package:taskmate_app/Features/login/data/service/login_repo_service.dart';
import 'package:taskmate_app/core/failure/failure.dart';
import 'package:taskmate_app/Features/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginService loginService;
  LoginRepoImpl({required this.loginService});

  @override
  Future<Either<Failure, UserModel>> login({ // ✅ غيرت `User` إلى `UserModel`
    required String email,
    required String password,
  }) async {
    try {
      var response = await loginService.login(email: email, password: password);
      
      if (response == null) {
        return Left(ServerFailure("خطأ غير متوقع، لم يتم استلام رد من السيرفر"));
      }

      return Right(UserModel.fromJson(response.data)); // ✅ الآن `Right` يحمل `UserModel`
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
