import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/pages/player/data/player_repository.dart';
import 'package:cloud_music/pages/player/entity/lyric.dart';
import 'package:cloud_music/shared/logger/logger_utils.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum UpdateIds {
  playlist,
  volume,
  lrc,
}

class PlayerController extends GetxController
    with SingleGetTickerProviderMixin {
  final IPlayerRepository playerRepository;
  PlayerController({required this.playerRepository});
  late int playIndex;
  RxInt contentIndex = RxInt(0);
  RxList<Song> _playlist = RxList();
  RxList<Song> get playlist => _playlist;
  late AnimationController rotateController;
  late AudioPlayer audioPlayer;
  ConcatenatingAudioSource _playSources =
      ConcatenatingAudioSource(children: []);
  ConcatenatingAudioSource get playSources => _playSources;

  PanelController slidingController = PanelController();

  AutoScrollController lrcController = AutoScrollController();
  Song? currentSong;

  Lyric? lyric;
  int? lyricIndex;
  @override
  void onInit() async {
    playIndex = Get.arguments['playIndex'];
    updatePlaylist(Get.arguments['playlist'] ?? []);
    rotateController =
        AnimationController(duration: Duration(seconds: 18), vsync: this)
          ..repeat();
    audioPlayer = AudioPlayer();
    // var duration = await audioPlayer.setUrl(song.);
    audioPlayer.currentIndexStream.listen((index) async {
      currentSong = index == null
          ? null
          : (_playSources.children[index] as UriAudioSource).tag;
      if (currentSong != null) {
        lyric = await playerRepository.getLyric(currentSong!.id);
        update([UpdateIds.lrc]);
      }
    });
    audioPlayer.positionStream.listen((position) {
      // print(position.inMilliseconds);
      // print(lyric?.lrcItems.map((e) =>Duration).toList());
      // lrcController.
      if (lyric == null) return;
      for (int i = 0; i < lyric!.lrcItems.length; i++) {
        final pre = lyric!.lrcItems[i].item1;
        final next = i == lyric!.lrcItems.length - 1
            ? lyric!.lrcItems[i].item1
            : lyric!.lrcItems[i + 1].item1;
        if (position >= pre && position < next) {
          lyricIndex = i;
          lrcController
            ..cancelAllHighlights()
            ..highlight(i);
          lrcController.scrollToIndex(i,
              duration: Duration(milliseconds: 600),
              preferPosition: AutoScrollPosition.middle);
          print('$position $i');
          break;
        }
      }
    });
    _playlist.addListener(GetStream(onListen: () async {
      Logger.write('playlist changed');
      final urls = await playerRepository
          .getSongUrls(_playlist.map((element) => element.id).toList());
      // Logger.write(urls.toString());
      if (_playlist.length != urls.length) {
        Logger.write('urls获取错误');
      }

      _playSources = ConcatenatingAudioSource(
          children: urls.map((e) {
        final index = urls.indexOf(e);
        final song = _playlist[index];
        return AudioSource.uri(
          Uri.parse(e),
          tag: song,
        );
      }).toList());
      audioPlayer.setAudioSource(_playSources, initialIndex: playIndex).then(
            (value) => audioPlayer.play(),
          );
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

  Future<void> removeSong(int index) async {
    if (audioPlayer.currentIndex == index) {
      await audioPlayer.seekToNext();
    }
    final res = _playSources.removeAt(index);
    update([UpdateIds.playlist]);
    return res;
  }

  Future<void> showPlaylistSlidingSheet() {
    return slidingController.open();
  }

  Future<void> play(int index, {List<Song>? playlist}) {
    if (playlist != null) {
      _playlist.value = playlist;
    }
    return audioPlayer.seek(Duration.zero, index: index);
  }

  Future<void> setVolume(double val) async {
    await audioPlayer.setVolume(val);
    update([UpdateIds.volume]);
  }

  Future<Lyric?> getLyric(int songId) async {
    return playerRepository.getLyric(songId);
  }
}
