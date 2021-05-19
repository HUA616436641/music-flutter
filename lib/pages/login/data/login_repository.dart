import 'package:cloud_music/entity/user_profile.dart';

import 'login_provider.dart';

abstract class ILoginRepository {
  Future<bool> sendCaptcha(String phone);
  Future<bool> verifyCaptcha({required String phone, required String captcha});
  Future<UserProfile?> loginCellphone(
      {required String phone, required String pwd});
}

class LoginRepository implements ILoginRepository {
  LoginRepository({required this.provider});
  final ILoginProvider provider;

  @override
  Future<bool> sendCaptcha(String phone) async {
    try {
      final cases = await provider.sendCaptcha(phone);
      if (cases.status.hasError) {
        return Future.error(cases.statusText!);
      } else {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> verifyCaptcha(
      {required String phone, required String captcha}) async {
    try {
      final cases =
          await provider.verifyCaptcha(phone: phone, captcha: captcha);
      if (cases.status.hasError) {
        return Future.error(cases.statusText!);
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserProfile?> loginCellphone(
      {required String phone, required String pwd}) async {
    final cases = await provider.loginCellphone(phone: phone, pwd: pwd);
    return cases.body;
  }
}
