import 'package:flutter/material.dart';
import 'package:mefood/util/extensions.dart';

import '../../themes/dimens.dart';
import '../../themes/textstyles.dart';

class CustomHeaderView extends StatelessWidget {
  final String title;
  final Widget? prefix;

  const CustomHeaderView({
    Key? key,
    required this.title,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
        bottom: offsetXMd,
        left: offsetSm,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (prefix != null) ...{
            prefix!,
            const SizedBox(
              width: offsetBase,
            ),
          },
          const SizedBox(
            width: offsetBase,
          ),
          title.colorTitle(Theme.of(context).colorScheme.onSecondary),
        ],
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final Widget icon;
  final Widget label;
  final Color? color;

  CustomBottomNavigationItem({
    required this.icon,
    required this.label,
    this.color,
  });
}

class CustomBottomBar extends StatelessWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem>? children;
  final Function(int)? onChange;
  final int currentIndex;

  const CustomBottomBar({
    Key? key,
    required this.backgroundColor,
    this.itemColor = Colors.black,
    this.children,
    this.onChange,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: offsetXSm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children!.map((item) {
          Widget icon = item.icon;
          Widget label = item.label;
          int index = children!.indexOf(item);
          return GestureDetector(
            onTap: () => onChange!(index),
            child: Container(
              width: 64,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Theme.of(context).colorScheme.onSecondary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon,
                  const SizedBox(
                    height: offsetXSm,
                  ),
                  label
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomAppbar extends AppBar {
  CustomAppbar(
    BuildContext context, {
    Key? key,
    required String title,
    Widget? icon,
    List<Widget>? actions,
  }) : super(
          key: key,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...{
                icon,
                const SizedBox(
                  width: offsetBase,
                ),
              },
              title.wText(
                CustomText.bold(
                  fontSize: fontXMd,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
          actions: actions,
        );
}
