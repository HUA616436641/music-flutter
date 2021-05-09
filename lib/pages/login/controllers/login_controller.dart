import 'package:cloud_music/entity/user_profile.dart';
import 'package:cloud_music/pages/login/data/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ILoginRepository loginRepository;
  late bool isLogin;
  final nextEnabled = RxBool(false);
  final step = RxInt(0);
  late TextEditingController mobileController;
  late TextEditingController pwdController;
  late FocusNode focusNode;

  LoginController({required this.loginRepository});

  @override
  void onInit() {
    print(UserProfile.fromJson(testAccount));
    mobileController = TextEditingController();
    pwdController = TextEditingController();
    focusNode = FocusNode();
    // final box = GetStorage();
    // isLogin = box.read<bool>('login') ?? false;
    // Future.delayed(Duration(seconds: 2), () {
    //   if (isLogin) {
    //     Get.offNamed(Routes.HOME);
    //   } else
    //     Get.offNamed(Routes.HOME);
    //   }
    // });
    super.onInit();
  }

  String get phone => mobileController.text.trim();
  String get pwd => pwdController.text.trim();

  void sendCaptcha() async {
    // final res = await loginRepository.sendCaptcha(phone);
    // if (!res) return;
    step.value = 1;
    focusNode.requestFocus();
  }

  void checkNextEnabled(String val) {
    nextEnabled.value = val.length == 11;
  }

  void login() async {
    await loginRepository.loginCellphone(phone: phone, pwd: pwd);
  }

  toMobilePage() {
    step.value = 0;
  }
}
