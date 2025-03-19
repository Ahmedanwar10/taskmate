import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/repo/repo_update_profile.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/service/update_profile_repo_service.dart';
import 'package:taskmate_app/core/failure/failure.dart';

class RepoUpdateProfileImpl implements UpdateProfileRepo {
  final UpdateProfileRepoService updateProfileRepoService;
  RepoUpdateProfileImpl({required this.updateProfileRepoService});
  @override
  Future<Either<Failure, dynamic>> updateProfile(
      {required String username}) async {
    try {
      var response =
          await updateProfileRepoService.updateProfile(username: username);
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
