// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/to_do_items.dart';
import 'package:to_dont_list/to_do_nard.dart';

List complete = [];
List pending = [];

int complete_counter = 0;
int pending_counter = 0;
int all_counter = 0;

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

    String time = "";
    String TaskText = "";

    print("Loading Dialog");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add TO DO'),
            content: Column(
              children:[
                TextField(
                  key: const Key("ICKey"),
                  onChanged: (value) {
                    setState(() {
                      TaskText = value;
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
                      time = value;
                    });
                  },
                  controller: _timeController,
                  decoration:
                      const InputDecoration(hintText: "type the time here"),
                  keyboardType: TextInputType.datetime,
                ),
              ],
            ),
            actions: <Widget>[
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputController,
                builder: (context, value, child) {
                  return ElevatedButton(
                    key: const Key("OkButton"),
                    style: yesStyle,
                    onPressed: value.text.isNotEmpty ? () {
                      setState(() {
                         _handleNewItem(TaskText,time);
                        Navigator.pop(context);
                  });
                    }
                  : null, 
                    child: const Text('OK'),
                  );
                },
              ),

              // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
                  ElevatedButton(
                    key: const Key("CancelButton"),
                    style: noStyle,
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                            });
                },
  
                    child: const Text('Cancel'),
                  ),
            ],
          );
        });
  }

 final List<Item> items = [const Item(name: 'Add to-do',time:"Add time to-do")];

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
        complete_counter += 1;
        complete.add(item.name);
      } else {
        print("Making Undone");
        _itemSet.remove(item);
        items.insert(0, item);
        pending_counter += 1;
        pending.add(item.name);
      }
    });
  }

  void _handleDeleteItem(Item item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
      if (all_counter > 0) {
        all_counter -= 1;
      }
      else{
        all_counter = 0;
      }
      complete_counter += 1;
      complete.add(item.name);
      pending.remove(item.name);
    });
  }

  void _handleNewItem(String TaskText, String TimeText) {
    setState(() {
      print("Adding new item");
      Item item = Item(name: TaskText, time: TimeText);
      items.insert(0, item);
      _inputController.clear();
      _timeController.clear();
      all_counter += 1;
      pending.add(item.name);
    });
  }



//https://stackoverflow.com/questions/63515730/flutter-drawer-when-menu-icon-is-tapped
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NewWindow(),
     
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 178, 251, 181),
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
          backgroundColor:const Color.fromARGB(255, 178, 251, 181) ,
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

//return Scaffold(

void main() {
  runApp(const MaterialApp(
    title: 'Daily Planner',
    home: ToDoList(title: 'Home'),
  ));
}