part of 'add_task_cubit_cubit.dart';

@immutable
abstract class AddTaskCubitState {}

class AddTaskCubitInitial extends AddTaskCubitState {}

final class AddTaskLoading extends AddTaskCubitState {}

final class AddTaskSuccess extends AddTaskCubitState {}

final class AddTaskFailure extends AddTaskCubitState {
  final String errorMessage;

  AddTaskFailure({required this.errorMessage});
}
