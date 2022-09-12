//https://stackoverflow.com/questions/63515730/flutter-drawer-when-menu-icon-is-tapped
import 'package:flutter/material.dart';
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

        ],
      )),
      
    );
    
  }

}


