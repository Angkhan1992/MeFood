import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension EString on String {
  static const String emailRegx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String? get validateEmail => (trim().isEmpty)
      ? 'Empty Email Field'
      : (!RegExp(emailRegx).hasMatch(trim()))
          ? 'Not Match Email'
          : null;

  String? get validatePassword => trim().isEmpty
      ? 'Empty Password Field'
      : trim().length < 8
          ? 'Password should be more then 8 charecters'
          : null;

  Widget get wTitle {
    return Text(
      this,
      style: const TextStyle(
        fontFamily: 'Horizon',
        fontSize: 48,
      ),
    );
  }

  Widget colorTitle(Color color) {
    return Text(
      this,
      style: TextStyle(
        fontFamily: 'Horizon',
        fontSize: 48,
        color: color,
      ),
    );
  }

  Widget wText(
    TextStyle style, {
    int lines = 1,
  }) {
    return Text(
      this,
      style: style,
      maxLines: lines,
    );
  }
}
