// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/to_do_items.dart';
import 'package:to_dont_list/to_do_nard.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key, required this.title});

  final String title;

  @override
  State createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.red);

  Future<void> _displayTextInputDialog(BuildContext context) async {
    print("Loading Dialog");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('TO DO'),
            content: Column(
              children: <Widget>[
                TextField(
                  key: const Key("ICKey"),
                  onChanged: (value) {
                    setState(() {
                      taskText = value;
                    });
                  },
                  controller: _inputController,
                  decoration:
                      const InputDecoration(hintText: "type your task here"),
                ),
                TextField(
                  key: const Key("TCKey"),
                  onChanged: (value) {
                    setState(() {
                      timeText = value;
                    });
                  },
                  controller: _timeController,
                  decoration:
                      const InputDecoration(hintText: "type the time here"),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                key: const Key("OkButton"),
                style: yesStyle,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    _handleNewItem(taskText, timeText);
                    Navigator.pop(context);
                  });
                },
              ),

              // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputController,
                builder: (context, value, child) {
                  return ElevatedButton(
                    key: const Key("CancelButton"),
                    style: noStyle,
                    onPressed: value.text.isNotEmpty
                        ? () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }
                        : null,
                    child: const Text('Cancel'),
                  );
                },
              ),
            ],
          );
        });
  }

  String taskText = "";
  String timeText = "";
  int taskCounter = 0;

  final List<Item> items = [const Item("", time: "00:00", name: 'add to do')];
  final _itemSet = <Item>{};

  void _handleListChanged(Item item, bool completed) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      items.remove(item);
      if (!completed) {
        print("Completing");
        _itemSet.add(item);
        items.add(item);
      } else {
        print("Making Undone");
        _itemSet.remove(item);
        items.insert(0, item);
      }
    });
  }

  void _handleDeleteItem(Item item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
    });
  }

  void _handleNewItem(String TaskText, String TimeText) {
    setState(() {
      print("Adding new item");
      Item item = Item("", name: TaskText, time: timeText);
      items.insert(0, item);
      _inputController.clear();
      _timeController.clear();
    });
  }

  void _counter() {
    setState(() {
      taskCounter++;
    });
  }

//https://stackoverflow.com/questions/63515730/flutter-drawer-when-menu-icon-is-tapped
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NewWindow(),
        appBar: AppBar(
          title: const Text('Daily Planner'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: items.map((item) {
            return ToDoListItem(
              item: item,
              completed: _itemSet.contains(item),
              onListChanged: _handleListChanged,
              onDeleteItem: _handleDeleteItem,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _displayTextInputDialog(context);
          },
        ),
      ),
    );
  }
}

//return Scaffold(

void main() {
  runApp(const MaterialApp(
    title: 'To Do List',
    home: ToDoList(title: 'Home'),
  ));
}
