import 'package:flutter/material.dart';
import 'package:mefood/service/constraint_service.dart';

class CustomLayout extends StatefulWidget {
  final Widget Function(BuildContext context, ConstraintService app) builder;
  CustomLayout({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var appConstraint = ConstraintService.of(constraints);
          return widget.builder(context, appConstraint);
        },
      ),
    );
  }
}
