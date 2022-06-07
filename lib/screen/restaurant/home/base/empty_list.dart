import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/extension/extension.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/ic_empty.svg',
            width: 75.0,
            height: 75.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 40.0,
          ),
          'Not found any items'.wText(TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w200,
          )),
        ],
      ),
    );
  }
}
