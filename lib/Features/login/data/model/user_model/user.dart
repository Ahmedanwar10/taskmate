import 'package:hive/hive.dart';

part 'user.g.dart'; // تأكد من وجود هذا السطر!

@HiveType(typeId: 1) // تحديد typeId مختلف عن UserModel
class UserData extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  dynamic imagePath;

  @HiveField(2)
  String? username;

  UserData({this.id, this.imagePath, this.username});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
