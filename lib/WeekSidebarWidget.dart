import 'package:flutter/material.dart';

import 'WeekSidebarType.dart';

class WeekSidebarWidget extends StatefulWidget {
  WeekSidebarWidget(WeekSidebarType type, {Key key})
      : type = type,
        super(key: key);

  final WeekSidebarType type;

  @override
  _WeekSidebarWidgetState createState() => _WeekSidebarWidgetState();
}

class _WeekSidebarWidgetState extends State<WeekSidebarWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == WeekSidebarType.Current)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
          Center(
            child: RotatedBox(
              child: Text('Current week: WeekType'),
              quarterTurns: 1,
            ),
          ),
        ],
      );
    else
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: RotatedBox(
              child: Text('Next week: WeekType'),
              quarterTurns: 3,
            ),
          ),
          SizedBox(
            width: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
        ],
      );
  }
}
