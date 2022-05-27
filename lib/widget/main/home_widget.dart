import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
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
      padding: const EdgeInsets.only(top: offsetSm),
      child: Row(
        children: [
          if (prefix != null) ...{
            prefix!,
            const SizedBox(
              width: offsetBase,
            ),
          },
          title.wText(
            CustomText.bold(fontSize: fontXMd),
          ),
          const Spacer(),
          if (extend != null)
            InkWell(
              onTap: onExtend,
              child: extend!.wText(
                CustomText.medium(fontSize: fontSm),
              ),
            ),
        ],
      ),
    );
  }
}
