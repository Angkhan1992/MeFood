import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/screen/restaurant/home/base/empty_list.dart';
import 'package:mefood/screen/restaurant/home/product_detail.dart';
import 'package:mefood/service/service.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      products.add(
        ProductModel(
          title: 'Pizza',
          desc:
              'Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients',
          value: 4,
          unit: 'ຄົນ',
          price: 135000,
          galleries: [
            'http://192.168.0.253:52526/assets/gallery/gallery_1654587550174.jpg',
            'http://192.168.0.253:52526/assets/gallery/gallery_1654587550174.jpg',
            'http://192.168.0.253:52526/assets/gallery/gallery_1654587550174.jpg',
            'http://192.168.0.253:52526/assets/gallery/gallery_1654587550174.jpg',
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Products'.pageTitle,
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
                          onTap: () {
                            var provider = Provider.of<ProductProvider>(
                              context,
                              listen: false,
                            );
                            provider.setProduct(e);
                            NavigatorService.of(context).push(
                              screen: ProductDetail(),
                            );
                          },
                        ))
                    .toList(),
              ),
      ],
    );
  }
}
