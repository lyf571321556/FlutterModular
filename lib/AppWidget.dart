import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set your initial route
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.blueAccent,
          hintColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.lightBlueAccent,
          indicatorColor: Colors.white,
          platform: TargetPlatform.iOS),
      initialRoute: "/",
      // navigatorKey: ModularApp/.navigatorKey,
      // add Modular to manage the routing system
      // onGenerateRoute: Modular.generateRoute,
    ).modular();
  }
}
