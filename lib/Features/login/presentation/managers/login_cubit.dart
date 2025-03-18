import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user.dart';
import 'package:taskmate_app/Features/login/data/model/user_model/user_model.dart';
import 'package:taskmate_app/Features/login/data/repo/login_repo.dart';
import 'package:taskmate_app/core/common/widgets/diowrapper.dart';
import 'package:taskmate_app/core/failure/failure.dart';
import 'package:taskmate_app/generated/l10n.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial()) {
    checkLoginStatus();
  }

  Future<void> login({
  required String username,
  required String password,
}) async {
  emit(LoginLoading());

  var result = await loginRepo.login(username: username, password: password);

  result.fold(
    (failure) {
      emit(LoginFailure(errorMessage: failure.errorMessage));
    },
    (loginData) async {
      if (loginData.accessToken != null &&
          loginData.refreshToken != null &&
          loginData.user != null) {
        
        // ✅ فتح صندوق Hive للتوكنات
        var tokenBox = Hive.box<String>('authBox');

        print("📦 Hive Token Box Opened: ${Hive.isBoxOpen('authBox')}");

        // ✅ تخزين التوكنات في Hive
        await tokenBox.put('access_token', loginData.accessToken!);
        await tokenBox.put('refresh_token', loginData.refreshToken!);

        print("✅ تم تخزين Access Token في Hive: ${tokenBox.get('access_token')}");
        print("✅ تم تخزين Refresh Token في Hive: ${tokenBox.get('refresh_token')}");

        // ✅ حفظ بيانات المستخدم
        var userBox = await Hive.openBox<UserData>('userBox');
        userBox.put("user", loginData.user!);

        // ✅ حفظ التوكنات في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", loginData.accessToken!);
        await prefs.setString("refresh_token", loginData.refreshToken!);
        await prefs.setString("username", username);

        // ✅ تحديث التوكن في DioWrapper
        DioWrapper().setToken(loginData.accessToken!);

        emit(LoginSuccess(
          accessToken: loginData.accessToken!,
          refreshToken: loginData.refreshToken!,
          user: loginData.user!,
          username: username,
        ));
      } else {
        emit(LoginFailure(errorMessage: ServerFailure(S.current.data_not_valid).errorMessage));
      }
    },
  );
}


  Future<void> logout() async {
  print("🚪 تسجيل خروج المستخدم...");

  // ❌ حذف التوكن من DioWrapper
  DioWrapper().clearToken();

  // ❌ حذف التوكنات من SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("auth_token");
  await prefs.remove("refresh_token");
  await prefs.remove("username");

  print("🗑 تم حذف التوكنات من SharedPreferences");

  // ❌ مسح بيانات المستخدم من Hive
  if (Hive.isBoxOpen('userBox')) {
    var box = Hive.box<UserData>('userBox');
    await box.clear();
    print("🗑 تم حذف بيانات المستخدم من Hive");
  }

  emit(LoginInitial());
}

 Future<void> checkLoginStatus() async {
  print("🔍 التحقق من حالة تسجيل الدخول...");

  // ✅ استرجاع التوكن من SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? sharedToken = prefs.getString("auth_token");

  print("🔑 التوكن المخزن في SharedPreferences: $sharedToken");

  // ✅ فتح صندوق التوكنات في Hive
if (!Hive.isBoxOpen('authBox')) {
  await Hive.openBox<String>('authBox');
}
var tokenBox = Hive.box<String>('authBox');
  String? hiveToken = tokenBox.get('access_token');
  String? hiveRefreshToken = tokenBox.get('refresh_token');

  print("🔑 Stored Access Token from Hive: $hiveToken");
  print("🔄 Stored Refresh Token from Hive: $hiveRefreshToken");

  if (hiveToken != null) {
    DioWrapper().setToken(hiveToken);

    var userBox = await Hive.openBox<UserData>('userBox');
    UserData? user = userBox.get("user");

    if (user != null) {
      String? savedUsername = prefs.getString("username");
      emit(LoginSuccess(
        accessToken: hiveToken,
        refreshToken: hiveRefreshToken ?? "",
        user: user,
        username: savedUsername ?? user.username ?? "Guest",
      ));
      return;
    }
  }

  emit(LoginInitial());
}

}
