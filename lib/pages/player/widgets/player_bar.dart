import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: Get.back,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 48,
                color: Colors.white,
              ),
            )),
        Expanded(child: Text('sss')),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}
