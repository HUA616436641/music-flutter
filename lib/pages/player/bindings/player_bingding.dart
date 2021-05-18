import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:cloud_music/pages/player/data/player_provider.dart';
import 'package:cloud_music/pages/player/data/player_repository.dart';
import 'package:get/get.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPlayerProvider>(() => PlayerProvider());
    Get.lazyPut<IPlayerRepository>(
        () => PlayerRepository(provider: Get.find<IPlayerProvider>()));
    Get.lazyPut(() =>
        PlayerController(dailyRecRepository: Get.find<IPlayerRepository>()));
  }
}
