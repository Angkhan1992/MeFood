import 'package:flutter/material.dart';

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
