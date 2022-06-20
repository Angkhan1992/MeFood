import 'package:flutter/material.dart';
import 'package:mefood/widget/base/base.dart';

class AllProduct extends StatefulWidget {
  AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: 'All Products',
      ),
      body: Container(),
    );
  }
}
