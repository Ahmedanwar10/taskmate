import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/register/data/repo/repo_register.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  Future<void> registerUser({
    required String username,
    required String password, // required String confirmPassword
  }) async {
    emit(RegisterLoading());
    var result = await registerRepo.register(
      username: username, password: password,
      // confirmPassword: confirmPassword
    );
    result.fold(
      (l) => emit(RegisterFailure(errorMessage: l.errorMessage)),
      (r) => emit(RegisterSuccess()),
    );
  }
}
