import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/themes/theme.dart';

class ExtendSubTitle extends StatelessWidget {
  final String subtitle;
  final String? extendTitle;
  final Function()? onTap;

  const ExtendSubTitle({
    Key? key,
    required this.subtitle,
    this.extendTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        if (extendTitle != null)
          InkWell(
            onTap: onTap,
            child: extendTitle!.wText(
              TextStyle(
                fontSize: fontSm,
                color: Theme.of(context).colorScheme.secondary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}
