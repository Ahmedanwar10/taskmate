import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/profile_options/change_password/data/repo/repo_change_pas_impl.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.repepoChangePasImpl)
      : super(ChangePasswordInitial());

  final RepoChangePasImpl repepoChangePasImpl;

  Future<void> changePassword(
      {
      // ignore: non_constant_identifier_names
      required String current_password,
      // ignore: non_constant_identifier_names
      required String new_password,
      // ignore: non_constant_identifier_names
      required String new_password_confirm,
      required String username}) async {
    emit(ChangePasswordLoading());
    final result = await repepoChangePasImpl.changePassword(
      username: username,
      current_password: current_password,
      new_password: new_password,
      new_password_confirm: new_password_confirm,
    );
    result.fold(
      (l) => emit(ChangePasswordFailure(l.errorMessage)),
      (r) => emit(ChangePasswordSuccess()),
    );
  }
}
