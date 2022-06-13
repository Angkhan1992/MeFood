import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mefood/extension/extension.dart';

import 'package:mefood/model/model.dart';
import 'package:mefood/screen/base/empty_list.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: widget.category.name!.toUpperCase(),
        icon: SvgPicture.network(
          widget.category.icon!,
          width: sizeAppbarIcon,
          height: sizeAppbarIcon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: widget.category.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: ProgressWidget(
                size: 28.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (snapshot.hasError) {
            return EmptyListWidget();
          }
          List<ProductModel> products = snapshot.data!;
          if (products.isEmpty) {
            return EmptyListWidget();
          }
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: offsetXMd,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: offsetBase),
                  child: Text(
                    'Found Products (${products.length})',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  controller: controller,
                  padding: const EdgeInsets.symmetric(
                    horizontal: offsetSm,
                    vertical: offsetBase,
                  ),
                  itemBuilder: (context, index) {
                    var i = index % products.length;
                    return products[i].customerListItem(context);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: offsetXSm,
                  ),
                  itemCount: products.length,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
