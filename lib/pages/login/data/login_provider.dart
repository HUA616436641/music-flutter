import 'package:cloud_music/common/provider/base_provider.dart';
import 'package:cloud_music/entity/user_profile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: one_member_abstracts
abstract class ILoginProvider {
  Future<Response<bool>> sendCaptcha(String phone);
  Future<Response<bool>> verifyCaptcha(
      {required String phone, required String captcha});
  Future<Response<UserProfile?>> loginCellphone(
      {required String phone, required String pwd});
}

class LoginProvider extends BaseProvider implements ILoginProvider {
  @override
  Future<Response<bool>> sendCaptcha(String phone) {
    return get('/captcha/sent?phone=$phone', decoder: parseCaptchaRes);
  }

  bool parseCaptchaRes(json) {
    final res = json as Map<String, dynamic>;
    if (res['code'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Response<bool>> verifyCaptcha(
      {required String phone, required String captcha}) {
    return get('/captcha/verify?phone=$phone&captcha=$captcha',
        decoder: parseVerifyCaptcha);
  }

  bool parseVerifyCaptcha(json) {
    final res = json as Map<String, dynamic>;
    if (res['code'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Response<UserProfile?>> loginCellphone(
      {required String phone, required String pwd}) {
    final query = {
      'phone': phone,
      'password': pwd,
    };
    return get(
      '/login/cellphone',
      cookie: false,
      query: query,
      decoder: (json) => defaultDecoder2<UserProfile?>(
        process: (json) => parseLogin(json),
        json: json,
      ),
    );
  }
}

UserProfile parseLogin(Map<String, dynamic> json) {
  final box = GetStorage();
  box.write('cookie', json['cookie'] as String);
  return UserProfile.fromJson(json['profile']);
}
