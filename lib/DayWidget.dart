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
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Card(
          elevation: 10,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text('Day', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Divider(),
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
      ),
    );
  }
}
