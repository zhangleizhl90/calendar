import 'package:flutter/widgets.dart';
import 'package:calendar/component/day_widget.dart';

class WeekWidget extends StatelessWidget {

  final DateTime firstDay;

  const WeekWidget({Key key, this.firstDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          DayWidget(day: this.firstDay),
          DayWidget(day: this.firstDay.add(Duration(days: 1))),
          DayWidget(day: this.firstDay.add(Duration(days: 2))),
          DayWidget(day: this.firstDay.add(Duration(days: 3))),
          DayWidget(day: this.firstDay.add(Duration(days: 4))),
          DayWidget(day: this.firstDay.add(Duration(days: 5))),
          DayWidget(day: this.firstDay.add(Duration(days: 6))),
      ]));
  }
}
