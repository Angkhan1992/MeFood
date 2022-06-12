import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';

class SearchProduct extends StatefulWidget {
  SearchProduct({Key? key}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: 'Search'.toUpperCase(),
        icon: Icon(
          LineIcons.search,
          size: sizeIcon,
        ),
        actions: [
          Icon(LineIcons.filter),
          const SizedBox(width: offsetBase),
        ],
      ),
    );
  }
}
