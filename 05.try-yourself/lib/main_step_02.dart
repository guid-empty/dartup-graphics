import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: MyHomePage(),
      ),
    ));


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(),
        Column(
          children: <Widget>[
            Text('Dart Up', textDirection: TextDirection.ltr,),
            Text('Try your self', textDirection: TextDirection.ltr,)
          ],
        ),
        Row()
      ],
    );
  }

}