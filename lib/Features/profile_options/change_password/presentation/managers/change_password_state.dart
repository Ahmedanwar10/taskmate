part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {}

class ChangePasswordFailure extends ChangePasswordState {
  final String errorMassage;
  ChangePasswordFailure(this.errorMassage);
}

class ChangePasswordLoading extends ChangePasswordState {}
