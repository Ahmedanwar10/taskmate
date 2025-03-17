part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginSuccess extends LoginState {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  LoginSuccess({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
}
