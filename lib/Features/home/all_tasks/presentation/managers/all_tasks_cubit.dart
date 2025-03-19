import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/model_all_tasks/model_all/model_all.dart';
import 'package:taskmate_app/Features/home/all_tasks/data/repo/repo_all_tasks.dart';

part 'all_tasks_state.dart';

class AllTasksCubit extends Cubit<AllTasksState> {
  final RepoAllTasks repoAllTasks;

  AllTasksCubit(this.repoAllTasks) : super(AllTasksInitial());

  Future<void> fetchAllTasks() async {
    emit(AllTasksLoading());

    final result = await repoAllTasks.fetchAllTasks();

    result.fold(
      (failure) => emit(AllTasksError(failure.errorMessage)),
      (modelAll) => emit(AllTasksLoaded(modelAll)),
    );
  }
}
