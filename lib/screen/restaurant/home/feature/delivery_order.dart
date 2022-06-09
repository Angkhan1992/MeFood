import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

class DeliveryOrder extends StatefulWidget {
  DeliveryOrder({Key? key}) : super(key: key);

  @override
  State<DeliveryOrder> createState() => _DeliveryOrderState();
}

class _DeliveryOrderState extends State<DeliveryOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Delivery Orders'.pageTitle,
        const SizedBox(height: 24.0),
      ],
    );
  }
}
