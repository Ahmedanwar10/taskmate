import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_task_cubit_state.dart';

class AddTaskCubitCubit extends Cubit<AddTaskCubitState> {
  AddTaskCubitCubit() : super(AddTaskCubitInitial());
}
