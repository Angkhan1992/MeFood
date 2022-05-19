import 'package:flutter/material.dart';
import 'package:mefood/util/extensions.dart';

import '../../../themes/dimens.dart';

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
            child:
                'Order'.colorTitle(Theme.of(context).colorScheme.onSecondary),
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
            ),
          ),
        ],
      ),
    );
  }
}
