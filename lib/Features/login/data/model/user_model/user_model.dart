import 'user.dart';

class UserModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  User? user;

  UserModel({this.accessToken, this.refreshToken, this.status, this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json['access_token'] as String?,
        refreshToken: json['refresh_token'] as String?,
        status: json['status'] as bool?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'status': status,
        'user': user?.toJson(),
      };
}
