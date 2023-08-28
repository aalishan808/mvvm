
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/shpash_view.dart';

import '../../view/signup_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final argume = settings.arguments;
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginView());
      case RoutesName.SignUp:
        return MaterialPageRoute(builder: (BuildContext context)=>SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      default:
        return MaterialPageRoute(builder: (_){
        return Scaffold(
          body: Center(
            child: Text('no routes defined'),
          ),
        );});

    }
  }
}