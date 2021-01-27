import 'package:flutter/material.dart';
class Demo2 extends StatefulWidget {
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text("Second Page",style: TextStyle(color: Colors.red,fontSize: 40,)),)
    );
  }
}