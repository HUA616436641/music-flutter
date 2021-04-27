import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeFooter extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return TabBar(
        controller:homeController.tabController,
        tabs: homeController.menus.map((e) => Column(
          children: [Icon(e.icon),Text(e.title)],
        )).toList());
  }
}


