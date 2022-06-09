import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/util/config.dart';

extension EString on String {
  static const String emailRegx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String? get validateEmail => (trim().isEmpty)
      ? '${S.current.empty} ${S.current.email_address}'
      : (!RegExp(emailRegx).hasMatch(trim()))
          ? S.current.no_match_email
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

  Widget get wToolbar {
    return Text(
      this,
      style: const TextStyle(
        fontFamily: 'Horizon',
        fontSize: 36,
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

  Widget get subtitle => Text(
        this,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
      );

  Widget get cardTitle => Text(
        this,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      );

  Widget get pageSubTitle => Text(
        this,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w200,
        ),
      );

  Widget get pageTitle => Text(
        this,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
        ),
      );

  Color? get convert2Color {
    try {
      int value = int.parse(this, radix: 16);
      return Color(value);
    } catch (e) {
      return null;
    }
  }

  DateTime get dateFromServer => DateTime.parse(this);

  DateTime get localDate => DateTime.parse(this).toLocal();

  String get visiableDate {
    var currentDate = DateTime.now();
    var diffDay = currentDate.difference(localDate).inDays;
    switch (diffDay) {
      case 0:
        return localDate.visiableTime;
      case 1:
        return S.current.yesterday;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        return localDate.visiableWeek;
      default:
        return localDate.visiableDate;
    }
  }

  String get regdateValue =>
      DateFormat('MM/dd/yyyy').format(DateTime.parse(this));

  String get dobValue =>
      DateFormat('MM/dd/yyyy').format(DateFormat('yyyy/MM/dd').parse(this));

  String get firstUppercase {
    var lowercasae = toLowerCase();
    return lowercasae[0].toUpperCase() + lowercasae.substring(1);
  }
}
