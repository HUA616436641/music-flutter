import 'package:flutter/material.dart';

class PlayerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Icon(Icons.keyboard_arrow_down)),
        Expanded(child: Text('sss')),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}
