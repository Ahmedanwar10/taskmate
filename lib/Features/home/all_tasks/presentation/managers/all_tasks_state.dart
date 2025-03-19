part of 'all_tasks_cubit.dart';

@immutable
abstract class AllTasksState {}

class AllTasksInitial extends AllTasksState {}
class AllTasksLoading extends AllTasksState {}
class AllTasksLoaded extends AllTasksState {
  final ModelAll modelAll;
  AllTasksLoaded(this.modelAll);
}
class AllTasksError extends AllTasksState {
  final String errorMessage;
  AllTasksError(this.errorMessage);
}
