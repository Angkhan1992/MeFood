import 'package:flutter/material.dart';
import 'package:mefood/provider/base/order_provider.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:provider/provider.dart';

class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: 'Confirm Order',
      ),
      body: SingleChildScrollView(
        child: Consumer<OrderProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
