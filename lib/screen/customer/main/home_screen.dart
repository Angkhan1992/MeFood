import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/screen/customer/base/search_product.dart';
import 'package:mefood/screen/customer/home/all_category_screen.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();

    Timer.run(() => _initProvider());
  }

  void _initProvider() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          CustomHeaderView(
            title: S.current.home,
            actions: [
              InkWell(
                onTap: () => NavigatorService.of(context).push(
                  screen: SearchProduct(),
                ),
                child: Icon(LineIcons.search),
              ),
            ],
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(offsetXLg),
                topRight: Radius.circular(offsetXLg),
              ),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: offsetBase,
                      vertical: offsetXMd,
                    ),
                    child: Column(
                      children: [
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.shoppingBag,
                            size: sizeIcon,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: S.current.category,
                          extend: 'View All',
                          onExtend: () => NavigatorService.of(context).push(
                            screen: AllCategoryScreen(categories: categories),
                          ),
                        ),
                        categoryWidget(),
                        const SizedBox(height: offsetSm),
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.shoppingBasket,
                            size: sizeIcon,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: S.current.new_products,
                        ),
                        orderWidget(),
                        const SizedBox(height: offsetSm),
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.shirtsInBulk,
                            size: sizeIcon,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: S.current.hot_products,
                        ),
                        productWidget(),
                        const SizedBox(height: offsetSm),
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.coffee,
                            size: sizeIcon,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: S.current.restaurants,
                          extend: S.current.view_all,
                          onExtend: () {},
                        ),
                        restaurantWidget(),
                        const SizedBox(height: offsetBase),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: offsetBase,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<CategoryProvider>(
          builder: (context, provider, view) {
            if (provider.categories!.isEmpty) {
              return snapErrorWidget();
            }
            categories = provider.categories!;
            return Row(
              children: [
                for (var model in categories) ...{
                  model.homeCell(context),
                  const SizedBox(
                    width: offsetBase,
                  ),
                },
              ],
            );
          },
        ),
      ),
    );
  }

  Widget productWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: offsetBase,
      ),
      child: Consumer<HotProductProvider>(
        builder: (context, provider, view) {
          if (provider.products!.isEmpty) {
            return snapErrorWidget();
          }
          var hotProducts = provider.products!;
          return Container(
            height: 200.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: hotProducts
                    .map((e) => e.productSquare(context, type: 'hot'))
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget restaurantWidget() {
    return FutureBuilder<List<RestaurantModel>>(
      future: ERestaurantModel.getNewRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return snapLoadingWidget();
        }
        if (snapshot.hasError || snapshot.data == null) {
          return snapErrorWidget();
        }
        var restaurants = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: restaurants.length,
          itemBuilder: (context, i) => restaurants[i].customerHomeList(context),
          separatorBuilder: (context, i) => const SizedBox(
            height: offsetXSm,
          ),
        );
      },
    );
  }

  Widget orderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: offsetBase,
      ),
      child: Consumer<NewProductProvider>(
        builder: (context, provider, view) {
          if (provider.products!.isEmpty) {
            return snapErrorWidget();
          }
          var newProducts = provider.products!;
          return Container(
            height: 200.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: newProducts
                    .map((e) => e.productSquare(context, type: 'new'))
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget snapErrorWidget() {
    return Container(
      height: 200.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/ic_empty.svg',
            color: Theme.of(context).hintColor,
            width: 40.0,
            height: 40.0,
          ),
          const SizedBox(),
          Text('Empty List'),
        ],
      ),
    );
  }

  Widget snapLoadingWidget() {
    return Container(
      height: 200.0,
      alignment: Alignment.center,
      child: ProgressWidget(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
