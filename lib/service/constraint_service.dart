import 'package:flutter/material.dart';

class ConstraintService {
  BoxConstraints constraints;

  ConstraintService(this.constraints);

  factory ConstraintService.of(BoxConstraints constraints) {
    return ConstraintService(constraints);
  }
}
