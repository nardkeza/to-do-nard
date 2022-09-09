import 'package:flutter/material.dart';
void main() => runApp(
  new TodoApp(),
);
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo list',
      home: new TodoList(),
    );
  }
}
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}
class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
	  // Widget template comes here
  }

  // Other functions
}
final List<Todo> _todos = <Todo>[];
class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}