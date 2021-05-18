import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  final Widget child;
  final ImageProvider? image;
  final double _sigmaX;
  final double _sigmaY;
  BlurBackground(
      {required this.child, double? sigmaX, double? sigmaY, this.image})
      : _sigmaX = sigmaX ?? 1,
        _sigmaY = sigmaY ?? 1;
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
            image: image ??
                AssetImage(
                  // "assets/images/aaa.jpg",
                  "assets/images/bbb.jpg",
                ),
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
        child: child,
      )
    ]);
  }
}
