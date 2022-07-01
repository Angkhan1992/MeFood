import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/screen/customer/order/confirm_order.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class MyCartScreen extends StatefulWidget {
  final Function()? onCreateOrder;

  const MyCartScreen({
    Key? key,
    this.onCreateOrder,
  }) : super(key: key);

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
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(offsetXLg),
                    topRight: Radius.circular(offsetXLg),
                  ),
                  child: Container(
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
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              horizontal: offsetBase,
                              vertical: offsetXMd,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var sale = provider.products![index];
                              return sale.cartItem(context);
                            },
                            itemCount: provider.products!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: offsetXSm,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: offsetBase,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: offsetBase,
                          ),
                          child: CustomFillButton(
                            title: 'Make Order   -   ${provider.getCurrency()}',
                            onTap: () async {
                              var token = await PrefService.of().token();
                              if (token == null) {
                                DialogService.of(context).showSnackBar(
                                  'You need to login for make order',
                                  type: SnackBarType.info,
                                );
                                return;
                              }
                              NavigatorService.of(context).push(
                                  screen: ConfirmOrder(),
                                  pop: (value) {
                                    if (value != null) {
                                      if (value == 'create_order') {
                                        widget.onCreateOrder!();
                                        return;
                                      }
                                      DialogService.of(context).showSnackBar(
                                        value,
                                        type: SnackBarType.info,
                                      );
                                    }
                                  });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: offsetBase,
                        ),
                      ],
                    ),
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
