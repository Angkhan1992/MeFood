import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/service/service.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/provider/base/order_provider.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  List<RestaurantModel> restaurants = [];
  OrderProvider? provider;
  LocationService? locationService;

  @override
  void initState() {
    super.initState();

    Timer.run(fetchData);
  }

  void fetchData() async {
    locationService = LocationService.of(context);
    await locationService!.initService();
    provider = context.read<OrderProvider>();
    for (var product in provider!.products!) {
      var isContained = false;
      for (var restaurant in restaurants) {
        if (restaurant.id == product.product!.restaurant!.id) {
          isContained = true;
          break;
        }
      }
      if (!isContained) {
        restaurants.add(product.product!.restaurant!);
      }
    }
    setState(() {});

    initRouter();
  }

  void initRouter() async {
    var customer = context.read<CustomerProvider>().customer;
    var result = await locationService!.getOrderRouter(
      context,
      customer!.address!,
      restaurants: restaurants,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: 'Confirm Order',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXMd,
        ),
        child: Consumer<OrderProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Orders Detail',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4.0),
                for (var restaurant in restaurants) ...{
                  restaurant.orderCell(
                    context,
                    provider: provider,
                  ),
                },
                const SizedBox(height: 16.0),
                Text(
                  'Router Detail',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4.0),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
