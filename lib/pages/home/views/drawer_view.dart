import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_music/widgets/blur_background.dart';

class DrawerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: BlurBackground(child: Text('sgsgs')),
    );
  }
}
