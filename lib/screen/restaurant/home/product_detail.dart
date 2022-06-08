import 'package:flutter/material.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        var restaurantProvider = context.read<RestaurantProvider>();
        return Column(
          children: [
            HeaderView(
              key: const Key('header_view'),
              user: restaurantProvider.user!,
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<ProductProvider>(
                  builder: (context, provider, child) {
                    var model = provider.product;
                    return Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 1000.0),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 24.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              onTap: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                            const SizedBox(width: 16.0),
                                            model!.title!.pageTitle,
                                          ],
                                        ),
                                        const SizedBox(height: 24.0),
                                        Container(
                                          height: 600.0,
                                          padding: const EdgeInsets.all(24.0),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            boxShadow: [kShadowContainer],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Customer Preview',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 24.0),
                                      Container(
                                        width: 300,
                                        height: 600,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        child: model.customerPreview(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          constraints: BoxConstraints(maxWidth: 1000.0),
                          child: FooterView(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
