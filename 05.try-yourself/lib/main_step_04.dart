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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.star),
            Image.asset('assets/dartup.png'),
            Icon(Icons.star)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'type your login  here*',
                ),
              ),),

            RaisedButton(
              onPressed: () {},
              child: Text('SIGN IN'),
            )
          ],
        ),
        Row()
      ],
    );
  }
}
