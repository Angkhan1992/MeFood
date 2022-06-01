import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/themes/theme.dart';

class HotMark extends StatelessWidget {
  final double size;
  const HotMark({
    Key? key,
    this.size = sizeMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(size),
        ),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: offsetSm,
            right: offsetSm,
          ),
          child: SvgPicture.asset(
            'assets/icons/ic_hot.svg',
            width: 18.0,
            height: 18.0,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}

class SaleMark extends StatelessWidget {
  final double size;
  const SaleMark({
    Key? key,
    this.size = sizeMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(size),
        ),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: offsetSm,
            right: offsetSm,
          ),
          child: '20%'.wText(
            CustomText.bold(
              fontSize: fontSm,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
