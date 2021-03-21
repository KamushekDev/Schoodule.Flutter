import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var lesson = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('11:35'),
            Text('13:00'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Практика',
              style: Theme.of(context).textTheme.overline,
            ),
            Text('Технологии разработки сложного ПО'),
          ],
        ),
        Column(
          children: [
            Text('Синев В.Е.'),
            Text('1213'),
          ],
        )
      ],
    );

    var day = Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          Text('Day'),
          Column(
            children: [
              lesson,
              Divider(),
              lesson,
              Divider(),
              lesson,
              Divider(),
              lesson,
              Divider(),
              lesson,
            ],
          )
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.rotate(angle: radians(90), child: Text('First week')),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Card>[
                day,
                day,
                day,
                day,
                day,
              ],
            ),
            Transform.rotate(
              angle: radians(-90),
              child: Text('Second week'),
            )
          ],
        ),
      ),
    );
  }
}
