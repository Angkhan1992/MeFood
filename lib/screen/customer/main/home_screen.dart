import 'dart:async';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
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
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.shoppingBasket,
                            size: sizeIcon,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: S.current.new_products,
                        ),
                        orderWidget(),
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.shirtsInBulk,
                            size: sizeIcon,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          title: S.current.hot_products,
                          extend: S.current.view_all,
                          onExtend: () {},
                        ),
                        productWidget(),
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
        vertical: offsetXMd,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder<List<CategoryModel>>(
          future: ECategory.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ProgressWidget(
                color: Theme.of(context).colorScheme.secondary,
              );
            }
            if (snapshot.hasError) {
              return Container();
            }
            if (snapshot.data == null) {
              return Container();
            }
            categories = snapshot.data!;
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
        vertical: offsetXMd,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var i = 0; i < 10; i++) ...{
              // fakeHotModel(context, model: ProductModel()),
              const SizedBox(
                width: offsetBase,
              ),
            },
          ],
        ),
      ),
    );
  }

  Widget restaurantWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: offsetXMd,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var i = 0; i < 10; i++) ...{
              // fakeRestaurantModel(context),
              const SizedBox(
                width: offsetBase,
              ),
            },
          ],
        ),
      ),
    );
  }

  Widget orderWidget() {
    return ListView.separated(
      controller: _scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container();
        // return fakeOrderModel(context, model: ProductModel());
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: offsetSm,
      ),
      itemCount: 10,
    );
  }
}
