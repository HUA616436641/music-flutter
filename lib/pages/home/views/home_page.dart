import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_music/pages/home/controllers/home_controller.dart';
import 'package:cloud_music/pages/home/views/drawer_view.dart';
import 'package:cloud_music/pages/home/widgets/home_body.dart';
import 'package:cloud_music/pages/home/widgets/home_footer.dart';
import 'package:cloud_music/pages/home/widgets/home_header.dart';
import 'package:cloud_music/widgets/blur_background.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BlurBackground(
        child: Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.transparent,
      drawer: DrawerView(),
      body: SafeArea(
          child: Column(
        children: [
          HomeHeader(),
          Expanded(child: HomeBody()),
          HomeFooter(),
        ],
      )),
    ));
  }
}
