import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/repo/repo_update_profile_impl.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/data/service/update_profile_repo_service.dart';
import 'package:taskmate_app/generated/l10n.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit( this.repoUpdateProfileImpl) : super(UpdateProfileInitial());

final RepoUpdateProfileImpl repoUpdateProfileImpl;
  Future<void>updateProfile({required String username}) async {
    emit(UpdateProfileLoading());
    var result = await repoUpdateProfileImpl.updateProfile(username: username);
    result.fold(
      (l) => emit(UpdateProfileFailure(l.errorMessage)),
      (r) => emit(UpdateProfileSuccess()),
    );
  }
}
