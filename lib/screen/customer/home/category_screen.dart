import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mefood/model/model.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: widget.category.name!,
        icon: SvgPicture.asset(
          'assets/icons/category/${widget.category.linkIcon}',
          width: sizeAppbarIcon,
          height: sizeAppbarIcon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
