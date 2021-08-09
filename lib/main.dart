import 'package:FlutterModular/AppModule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'AppWidget.dart';

void main() {
//  runApp(MyApp());
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
