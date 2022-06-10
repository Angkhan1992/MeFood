import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/screen/restaurant/home/add_product.dart';
import 'package:mefood/screen/base/empty_list.dart';
import 'package:mefood/screen/restaurant/home/product_detail.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/button.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, child) {
        var products = provider.products;
        logger.d(products);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                'Products(${products.length})'.pageTitle,
                const Spacer(),
                SizedBox(
                  width: 120.0,
                  child: CustomFillButton(
                    title: 'Add Product',
                    isMenu: true,
                    onTap: () => NavigatorService.of(context).push(
                      screen: AddProduct(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            products.isEmpty
                ? SizedBox(
                    height: 600,
                    child: EmptyListWidget(),
                  )
                : GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1,
                    children: products
                        .map((e) => e.listItem(
                              context,
                              onTap: () => NavigatorService.of(context).push(
                                screen: ProductDetail(model: e.copyWith()),
                              ),
                            ))
                        .toList(),
                  ),
          ],
        );
      },
    );
  }
}
