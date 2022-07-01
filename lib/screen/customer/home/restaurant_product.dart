import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mefood/extension/product.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/appbar.dart';

class RestaurantProduct extends StatefulWidget {
  final RestaurantModel restaurant;

  RestaurantProduct({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  State<RestaurantProduct> createState() => _RestaurantProductState();
}

class _RestaurantProductState extends State<RestaurantProduct> {
  List<ProductModel> products = [];
  int page = 0;
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      fetch();
    });
  }

  Future<void> fetch() async {
    var prods = await EProduct.getProductsByRest(
      context,
      widget.restaurant,
      page: page,
    );
    if (prods.isNotEmpty) {
      if (page == 0) {
        products.clear();
      }
      products.addAll(prods);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: widget.restaurant.name!,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: refreshController,
        onRefresh: () async {
          page = 0;
          await fetch();
          refreshController.refreshCompleted();
        },
        onLoading: () async {
          page += 1;
          if (products.length > (page - 1) * 10) {
            await fetch();
          }
          refreshController.loadComplete();
        },
        child: GridView.count(
          padding: const EdgeInsets.symmetric(
            horizontal: offsetBase,
            vertical: offsetXMd,
          ),
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          crossAxisCount: 2,
          children: products.map((e) => e.gridItem(context)).toList(),
        ),
      ),
    );
  }
}
