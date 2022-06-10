import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/themes/theme.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final String? extend;
  final Function()? onExtend;
  const CategoryWidget({
    Key? key,
    required this.title,
    this.prefix,
    this.extend,
    this.onExtend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: offsetSm,
        left: offsetSm,
        right: offsetSm,
      ),
      child: Row(
        children: [
          if (prefix != null) ...{
            prefix!,
            const SizedBox(
              width: offsetBase,
            ),
          },
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const Spacer(),
          if (extend != null)
            InkWell(
              onTap: onExtend,
              child: extend!.wText(
                CustomText.medium(
                  fontSize: fontSm,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
