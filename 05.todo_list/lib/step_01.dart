import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList(),
      theme: new ThemeData(
        primarySwatch: Colors.purple,
        pageTransitionsTheme: new PageTransitionsTheme(
          builders: {TargetPlatform.android: new CupertinoPageTransitionsBuilder()},
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: Text('Todo List'),
    );
  }
}
