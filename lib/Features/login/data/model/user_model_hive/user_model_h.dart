import 'package:hive/hive.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user.dart';

part 'user_model_h.g.dart'; // تأكد من وجود هذا السطر!

@HiveType(typeId: 0) // تعيين ID لهذا الموديل في Hive
class UserModel extends HiveObject {
  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? refreshToken;

  @HiveField(2)
  bool? status;

  @HiveField(3)
  UserData? user;

  UserModel({this.accessToken, this.refreshToken, this.status, this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json['access_token'] as String?,
        refreshToken: json['refresh_token'] as String?,
        status: json['status'] as bool?,
        user: json['user'] == null
            ? null
            : UserData.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'status': status,
        'user': user?.toJson(),
      };
}
