import 'package:flutter/material.dart';
import 'package:mefood/screen/restaurant/block_account.dart';
import 'package:mefood/screen/restaurant/home_screen.dart';
import 'package:mefood/screen/restaurant/login_screen.dart';
import 'package:mefood/screen/restaurant/pending_account.dart';
import 'package:mefood/screen/restaurant/register_screen.dart';

class RouterService {
  static String routeHome = '/home';
  static String routeLogin = '/login';
  static String routeRegister = '/register';
  static String routePending = '/pending';
  static String routeBlock = '/block';

  static getRoutes() {
    return <String, WidgetBuilder>{
      routeHome: (context) => HomeScreen(),
      routeLogin: (context) => LoginScreen(),
      routeRegister: (context) => RegisterScreen(),
      routePending: (context) => PendingAccount(),
      routeBlock: (context) => BlockAccount(),
    };
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
