import 'package:cloud_music/pages/player/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PlayerMiddleLyric extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            children: [
              Icon(
                Icons.volume_up_sharp,
                color: Colors.white60,
              ),
              Expanded(
                child: GetBuilder<PlayerController>(
                    id: UpdateIds.volume,
                    builder: (c) {
                      return SliderTheme(
                        data: SliderThemeData(
                          thumbColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 7),
                          activeTrackColor: Colors.white24,
                          inactiveTrackColor: Colors.white24,
                          trackHeight: 1,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 9.0),
                          overlayColor: Colors.white,
                        ),
                        child: Slider(
                          min: 0.0,
                          max: 10,
                          value: c.audioPlayer.volume,
                          onChanged: (value) {
                            c.setVolume(value);
                          },
                          onChangeEnd: (value) {},
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        Expanded(
            child: GetBuilder<PlayerController>(
          id: UpdateIds.lrc,
          builder: (c) {
            if (c.lyric == null) return SizedBox();
            return ListView.separated(
                controller: c.lrcController,
                itemCount: c.lyric!.lrcItems.length,
                separatorBuilder: (c, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final r = c.lyric!.lrcItems[index];
                  return AutoScrollTag(
                      key: ValueKey(index),
                      controller: c.lrcController,
                      index: index,
                      highlightColor: Colors.red,
                      child: Center(
                          child: Text(
                        r.item2,
                        style: TextStyle(
                            color: c.lyricIndex == index
                                ? Colors.white
                                : Colors.white60,
                            fontSize: 16),
                      )));
                });
          },
        )),
      ],
    );
  }
}
