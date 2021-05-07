import 'package:cloud_music/pages/daily_recommond/views/daily_rec_page.dart';
import 'package:cloud_music/pages/home/domain/entity/category_item.dart';
import 'package:cloud_music/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'banner.dart';

class HomeState {
  List<SwiperBanner> banners = [];
  List<SongList> songList = [];
  List<CategoryItem> categories = [
    CategoryItem(
        title: '每日推荐',
        icon: Icons.date_range,
        onTap: () {
          Get.toNamed(Routes.DailyRec);
        }),
    CategoryItem(
        title: '私人FM',
        icon: Icons.audiotrack_outlined,
        onTap: () {
          Get.to(DailyRecPage());
        }),
    CategoryItem(
        title: '每日推荐',
        icon: Icons.date_range,
        onTap: () {
          Get.to(DailyRecPage());
        }),
    CategoryItem(
        title: '私人FM',
        icon: Icons.audiotrack_outlined,
        onTap: () {
          Get.to(DailyRecPage());
        }),
    CategoryItem(
        title: '每日推荐',
        icon: Icons.date_range,
        onTap: () {
          Get.to(DailyRecPage());
        }),
    CategoryItem(
        title: '私人FM',
        icon: Icons.audiotrack_outlined,
        onTap: () {
          Get.to(DailyRecPage());
        }),
    CategoryItem(
        title: '每日推荐',
        icon: Icons.date_range,
        onTap: () {
          Get.to(DailyRecPage());
        }),
    CategoryItem(
        title: '私人FM',
        icon: Icons.audiotrack_outlined,
        onTap: () {
          Get.to(DailyRecPage());
        }),
  ];
}
