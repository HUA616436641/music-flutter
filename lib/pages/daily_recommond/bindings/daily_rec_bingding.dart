import 'package:get/get.dart';
import 'package:cloud_music/pages/daily_recommond/controllers/daily_rec_controller.dart';
import 'package:cloud_music/pages/daily_recommond/data/daily_recommond_provider.dart';
import 'package:cloud_music/pages/daily_recommond/data/daily_recommond_repository.dart';

class DailyRecBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDailyRecProvider>(() => DailyRecProvider());
    Get.lazyPut<IDailyRecRepository>(
        () => DailyRecRepository(provider: Get.find<IDailyRecProvider>()));
    Get.lazyPut(() => DailyRecController(
        dailyRecRepository: Get.find<IDailyRecRepository>()));
  }
}
