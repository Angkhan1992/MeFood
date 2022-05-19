import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/delivery/order_provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, value, child) {
        return Column(
          children: [],
        );
      },
    );
  }
}
