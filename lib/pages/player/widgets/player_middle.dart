import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:cloud_music/pages/player/widgets/player_middle_lyric.dart';
import 'package:cloud_music/pages/player/widgets/player_middle_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerMiddle extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: controller.switchContent,
        child: getMiddleContent(),
      ),
    );
  }

  Widget getMiddleContent() {
    return Obx(() {
      switch (controller.contentIndex.value) {
        case 0:
          return PlayerMiddlePic();
        case 1:
          return PlayerMiddleLyric();
        default:
          return PlayerMiddlePic();
      }
    });
  }
}
