import 'package:cloud_music/pages/daily_recommond/data/daily_recommond_repository.dart';
import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/routes/app_pages.dart';
import 'package:get/get.dart';

class DailyRecController extends GetxController {
  final IDailyRecRepository dailyRecRepository;
  DailyRecController({required this.dailyRecRepository});
  List<Song> songList = [];
  @override
  void onInit() async {
    final a = await dailyRecRepository.getDailyRecSongs();
    songList = a;
    update();
    super.onInit();
  }

  void openPlayer(Song song) {
    Get.toNamed(Routes.PLAYER, arguments: {'song': song, 'playlist': songList});
  }
}
