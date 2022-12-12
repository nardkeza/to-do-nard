import 'package:flutter/material.dart';
import 'package:to_dont_list/main.dart';
import 'dart:core';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Completed Tasks'),
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 18, 43, 19),
      ),
      body:  Center(
        //child: Text('$complete_counter'),
        // ignore: avoid_print
      child: Text('Completed Items: '+' $complete'),
      ),
    );
  }
}

