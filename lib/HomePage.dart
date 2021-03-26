import 'package:flutter/material.dart';

import 'DayWidget.dart';
import 'WeekSidebarType.dart';
import 'WeekSidebarWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key); //s

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
