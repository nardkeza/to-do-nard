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
      child: Column(
        children: [
          ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blueGrey,
                  child: CircleAvatar(
                    radius: 50,
                    
                  ),
                ),
                title: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                
          ),
          ListTile(
                title: const Text('All items'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
          ListTile(
                title: const Text('Pending'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
          ListTile(
                title: const Text('Already done'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

        ],
      )),
      
    );
    
  }

}


