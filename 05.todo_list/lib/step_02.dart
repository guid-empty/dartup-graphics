import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        pageTransitionsTheme: PageTransitionsTheme(
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
  List<String> _todoItems = [];

  String _task = '';

  void _addTodoItem(String task) {
    setState(() {
      _todoItems.add(task);
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return new ListTile(
      title: new Text(todoText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add task',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text('Add a new task')),
        body: Column(
          children: <Widget>[
            new TextField(
              autofocus: true,
              onSubmitted: (value) {
                _addTodoItem(value);
                Navigator.pop(context);
              },
              onChanged: (value) {
                _task = value;
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
            new RaisedButton(
              child: Text('Add new task'),
              onPressed: () {
                _addTodoItem(_task);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }));
  }
}
