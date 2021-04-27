import 'package:get/get.dart';
import 'package:cloud_music/pages/splash/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
