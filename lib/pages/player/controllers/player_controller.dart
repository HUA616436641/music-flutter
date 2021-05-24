import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/pages/player/data/player_repository.dart';
import 'package:cloud_music/shared/logger/logger_utils.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayerController extends GetxController
    with SingleGetTickerProviderMixin {
  final IPlayerRepository playerRepository;
  PlayerController({required this.playerRepository});
  late Song song;
  RxInt contentIndex = RxInt(0);
  late RxList<Song> _playlist = RxList();
  late AnimationController rotateController;
  late AudioPlayer audioPlayer;
  late ConcatenatingAudioSource _playSources;
  @override
  void onInit() async {
    song = Get.arguments['song'];
    updatePlaylist(Get.arguments['playlist'] ?? []);
    rotateController =
        AnimationController(duration: Duration(seconds: 18), vsync: this)
          ..repeat();
    audioPlayer = AudioPlayer();
    // var duration = await audioPlayer.setUrl(song.);
    audioPlayer.play();

    _playlist.addListener(GetStream(onListen: () async {
      Logger.write('playlist changed');
      final urls = await playerRepository
          .getSongUrls(_playlist.map((element) => element.id).toList());
      Logger.write(urls.toString());

      if (_playlist.length != urls.length) {
        Logger.write('urls获取错误');
      }
      _playSources = ConcatenatingAudioSource(
          children: urls
              .map((e) => AudioSource.uri(
                    Uri.parse(e),
                    // tag: AudioMetadata(
                    //   album: "Science Friday",
                    //   title: "A Salute To Head-Scratching Science",
                    //   artwork:
                    //   "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
                    // ),
                  ))
              .toList());
      audioPlayer
        ..setAudioSource(_playSources)
        ..play();
    }));
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

  void updatePlaylist(List<Song> playlist) {
    _playlist.value = playlist;
  }
}
