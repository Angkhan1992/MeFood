import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/service/pref_service.dart';

import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: kToolbarHeight,
              bottom: offsetXMd,
              left: offsetXMd,
            ),
            alignment: Alignment.centerLeft,
            child:
                'MyCart'.colorTitle(Theme.of(context).colorScheme.onSecondary),
          ),
          Consumer<OrderProvider>(
            builder: (context, provider, child) {
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: offsetBase,
                    vertical: offsetBase,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(offsetXLg),
                      topRight: Radius.circular(offsetXLg),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var sale = provider.products![index];
                            return sale.cartItem(context);
                          },
                          itemCount: provider.products!.length,
                        ),
                      ),
                      const SizedBox(
                        height: offsetBase,
                      ),
                      CustomFillButton(
                        title: 'Make Order   -   ${provider.getCurrency()}',
                        onTap: () async {
                          var token = await PrefService.of().token();
                          if (token == null) {
                            return;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
