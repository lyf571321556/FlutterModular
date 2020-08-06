import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("次页"),
      ),
      body: CupertinoButton(child: Text('Next'), onPressed: () {
        Modular.to.pushNamed("/home/detail/wii8tjdnHk4");
      }),
    );
  }
}
