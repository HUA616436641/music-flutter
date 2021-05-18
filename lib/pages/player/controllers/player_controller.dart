import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/pages/player/data/player_repository.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  final IPlayerRepository dailyRecRepository;
  PlayerController({required this.dailyRecRepository});
  late Song song;
  RxInt contentIndex = RxInt(0);
  late List<Song> songList = [];
  @override
  void onInit() async {
    song = Get.arguments;
    songList = await dailyRecRepository.getDailyRecSongs();
    update();
    super.onInit();
  }

  void switchContent() {
    contentIndex.value++;
    contentIndex.value = contentIndex.value == 2 ? 0 : contentIndex.value;
    update();
  }
}
