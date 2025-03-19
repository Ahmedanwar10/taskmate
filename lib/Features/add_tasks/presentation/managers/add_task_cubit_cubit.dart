import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmate_app/Features/add_tasks/data/repo/add_task_repo.dart';

part 'add_task_cubit_state.dart';

class AddTaskCubitCubit extends Cubit<AddTaskCubitState> {
  AddTaskCubitCubit(this.addTaskRepo) : super(AddTaskCubitInitial());
  final _tasks = <String>[];
  final AddTaskRepo addTaskRepo;
  Future<void> addTask(String title, String description) async {
    emit(AddTaskLoading());
    final result = await addTaskRepo.fetchAddTask(title, description);
    result.fold((l) => emit(AddTaskFailure(errorMessage: l.errorMessage)),
        (r) => emit(AddTaskSuccess()));
  }
}
