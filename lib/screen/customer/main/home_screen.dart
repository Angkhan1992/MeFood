import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/product_model.dart';
import 'package:mefood/model/restaurant_model.dart';
import 'package:mefood/provider/category_provider.dart';
import 'package:mefood/screen/customer/home/all_category_screen.dart';
import 'package:mefood/screen/customer/home/category_screen.dart';
import 'package:mefood/service/json_service.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/common/appbar.dart';
import 'package:mefood/widget/main/fake_widget.dart';
import 'package:mefood/widget/main/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryProvider? _categoryProvider;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Timer.run(() => _initProvider());
  }

  void _initProvider() async {
    _categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    var categories = await JsonService.readCategoryFromJson();
    _categoryProvider!.instanceOfCategories(categories);
  }

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
                          prefix: SvgPicture.asset(
                            'assets/icons/ic_category.svg',
                            width: sizeIcon,
                            height: sizeIcon,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          title: S.current.category,
                          extend: 'View All',
                          onExtend: () => NavigatorService.of(context).push(
                            screen: AllCategoryScreen(
                              categories: _categoryProvider!.categories,
                            ),
                          ),
                        ),
                        categoryWidget(),
                        CategoryWidget(
                          prefix: Icon(
                            Icons.favorite_outline,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          title: S.current.hot_products,
                          extend: S.current.view_all,
                          onExtend: () {},
                        ),
                        productWidget(),
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.objectGroup,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          title: S.current.restaurants,
                          extend: S.current.view_all,
                          onExtend: () {},
                        ),
                        restaurantWidget(),
                        CategoryWidget(
                          prefix: Icon(
                            LineIcons.jediOrder,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          title: S.current.new_products,
                        ),
                        orderWidget(),
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
        child: Consumer<CategoryProvider>(
          builder: (context, value, child) {
            return Row(
              children: [
                for (var model in value.categories) ...{
                  homeCell(
                    context,
                    model: model,
                    onTap: () => NavigatorService.of(context).push(
                      screen: CategoryScreen(
                        category: model,
                      ),
                    ),
                  ),
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
              fakeHotModel(context, model: ProductModel()),
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
              fakeRestaurantModel(context),
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
        return fakeOrderModel(context, model: ProductModel());
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: offsetSm,
      ),
      itemCount: 10,
    );
  }
}
