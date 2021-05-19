import 'dart:math';

import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerMiddlePic extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.rotateController,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.rotateController.value * 2 * pi,
            child: Container(
              width: Get.width - 100,
              height: Get.width - 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(controller.song.album.picUrl))),
            ),
          );
        });
  }
}
