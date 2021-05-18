import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerMiddlePic extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: Get.width - 80,
      height: Get.width - 80,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(controller.song.album.picUrl))),
    ));
  }
}
