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

  try {
    final result = await repoAllTasks.fetchAllTasks();

    if (result == null) {
      emit(AllTasksError("لم يتم استرجاع البيانات، تحقق من API"));
      return;
    }

    result.fold(
      (failure) => emit(AllTasksError(failure.errorMessage)),
      (modelAll) {
        if (modelAll.tasks == null || modelAll.tasks!.isEmpty) {
          emit(AllTasksError("لا توجد مهام متاحة"));
        } else {
          emit(AllTasksLoaded(modelAll));
        }
      },
    );
  } catch (e) {
    emit(AllTasksError("خطأ غير متوقع: $e"));
  }
}
}
