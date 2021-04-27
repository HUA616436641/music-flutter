import 'package:get/get.dart';
import 'package:cloud_music/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  late bool isLogin;

  @override
  void onInit() {
    final box = GetStorage();
    isLogin = box.read<bool>('login') ?? false;
    Future.delayed(Duration(seconds: 0), () {
      if (isLogin) {
        Get.offNamed(Routes.HOME);
      } else {
        // Get.offNamed(Routes.LOGIN);
        Get.toNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }
}
