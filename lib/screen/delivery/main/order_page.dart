import 'package:flutter/material.dart';
import 'package:mefood/provider/delivery/delivery.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DeliveryProvider>(
      builder: (context, value, child) {
        return Column(
          children: [],
        );
      },
    );
  }
}
