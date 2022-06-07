import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

class ExpandedTitle extends StatelessWidget {
  final String title;
  final List<String> subs;
  final int subIndex;
  final Widget icon;
  final bool selected;
  final Function()? onTap;
  final Function(int index)? onItemTap;

  const ExpandedTitle({
    Key? key,
    required this.icon,
    required this.title,
    required this.subs,
    this.subIndex = 0,
    this.selected = false,
    this.onTap,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !selected
        ? ListTile(
            leading: icon,
            title: Text(title),
            selected: selected,
            selectedColor: Theme.of(context).colorScheme.secondary,
            onTap: onTap,
            iconColor: Theme.of(context).hintColor,
            textColor: Theme.of(context).hintColor,
            trailing: Icon(Icons.arrow_right),
          )
        : Column(
            children: [
              ListTile(
                leading: icon,
                title: Text(title),
                selectedColor: Theme.of(context).colorScheme.secondary,
                selected: selected,
                trailing: Icon(Icons.arrow_drop_down),
                iconColor: Theme.of(context).hintColor,
                textColor: Theme.of(context).hintColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  children: [
                    for (var sub in subs) ...{
                      ListTile(
                        title: Text(sub),
                        selected: subs.indexOf(sub) == subIndex,
                        onTap: () => onItemTap!(subs.indexOf(sub)),
                        selectedColor: Theme.of(context).colorScheme.secondary,
                        iconColor: Theme.of(context).hintColor,
                        textColor: Theme.of(context).hintColor,
                      ),
                    },
                  ],
                ),
              ),
            ],
          );
  }
}

class CustomMenuItem extends PopupMenuItem {
  final Widget icon;
  final String title;
  final Color? color;

  CustomMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    Function()? onTap,
  }) : super(
          key: key,
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                icon,
                const SizedBox(width: 16.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          onTap: onTap,
        );
}

class CardView extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final bool isEncreased;
  final String percent;

  const CardView({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.percent,
    this.isEncreased = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18.0,
                ),
                const SizedBox(width: 8.0),
                title.toUpperCase().cardTitle,
                const Spacer(),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      subtitle1.wText(TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                      const SizedBox(height: 4.0),
                      subtitle2.wText(TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w200,
                      )),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                percent.wText(TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: isEncreased ? Colors.greenAccent : Colors.redAccent,
                )),
                const SizedBox(width: 8.0),
                Icon(
                  isEncreased ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 18.0,
                  color: isEncreased ? Colors.greenAccent : Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
