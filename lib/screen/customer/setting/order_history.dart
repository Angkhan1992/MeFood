import 'package:flutter/material.dart';
import 'package:mefood/widget/base/base.dart';

class OrderHistory extends StatefulWidget {
  OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, title: 'Order History'),
    );
  }
}
