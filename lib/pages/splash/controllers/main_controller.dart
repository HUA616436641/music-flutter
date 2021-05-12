import 'package:cloud_music/entity/user_profile.dart';
import 'package:cloud_music/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  UserProfile? userProfile;
  String? cookie;
  static MainController get to => Get.find<MainController>();
  @override
  void onInit() {
    final box = GetStorage();
    cookie = box.read<String>('cookie');
    final userData = box.read<Map<String, dynamic>>('userProfile');
    if (userData != null) {
      userProfile = UserProfile.fromJson(userData);
    }
    Future.delayed(Duration(seconds: 0), () {
      if (userProfile != null) {
        Get.offNamed(Routes.HOME);
      } else {
        // Get.offNamed(Routes.LOGIN);
        Get.toNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }
}
