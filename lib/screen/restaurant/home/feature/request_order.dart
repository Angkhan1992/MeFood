import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

class RequestOrder extends StatefulWidget {
  RequestOrder({Key? key}) : super(key: key);

  @override
  State<RequestOrder> createState() => _RequestOrderState();
}

class _RequestOrderState extends State<RequestOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Request Orders'.pageTitle,
        const SizedBox(height: 24.0),
      ],
    );
  }
}
