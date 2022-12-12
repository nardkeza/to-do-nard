import 'package:flutter/material.dart';
import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/completed.dart';

// IMPROT NOT USED
// import 'package:to_dont_list/to_do_items.dart';

class NewWindow extends StatefulWidget {
  const NewWindow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewWindowState createState() => _NewWindowState();
}

class _NewWindowState extends State<NewWindow> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 227, 253, 241),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 178, 251, 181),
                ),
                child: Text('Menu'),
              ),
              ListTile(
                title: const Text('All Tasks'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ToDoList(
                                title: 'All Tasks',
                              )));
                },
              ),
              ListTile(
                title: const Text('Pending Tasks'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ToDoList(
                                title: 'Pending Tasks',
                              )));
                },
              ),
              ListTile(
                title: const Text('Completed Tasks'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Complete(
                              )));
                },
              ),
            ],
          ),
        ));
  }
}
