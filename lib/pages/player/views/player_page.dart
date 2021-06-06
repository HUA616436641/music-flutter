import 'dart:math';

import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:cloud_music/pages/player/widgets/player_bar.dart';
import 'package:cloud_music/pages/player/widgets/player_middle.dart';
import 'package:cloud_music/pages/player/widgets/sliding_playlist.dart';
import 'package:cloud_music/widgets/blur_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlayerPage extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int?>(
        stream: controller.audioPlayer.currentIndexStream,
        builder: (context, snapshot) {
          return BlurBackground(
            image: controller.currentSong == null
                ? null
                : NetworkImage(controller.currentSong!.album.picUrl),
            sigmaX: 60,
            sigmaY: 60,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        PlayerBar(),
                        PlayerMiddle(),
                      ],
                    ),
                  ),
                  SlidingUpPanel(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    backdropColor: Colors.transparent,
                    controller: controller.slidingController,
                    backdropEnabled: true,
                    renderPanelSheet: false,
                    backdropTapClosesPanel: true,
                    minHeight: 0,
                    panel: Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              max(Get.mediaQuery.viewPadding.bottom - 15, 0)),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: SlidingPlaylist(),
                      ),
                    ),
                    body: const SizedBox(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
