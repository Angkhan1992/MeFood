import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mefood/util/app_config.dart';

extension EString on String {
  static const String emailRegx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String? get validateEmail => (trim().isEmpty)
      ? 'Empty Email Field'
      : (!RegExp(emailRegx).hasMatch(trim()))
          ? 'Not Match Email'
          : null;

  List<bool> get validatePasswords {
    if (isEmpty) return [false, false, false, false, false];
    return [
      RegExp(passUpperPattern).hasMatch(trim()),
      RegExp(passLowerPattern).hasMatch(trim()),
      RegExp(passNumberPattern).hasMatch(trim()),
      RegExp(passSpecialPattern).hasMatch(trim()),
      RegExp(passLengthPattern).hasMatch(trim()),
    ];
  }

  String get generateMD5 => md5.convert(utf8.encode(this)).toString();

  bool get validatePassword {
    var valids = validatePasswords;
    for (var valid in valids) {
      if (!valid) {
        return false;
      }
    }
    return true;
  }

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
    bool centerLine = false,
  }) {
    return Text(
      this,
      style: style,
      maxLines: lines,
      textAlign: centerLine ? TextAlign.center : TextAlign.left,
    );
  }

  Color? get convert2Color {
    try {
      int value = int.parse(this, radix: 16);
      return Color(value);
    } catch (e) {
      return null;
    }
  }
}
