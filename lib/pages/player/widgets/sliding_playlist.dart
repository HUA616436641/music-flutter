import 'package:cloud_music/extention/audio_extention.dart';
import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SlidingPlaylist extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: UpdateIds.playlist,
        init: controller,
        builder: (c) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.playSources.children.length,
              itemBuilder: (context, index) {
                final s =
                    (controller.playSources.children[index] as UriAudioSource)
                        .song;
                final isPlaying = controller.currentSong?.id == s.id;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.play(index),
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              TextSpan(
                                text: s.name.toString(),
                                style: TextStyle(
                                  color: isPlaying
                                      ? Colors.redAccent
                                      : Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              TextSpan(
                                text: ' - ${s.artistName}',
                                style: TextStyle(
                                  color: isPlaying
                                      ? Colors.redAccent
                                      : Colors.white60,
                                  fontSize: 14,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              controller.removeSong(index);
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.white38,
                              size: 22,
                            )),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
