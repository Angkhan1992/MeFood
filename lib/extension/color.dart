import 'package:flutter/material.dart';

extension EColor on Color {
  String get convett2String {
    String colorString = toString();
    return colorString.split('(0x')[1].split(')')[0];
  }
}
