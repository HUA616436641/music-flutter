import 'package:cloud_music/pages/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.list,
            color: Colors.white,
          ),
          onPressed: () {
            controller.openDrawer();
          },
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(30)),
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.white54,
                ),
                Text(
                  '九块九',
                  style: TextStyle(color: Colors.white38),
                ),
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 5),
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.mic,
          color: Colors.white,
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
