import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late bool isLogin;
  final nextEnabled = RxBool(false);
  final step = RxInt(0);
  late TextEditingController mobileController;
  late FocusNode focusNode;
  void toCaptcha() {
    step.value = 1;
    focusNode.requestFocus();
  }

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

  void checkNextEnabled(String val) {
    nextEnabled.value = val.length == 11;
  }

  toMobilePage() {
    step.value = 0;
  }
}
