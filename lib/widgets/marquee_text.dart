import 'dart:async';

import 'package:flutter/cupertino.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  MarqueeText({required this.text, this.style, Key? key}) : super(key: key);
  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  late ScrollController _scrollController;
  late bool isOverflow;
  late double textWidth;
  late double maxWidth;
  late Timer _timer;
  late String _text;
  @override
  void initState() {
    _text = widget.text;
    _scrollController = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (isOverflow) {
        _text = '    ${widget.text}    ';
        Future.delayed(Duration(seconds: 1), () {
          double offset = 0;
          bool forward = true;
          _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
            if (offset == textWidth - maxWidth) {
              forward = false;
            }
            if (offset == 0) {
              forward = true;
            }

            _scrollController.jumpTo(forward ? offset++ : offset--);
          });
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      textWidth = _getTextWidth(constraints);
      isOverflow = constraints.maxWidth <= textWidth;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          children: [
            if (isOverflow) SizedBox(width: 100),
            Text(_text, style: widget.style),
          ],
        ),
      );
    });
  }

  double _getTextWidth(BoxConstraints constraints) {
    maxWidth = constraints.maxWidth;
    final c = BoxConstraints(maxWidth: double.infinity);
    RichText text = RichText(text: TextSpan(style: widget.style, text: _text));
    final renderBox = text.createRenderObject(context);
    renderBox.layout(c);
    return renderBox.size.width;
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }
}
