import 'package:flutter/material.dart';

class DailyRecBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final flexHeight = 200 - kToolbarHeight;
      final currentHeight = constrains.maxHeight -
          MediaQuery.of(context).viewPadding.top -
          kToolbarHeight;
      final opacity = 1 - currentHeight / flexHeight;
      return Stack(
        fit: StackFit.expand,
        children: [
          // Image.network(
          //   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          //   fit: BoxFit.cover,
          // ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.blue.withOpacity(0.6),
                  Colors.blue.withOpacity(0)
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
          SafeArea(
              child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Opacity(
                opacity: opacity,
                child: Text(
                  '每日推荐',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          )),
        ],
      );
    });
  }
}
