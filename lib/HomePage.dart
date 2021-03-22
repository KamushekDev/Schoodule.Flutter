import 'package:flutter/material.dart';
import 'package:schoodule_flutter/WeekSidebarType.dart';
import 'package:schoodule_flutter/WeekSidebarWidget.dart';

import 'DayWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeekSidebarWidget(WeekSidebarType.Current),
            Expanded(
              child: ListView(
                children: <Widget>[
                  DayWidget(),
                  DayWidget(),
                  DayWidget(),
                  DayWidget(),
                  DayWidget(),
                  DayWidget(),
                ],
              ),
            ),
            WeekSidebarWidget(WeekSidebarType.Next),
          ],
        ),
      ),
    );
  }
}
