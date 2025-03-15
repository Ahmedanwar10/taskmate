import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user.dart';
import 'package:taskmate_app/Features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await loginRepo.login(email: email, password: password);
    result.fold(
      (l) => emit(LoginFailure(errorMessage: l.errorMessage)),
      (r) => emit(LoginSuccess(
        accessToken: r.accessToken ?? '',
        refreshToken: r.refreshToken ?? '',
        user: r.user ?? User(), // تأكد أن `user` ليس `null`
      )),
    );
  }
}
