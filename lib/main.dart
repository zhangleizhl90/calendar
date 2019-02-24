import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // This is the theme of your application.
       //
       // Try running your application with "flutter run". You'll see the
       // application has a blue toolbar. Then, without quitting the app, try
       // changing the primarySwatch below to Colors.green and then invoke
       // "hot reload" (press "r" in the console where you ran "flutter run",
       // or simply save your changes to "hot reload" in a Flutter IDE).
       // Notice that the counter didn't reset back to zero; the application
       // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: PageView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return MonthView();
                  },
                  scrollDirection: Axis.horizontal,
                ),
                height: 300,
                width: double.infinity,
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white
          ),
        ),
      )
    );
  }
}

class MonthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeekView(),
        WeekView(),
        WeekView(),
        WeekView(),
        WeekView(),
        WeekView(),
      ]
    );
  }
}

class WeekView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DayView(),
        DayView(),
        DayView(),
        DayView(),
        DayView(),
        DayView(),
        DayView(),
      ],
    );
  }
}

class DayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: DayViewPainter(),
      ),
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
    );
  }
}

class DayViewPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blueAccent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    double offsetX = 0.0;
    double offsetY = 0.0;
    TextSpan daySpan = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20
      ),
      text: '22',
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
    offsetX += dayTextPainter.width + 2;
    TextSpan holidaySpan = TextSpan(
      style: TextStyle(
        color: Colors.red,
        fontSize: 10
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