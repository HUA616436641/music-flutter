import 'package:cloud_music/entity/user_profile.dart';
import 'package:cloud_music/pages/login/data/login_repository.dart';
import 'package:cloud_music/pages/splash/controllers/main_controller.dart';
import 'package:cloud_music/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    final userProfile =
        await loginRepository.loginCellphone(phone: phone, pwd: pwd);
    if (userProfile == null) return;
    Get.find<MainController>().userProfile = userProfile;
    final box = GetStorage();
    box.write('userProfile', userProfile.toJson());
    Get.toNamed(Routes.HOME);
  }

  toMobilePage() {
    step.value = 0;
  }
}
