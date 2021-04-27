import 'package:get/get.dart';
import 'package:cloud_music/pages/home/controllers/home_controller.dart';
import '../data/home_api_provider.dart';

import '../data/home_repository.dart';
import '../domain/adapters/repository_adapter.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeProvider>(() => HomeProvider());
    Get.lazyPut<IHomeRepository>(() => HomeRepository(provider: Get.find()));
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}