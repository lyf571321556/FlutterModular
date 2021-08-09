import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  String taskUUID;

  ThirdPage({this.taskUUID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("三页"),
      ),
      body: CupertinoButton(child: Text(this.taskUUID), onPressed: () {

      }),
    );
  }
}
