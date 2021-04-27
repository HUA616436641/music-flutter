import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_music/pages/daily_recommond/controllers/daily_rec_controller.dart';
import 'package:cloud_music/pages/daily_recommond/widgets/daily_rec_bar.dart';
import 'package:cloud_music/widgets/blur_background.dart';

class DailyRecPage extends GetView<DailyRecController> {
  @override
  Widget build(BuildContext context) {
    return BlurBackground(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: DailyRecBar(),
            ),
            SliverToBoxAdapter(
              child: Obx(() => Text(controller.songList.toString())),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
