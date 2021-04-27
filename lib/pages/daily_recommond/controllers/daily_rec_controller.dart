import 'package:get/get.dart';
import 'package:cloud_music/pages/daily_recommond/data/daily_recommond_repository.dart';

class DailyRecController extends GetxController {
  final IDailyRecRepository dailyRecRepository;
  DailyRecController({required this.dailyRecRepository});
  final songList = [].obs;
  @override
  void onInit() async {
    final a = await dailyRecRepository.getDailyRecSongs();
    print(a);
    super.onInit();
  }
}
