part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  final String errorMassage;
  UpdateProfileFailure(this.errorMassage);
}

class UpdateProfileLoading extends UpdateProfileState {}
