import 'package:flutter/material.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/screen/base/login_require.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatefulWidget {
  OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    var customer = context.read<CustomerProvider>().customer;
    return Scaffold(
      appBar: CustomAppbar(context, title: 'Order History'),
      body: (customer!.user == null)
          ? SafeArea(child: LoginRequire())
          : Container(),
    );
  }
}
