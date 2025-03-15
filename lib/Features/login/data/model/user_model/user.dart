class User {
  int? id;
  dynamic imagePath;
  String? username;

  User({this.id, this.imagePath, this.username});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        imagePath: json['image_path'] as dynamic,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_path': imagePath,
        'username': username,
      };
}
