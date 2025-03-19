import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/profile_options/change_password/data/repo/repo_change_pass.dart';
import 'package:taskmate_app/Features/profile_options/change_password/data/service/api_service_ch_pass.dart';
import 'package:taskmate_app/core/failure/failure.dart';

class RepoChangePasImpl implements ChangePasswordRepo {
  final ChangePasswordRepoService changePasswordService;
  RepoChangePasImpl({required this.changePasswordService});
  @override
  Future<Either<Failure, dynamic>> changePassword(
      {required String current_password,
      required String username,
      // ignore: non_constant_identifier_names
      required String new_password,
      required String new_password_confirm}) async {
    try {
      var response = await changePasswordService.changePassword(
          username: username,
          current_password: current_password,
          new_password: new_password,
          new_password_confirm: new_password_confirm);
      if (response == null) {
        return Left(
            ServerFailure("خطأ غير متوقع، لم يتم استلام رد من السيرفر"));
      }
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
