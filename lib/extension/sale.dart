import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';

extension Sale on SaleModel {
  String get currency {
    return '₭ ${formatCurrency.format(product!.price! * amount!)}';
  }

  Widget cartItem(BuildContext context) {
    var height = 96.0;
    var orderProvider = context.read<OrderProvider>();
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: offsetSm),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 1.0,
            color: Theme.of(context).shadowColor.withOpacity(0.15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: '$kDomain${product!.galleries![0]}',
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: height / 2,
                    height: height / 2,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: height / 3 * 2,
                    height: height / 3 * 2,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: offsetBase,
                  vertical: offsetSm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product!.title!,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: offsetXSm),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currency,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: offsetXSm),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            if (amount! == 1) {
                              return;
                            }
                            amount = amount! - 1;
                            orderProvider.changeAmount(this);
                          },
                          child: Icon(
                            Icons.remove_circle_outline,
                            size: 18.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          '$amount',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        InkWell(
                          onTap: () {
                            if (amount! == MAX_ORDER_AMOUNT) {
                              return;
                            }
                            amount = amount! + 1;
                            orderProvider.changeAmount(this);
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 18.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: offsetSm,
            ),
            InkWell(
              onTap: () {
                orderProvider.removeCart(this);
              },
              child: Container(
                width: 28.0,
                height: 28.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.remove_outlined,
                  size: 18.0,
                ),
              ),
            ),
            const SizedBox(
              width: offsetSm,
            ),
          ],
        ),
      ),
    );
  }

  Widget orderCell(
    BuildContext context, {
    required int amount,
  }) {
    var cellHeight = 28.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: cellHeight,
          height: cellHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).textTheme.bodyText1!.color!,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(cellHeight / 2.0),
            child: CachedNetworkImage(
              imageUrl: '$kDomain${product!.galleries![0]}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${product!.title}',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${product!.prepareTime} mins',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8.0),
        Text(
          ' × $amount',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          currency,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
