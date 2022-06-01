import 'package:flutter/material.dart';

class ListItemTag extends StatelessWidget {
  final String tag;

  const ListItemTag({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 10.0,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
