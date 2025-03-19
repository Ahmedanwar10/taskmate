import 'task.dart';

class ModelAll {
  bool? status;
  List<Task>? tasks;

  ModelAll({this.status, this.tasks});

  factory ModelAll.fromJson(Map<String, dynamic> json) => ModelAll(
        status: json['status'] as bool?,
        tasks: (json['tasks'] as List<dynamic>?)
            ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'tasks': tasks?.map((e) => e.toJson()).toList(),
      };
}
