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

          // ✅ حفظ التوكن في SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("auth_token", loginData.accessToken!);
          await prefs.setString("refresh_token", loginData.refreshToken!);

          // ✅ حفظ بيانات المستخدم في Hive
          var box = Hive.isBoxOpen('userBox') ? Hive.box<UserData>('userBox') : await Hive.openBox<UserData>('userBox');
box.put("user", loginData.user!);



          // ✅ تحديث التوكن في DioWrapper
          DioWrapper().setToken(loginData.accessToken!);

          emit(LoginSuccess(
            accessToken: loginData.accessToken!,
            refreshToken: loginData.refreshToken!,
            user: loginData,
          ));
        } else {
          emit(LoginFailure(errorMessage: ServerFailure(S.current.data_not_valid).errorMessage));
        }
      },
    );
  }

  Future<void> logout() async {
    // ❌ إزالة التوكن من DioWrapper
    DioWrapper().clearToken();

    // ❌ حذف التوكن من SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    await prefs.remove("refresh_token");

    // ❌ حذف بيانات المستخدم من التخزين المحلي (Hive)
    if (Hive.isBoxOpen('userBox')) {
  var box = Hive.box<UserData>('userBox');
  await box.clear();
}


    emit(LoginInitial());
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");

    if (token != null) {
      DioWrapper().setToken(token);
     var box = Hive.isBoxOpen('userBox') ? Hive.box<UserData>('userBox') : await Hive.openBox<UserData>('userBox');
UserData? user = box.get("user");


      if (user != null) {
        emit(LoginSuccess(
          accessToken: token,
          refreshToken: prefs.getString("refresh_token") ?? "",
          user: user as UserModel,
        ));
        return;
      }
    }

    emit(LoginInitial());
  }
}
