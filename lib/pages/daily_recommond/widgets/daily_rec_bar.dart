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
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Opacity(
                opacity: opacity,
                child: Text(
                  '推荐歌单',
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
