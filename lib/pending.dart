import 'package:flutter/material.dart';
import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/to_do_nard.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Pending Tasks'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 178, 251, 181),
      ),
      body:  Center(
        child: Text('Pending Items: '+' $pending'),
      ),
    );
  }
}