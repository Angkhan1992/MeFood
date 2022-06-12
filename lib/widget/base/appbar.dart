import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/base/mail_provider.dart';
import 'package:mefood/themes/theme.dart';
import 'package:provider/provider.dart';

class CustomHeaderView extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final List<Widget>? actions;

  const CustomHeaderView({
    Key? key,
    required this.title,
    this.prefix,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
        bottom: offsetXMd,
        left: offsetSm,
        right: offsetXMd,
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
          const Spacer(),
          for (var action in actions!) ...{
            const SizedBox(width: offsetSm),
            action,
          },
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

class NorchWidget extends Container {
  NorchWidget({
    required Color color,
  }) : super(
          width: 80.0,
          height: 4.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: color,
          ),
        );
}

class TextActionButton extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const TextActionButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: title.wText(
            TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}

class DrawMailIcon extends StatelessWidget {
  final Function()? onTap;

  const DrawMailIcon({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MailProvider>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          right: 16.0,
        ),
        child: provider.getUnreadCount() > 0
            ? Badge(
                badgeColor: Colors.red,
                child: Icon(Icons.email_outlined),
              )
            : Icon(Icons.email_outlined),
      ),
    );
  }
}

Row WebLogo() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/images/web/logo.png',
        width: 36.0,
        height: 36.0,
      ),
      const SizedBox(
        width: 24.0,
      ),
      S.current.mefood.wToolbar,
    ],
  );
}
