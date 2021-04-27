import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  final Widget child;
  BlurBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
            image: AssetImage(
              // "assets/images/aaa.jpg",
              "assets/images/bbb.jpg",
            ),
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: child,
      )
    ]);
  }
}
