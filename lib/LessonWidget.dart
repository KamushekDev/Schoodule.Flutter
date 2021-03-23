import 'package:flutter/material.dart';

class LessonWidget extends StatefulWidget {
  LessonWidget({Key key}) : super(key: key);

  @override
  _LessonWidgetState createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 3,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(90),
                    bottom: Radius.circular(90),
                  )),
            ),
          ),
          SizedBox(
            width: 46,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                children: [
                  Text('55:55'),
                  Text('13:00'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Практика',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Технологии разработки сложного ПО',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Синев В.Е.', style: Theme.of(context).textTheme.caption),
                Text('1213'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
