import 'package:flutter/material.dart';
import 'package:to_dont_list/to_do_items.dart';

class NewWindow extends StatefulWidget{
  @override 
  _NewWindowState createState() => _NewWindowState();
}
class _NewWindowState extends State <NewWindow>{
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.blue[50],
    ),
    child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                title: const Text('All Tasks'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Pending Tasks'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Completed Tasks'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      
    );
    
  }

}





