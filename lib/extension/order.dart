import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';

extension EOrder on OrderModel {
  String get orderNumber {
    return '${owner!.id.toString().padLeft(8, '0')}-${id.toString().padLeft(8, '0')}';
    // return formatOrderNumber.format(id);
    // return id.toString().padLeft(8, '0');
  }

  MeValue get currency {
    var price = 0;
    for (var sale in sales!) {
      price += sale.amount! * sale.product!.price!;
    }
    return MeValue(
      text: '₭ ${formatCurrency.format(price)}',
      value: price,
    );
  }

  Widget listCell(
    BuildContext context, {
    ORDERSTATUS status = ORDERSTATUS.PENDING,
    bool isExpanded = false,
  }) {
    switch (status) {
      case ORDERSTATUS.PENDING:
        return _pendingListCell(
          context,
          isExpanded: isExpanded,
        );
      case ORDERSTATUS.APPLE:
        break;
      case ORDERSTATUS.DELIVERY:
        break;
      case ORDERSTATUS.COMEBACK:
        break;
      case ORDERSTATUS.DONE:
        break;
      case ORDERSTATUS.PROGRESS:
        break;
    }
    return _pendingListCell(
      context,
      isExpanded: isExpanded,
    );
  }

  Widget _pendingListCell(
    BuildContext context, {
    bool isExpanded = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(offsetBase),
      decoration: containerBorder(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          orderNumber,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          ' (PENDING)',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Waiting for each product accepted by restaurant',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  var provider = context.read<OrderProvider>();
                  provider.updateSelected(id!);
                },
                child: Icon(
                  isExpanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          if (isExpanded) ...{
            Divider(),
            for (var sale in sales!) ...{
              sale.orderItem(context),
            },
          },
          Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${sales!.length} Products (${currency.text})',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      'Delivery Fee (₭ ${formatCurrency.format(50000)})',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                currency.text!,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
