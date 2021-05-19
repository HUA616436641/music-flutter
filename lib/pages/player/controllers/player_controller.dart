import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/pages/player/data/player_repository.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayerController extends GetxController
    with SingleGetTickerProviderMixin {
  final IPlayerRepository dailyRecRepository;
  PlayerController({required this.dailyRecRepository});
  late Song song;
  RxInt contentIndex = RxInt(0);
  late List<Song> songList = [];
  late AnimationController rotateController;
  late AudioPlayer audioPlayer;
  @override
  void onInit() async {
    song = Get.arguments;
    rotateController =
        AnimationController(duration: Duration(seconds: 18), vsync: this)
          ..repeat();
    audioPlayer = AudioPlayer();
    // var duration = await audioPlayer.setUrl(song.);
    audioPlayer.play();

    songList = await dailyRecRepository.getDailyRecSongs();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    rotateController.dispose();
    audioPlayer.dispose();
    super.onClose();
  }

  void switchContent() {
    contentIndex.value++;
    contentIndex.value = contentIndex.value == 2 ? 0 : contentIndex.value;
    update();
  }
}
