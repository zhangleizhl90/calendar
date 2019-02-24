import 'package:calendar/component/week_widget.dart';
import 'package:flutter/widgets.dart';

class MonthWidget extends StatelessWidget {

  final DateTime firstDay;

  const MonthWidget({Key key, this.firstDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          WeekWidget(firstDay: this.firstDay),
          WeekWidget(firstDay: this.firstDay.add(Duration(days: 7))),
          WeekWidget(firstDay: this.firstDay.add(Duration(days: 7*2))),
          WeekWidget(firstDay: this.firstDay.add(Duration(days: 7*3))),
          WeekWidget(firstDay: this.firstDay.add(Duration(days: 7*4))),
          WeekWidget(firstDay: this.firstDay.add(Duration(days: 7*5))),
        ]
      )
    );
  }
}