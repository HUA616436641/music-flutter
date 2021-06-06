import 'package:cloud_music/pages/daily_recommond/controllers/daily_rec_controller.dart';
import 'package:cloud_music/pages/daily_recommond/widgets/daily_rec_bar.dart';
import 'package:cloud_music/widgets/blur_background.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class DailyRecPage extends GetView<DailyRecController> {
  @override
  Widget build(BuildContext context) {
    return BlurBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: DateTime.now().day.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        ' / ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    )),
                    TextSpan(
                      text: DateTime.now().month.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            GetBuilder<DailyRecController>(
              builder: (controller) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final s = controller.songList[index];
                      final artistName = s.artistName;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: GestureDetector(
                          onTap: () => controller.openPlayer(index),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                    image: ExtendedNetworkImageProvider(
                                        s.album.picUrl,
                                        cache: true),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      s.name.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(artistName,
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: controller.songList.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
