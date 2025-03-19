class Task {
  String? createdAt;
  String? description;
  int? id;
  dynamic imagePath;
  String? title;

  Task({
    this.createdAt,
    this.description,
    this.id,
    this.imagePath,
    this.title,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        createdAt: json['created_at'] as String?,
        description: json['description'] as String?,
        id: json['id'] as int?,
        imagePath: json['image_path'] as dynamic,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'created_at': createdAt,
        'description': description,
        'id': id,
        'image_path': imagePath,
        'title': title,
      };
}
