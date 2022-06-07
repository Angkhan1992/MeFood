import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

class PendingOrder extends StatefulWidget {
  PendingOrder({Key? key}) : super(key: key);

  @override
  State<PendingOrder> createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Pending Orders'.pageTitle,
        const SizedBox(height: 24.0),
      ],
    );
  }
}
