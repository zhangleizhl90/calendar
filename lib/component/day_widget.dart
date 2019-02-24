import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DayWidget extends StatelessWidget {
  final DateTime day;

  const DayWidget({Key key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(
        painter: _DayPainter(day.day.toString()),
      ),
      width: 45,
      height: 45,
    );
  }
}

class _DayPainter extends CustomPainter {

  final String dayString;

  _DayPainter(this.dayString);

  @override
  void paint(Canvas canvas, Size size) {
    double offsetX = 0.0;
    double offsetY = 0.0;
    TextSpan daySpan = TextSpan(
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400
      ),
      text: dayString,
    );
    TextPainter dayTextPainter = TextPainter(
        text: daySpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    dayTextPainter.layout();
    offsetX = (size.width - dayTextPainter.width) / 2.0;
    offsetY = (size.height - dayTextPainter.height) / 2.0;
    dayTextPainter.paint(canvas, Offset(offsetX, offsetY));
    offsetX += dayTextPainter.width + 4;
    offsetY += 2;
    TextSpan holidaySpan = TextSpan(
        style: TextStyle(
            color: Colors.red,
            fontSize: 8
        ),
        text: '班'
    );
    TextPainter holidayTextPainter = TextPainter(
        text: holidaySpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    holidayTextPainter.layout();
    holidayTextPainter.paint(canvas, Offset(offsetX, offsetY));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}