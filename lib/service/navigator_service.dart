import 'package:flutter/material.dart';

class NavigatorService {
  final BuildContext? context;

  NavigatorService(this.context);

  factory NavigatorService.of(BuildContext? context) {
    return NavigatorService(context);
  }

  void push({
    required Widget screen,
    bool replace = false,
    Function(dynamic)? pop,
  }) {
    if (replace) {
      Navigator.of(context!)
          .pushReplacement(
              MaterialPageRoute<Object>(builder: (context) => screen))
          .then((value) => {if (pop != null) pop(value)});
    } else {
      Navigator.of(context!)
          .push(MaterialPageRoute<Object>(builder: (context) => screen))
          .then((value) => {if (pop != null) pop(value)});
    }
  }

  void pushByRoute({
    required String routeName,
    bool replace = false,
  }) {
    if (context != null) {
      if (replace) {
        Navigator.pushReplacementNamed(
          context!,
          routeName,
        );
      } else {
        Navigator.pushNamed(
          context!,
          routeName,
        );
      }
    }
  }
}
