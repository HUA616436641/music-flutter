import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:cloud_music/pages/player/widgets/player_bar.dart';
import 'package:cloud_music/pages/player/widgets/player_middle.dart';
import 'package:cloud_music/widgets/blur_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerPage extends GetView<PlayerController> {
  final Song song;
  PlayerPage() : song = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return BlurBackground(
      image: NetworkImage(song.album.picUrl),
      sigmaX: 60,
      sigmaY: 60,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              PlayerBar(),
              PlayerMiddle(),
            ],
          ),
        ),
      ),
    );
  }
}
