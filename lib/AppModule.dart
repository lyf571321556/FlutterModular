import 'package:FlutterModular/HomePage.dart';
import 'package:FlutterModular/SecondPage.dart';
import 'package:FlutterModular/ThirdPage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/second', child: (_, __) => SecondPage()),
        ChildRoute('/detail/:taskUUID',
            child: (_, args) => ThirdPage(taskUUID: args.params['taskUUID']),
            guards: [AppGuard()]),
      ];
}

class AppGuard implements RouteGuard {
  @override
  // TODO: implement guardedRoute
  String get guardedRoute => throw UnimplementedError();

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    debugPrint(path);
    debugPrint(router.path + ":" + router.modulePath);
    return Future.value(true);
  }
}
