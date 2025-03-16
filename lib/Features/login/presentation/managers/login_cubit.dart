import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user.dart';
import 'package:taskmate_app/Features/login/data/repo/login_repo.dart';
import 'package:taskmate_app/core/failure/failure.dart';
import 'package:taskmate_app/generated/l10n.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    var result = await loginRepo.login(email: email, password: password);

    result.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (loginData) {
        if (loginData.accessToken != null &&
            loginData.refreshToken != null &&
            loginData.user != null) {
          emit(LoginSuccess(
            accessToken: loginData.accessToken!,
            refreshToken: loginData.refreshToken!,
            user: loginData.user!,
          ));
        } else {
          emit(LoginFailure(errorMessage: ServerFailure(S.current.data_not_valid).errorMessage));
        }
      },
    );
  }
}
