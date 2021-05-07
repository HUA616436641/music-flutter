import 'package:cloud_music/pages/login/data/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ILoginRepository loginRepository;
  late bool isLogin;
  final nextEnabled = RxBool(false);
  final step = RxInt(0);
  late TextEditingController mobileController;
  late FocusNode focusNode;

  LoginController({required this.loginRepository});

  @override
  void onInit() {
    mobileController = TextEditingController();
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

  void sendCaptcha() async {
    final res = await loginRepository.sendCaptcha(phone);
    if (!res) return;
    step.value = 1;
    focusNode.requestFocus();
  }

  void checkNextEnabled(String val) {
    nextEnabled.value = val.length == 11;
  }

  void login(String captcha) async {
    await loginRepository.verifyCaptcha(phone: phone, captcha: captcha);
  }

  toMobilePage() {
    step.value = 0;
  }
}
