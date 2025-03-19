import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/register/data/repo/repo_register.dart';
import 'package:taskmate_app/Features/register/data/service/repo_register_service.dart';
import 'package:taskmate_app/core/failure/failure.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterService registerService;

  RegisterRepoImpl({required this.registerService});
  @override
  Future<Either<Failure, dynamic>> register({
    required String username,
    required String password,
  }) async {
    try {
      var responseRegister = await registerService.register(
        username: username,
        password: password, //confirmPassword: confirmPassword
      );

      if (responseRegister == null) {
        return Left(
            ServerFailure("خطأ غير متوقع، لم يتم استلام رد من السيرفر"));
      }
      return Right(responseRegister);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
