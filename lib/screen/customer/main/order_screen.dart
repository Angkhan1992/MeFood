import 'package:flutter/material.dart';
import 'package:mefood/util/enum.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/themes/dimens.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
            child: S.current.orders
                .colorTitle(Theme.of(context).colorScheme.onSecondary),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(offsetXLg),
                  topRight: Radius.circular(offsetXLg),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Consumer<OrderProvider>(
                builder: (context, value, child) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: offsetBase,
                      vertical: offsetMd,
                    ),
                    itemBuilder: (context, i) {
                      var order = value.orders![i];
                      return order.listCell(
                        context,
                        status: OrderStatus.value((order.status)) ??
                            ORDERSTATUS.PENDING,
                        isExpanded: value.selected == order.id,
                      );
                    },
                    separatorBuilder: (context, i) => const SizedBox(
                      height: offsetSm,
                    ),
                    itemCount: value.orders!.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
