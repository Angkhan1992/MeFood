import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

import 'package:mefood/themes/dimens.dart';

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
