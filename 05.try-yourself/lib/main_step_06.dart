import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: MyStateFullHomePage(),
      ),
    ));

class MyStateFullHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStateFullHomePageState();
  }
}

class MyStateFullHomePageState extends State<MyStateFullHomePage> {
  bool _hasErrors = false;


  final TextEditingController _controller = TextEditingController(text: 'my login');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  labelText: 'type your login  here*',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _hasErrors = _controller.text.isEmpty;
                });
              },
              child: Text('SIGN IN'),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _hasErrors
              ? <Widget>[
                  Text(
                    'CHECK YOUR LOGIN OR PASSWORD',
                    style: TextStyle(color: Colors.redAccent),
                  )
                ]
              : <Widget>[],
        )
      ],
    );
  }
}
