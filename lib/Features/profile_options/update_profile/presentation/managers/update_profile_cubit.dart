import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/repo/repo_update_profile_impl.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final RepoUpdateProfileImpl repoUpdateProfileImpl;

  UpdateProfileCubit(this.repoUpdateProfileImpl)
      : super(UpdateProfileInitial());

  Future<void> updateProfile({required String username}) async {
    emit(UpdateProfileLoading());

    var result = await repoUpdateProfileImpl.updateProfile(username: username);
    result.fold(
      (l) => emit(UpdateProfileFailure(l.errorMessage)),
      (r) => emit(UpdateProfileSuccess()),
    );
  }
}
