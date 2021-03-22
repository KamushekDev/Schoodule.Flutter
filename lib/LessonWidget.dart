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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 3,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 7,
            child: Column(
              children: [
                Text('11:35'),
                Text('13:00'),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 73,
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
          Flexible(
            fit: FlexFit.tight,
            flex: 20,
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
