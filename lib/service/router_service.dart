import 'package:flutter/material.dart';
import 'package:mefood/screen/restaurant/auth/contact_block.dart';
import 'package:mefood/screen/restaurant/block_account.dart';
import 'package:mefood/screen/restaurant/contact_screen.dart';
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
  static String routeContact = '/contact';
  static String routeContactBlock = '/contactBlock';

  static getRoutes() {
    return <String, WidgetBuilder>{
      routeHome: (context) => HomeScreen(),
      routeLogin: (context) => LoginScreen(),
      routeRegister: (context) => RegisterScreen(),
      routePending: (context) => PendingAccount(),
      routeBlock: (context) => BlockAccount(),
      routeContact: (context) => ContactScreen(),
      routeContactBlock: (context) => ContactBlock(),
    };
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
