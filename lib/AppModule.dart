import 'package:FlutterModular/HomePage.dart';
import 'package:FlutterModular/SecondPage.dart';
import 'package:FlutterModular/ThirdPage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'AppWidget.dart';

class AppModule extends MainModule {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, __) => HomePage()),
        Router('/home', module: HomeModule()),
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => AppWidget();
}

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
//        Router('/', child: (_, __) => HomePage()),
        Router('/second', child: (_, __) => SecondPage()),
        Router('/detail/:taskUUID',
            child: (_, args) => ThirdPage(taskUUID: args.params['taskUUID']),guards: [AppGuard()]),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

class AppGuard implements RouteGuard {
  @override
  bool canActivate(String url) {
    return url != '/home/detail/wii8tjdnHk4';
  }

  @override
  // TODO: implement executors
  List<GuardExecutor> get executors => [LoginExecutor(message: 'check login')];
}

class LoginExecutor extends GuardExecutor {
  final String message;
  LoginExecutor({this.message});

  @override
  onGuarded(String path, {bool isActive}) {
    if (isActive) {
      print('logined and pass');
      return;
    }

    print('toast: need login => $message');
    // Suppose login.
    Modular.to.pushNamedAndRemoveUntil('/home/detail/wii8tjdnHk6',(route){
      print(route.settings.name);
      return route.settings.name == "/";
    });
  }
}