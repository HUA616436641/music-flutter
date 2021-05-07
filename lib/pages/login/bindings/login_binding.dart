import 'package:cloud_music/pages/login/controllers/login_controller.dart';
import 'package:cloud_music/pages/login/data/login_provider.dart';
import 'package:cloud_music/pages/login/data/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginProvider>(() => LoginProvider());
    Get.lazyPut<ILoginRepository>(
        () => LoginRepository(provider: Get.find<ILoginProvider>()));
    Get.lazyPut(
        () => LoginController(loginRepository: Get.find<ILoginRepository>()));
  }
}
