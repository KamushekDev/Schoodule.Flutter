import 'package:flutter/material.dart';
import 'package:schoodule_flutter/LessonWidget.dart';

class DayWidget extends StatefulWidget {
  DayWidget({Key key}) : super(key: key);

  @override
  _DayWidgetState createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: Card(
        elevation: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text('Day2', style: Theme.of(context).textTheme.headline5),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 2,
            ),
            Column(
              children: [
                LessonWidget(),
                LessonWidget(),
                LessonWidget(),
                LessonWidget(),
                LessonWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
