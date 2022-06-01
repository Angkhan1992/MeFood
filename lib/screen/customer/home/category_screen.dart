import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mefood/model/category_model.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/common/appbar.dart';

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
          'assets/icons/category/${widget.category.icon}',
          width: sizeAppbarIcon,
          height: sizeAppbarIcon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
