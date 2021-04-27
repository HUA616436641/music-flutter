import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:cloud_music/pages/home/controllers/home_controller.dart';
import 'package:cloud_music/pages/home/widgets/custom_page_navigation.dart';

class HomeBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildBanner(),
          ),
          SliverToBoxAdapter(
            child: _buildCategories(),
          ),
          SliverToBoxAdapter(
            child: _buildSongList(),
          )
        ],
      ).paddingSymmetric(vertical: 16);
    },
        onLoading: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: CircularProgressIndicator()));
  }

//  分类入口
  Widget _buildCategories() {
    final categories = controller.state!.categories;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white12,
                        ),
                        child: IconButton(
                          color: Colors.red.withOpacity(0.4),
                          icon: Icon(e.icon),
                          onPressed: e.onTap,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        e.title,
                        style: TextStyle(fontSize: 12, color: Colors.white60),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

//  推荐歌单
  Widget _buildSongList() {
    return GetBuilder<HomeController>(
        id: 'songList',
        builder: (controller) {
          final songList = controller.homeState.songList;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: songList
                  .map((e) => Container(
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(e.picUrl),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  margin: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.play_arrow_outlined,
                                        size: 11,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        e.playCount.toString(),
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              e.name,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          );
        });
  }

// banner轮播
  Container _buildBanner() {
    return Container(
      height: 180,
      child: GetBuilder<HomeController>(
          id: 'banner',
          builder: (controller) {
            return Swiper(
              index: 0,
              itemBuilder: (context, index) {
                final banner = controller.homeState.banners[index];
                return Container(
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(banner.url),
                    ),
                  ),
                );
              },
              itemCount: controller.homeState.banners.length,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 17),
                builder: BarSwiperPaginationBuilder(
                    color: Colors.white60, activeColor: Colors.white),
              ),
              autoplay: true,
              controller: controller.swiperController,
              // indicatorLayout: PageIndicatorLayout.SCALE,
            );
          }),
    );
  }
}
