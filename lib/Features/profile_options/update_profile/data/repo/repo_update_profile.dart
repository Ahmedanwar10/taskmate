import 'package:dartz/dartz.dart';
import 'package:taskmate_app/core/failure/failure.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, dynamic>> updateProfile({
    // ✅ تعديل نوع الإرجاع
    required String username,
  });
}
