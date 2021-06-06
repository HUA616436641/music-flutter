import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:cloud_music/widgets/marquee_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerBar extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: Get.back,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 48,
                color: Colors.white,
              ),
            )),
        Expanded(
            child: StreamBuilder<int?>(
                stream: controller.audioPlayer.currentIndexStream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      MarqueeText(
                        text: controller.currentSong?.name ?? '',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        key: ValueKey(controller.currentSong?.hashCode),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        controller.currentSong?.artistName ?? '',
                        maxLines: 1,
                        style: TextStyle(fontSize: 16, color: Colors.white60),
                      ),
                    ],
                  );
                })),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}
