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
    return Center();
  }

}