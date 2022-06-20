import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class AllRestaurant extends StatefulWidget {
  AllRestaurant({Key? key}) : super(key: key);

  @override
  State<AllRestaurant> createState() => _AllRestaurantState();
}

class _AllRestaurantState extends State<AllRestaurant> {
  List<RestaurantModel> restaurants = [];
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
    var prods = await ERestaurantModel.getRestaurants(
      context,
      page: page,
    );
    if (prods.isNotEmpty) {
      if (page == 0) {
        restaurants.clear();
      }
      restaurants.addAll(prods);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: 'All Restaurants',
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
          if (restaurants.length > (page - 1) * 10) {
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
          children: [
            for (var restaurant in restaurants) ...{
              restaurant.gridCell(context),
            },
          ],
        ),
      ),
    );
  }
}
