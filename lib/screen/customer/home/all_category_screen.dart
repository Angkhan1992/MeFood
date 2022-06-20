import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class AllCategoryScreen extends StatefulWidget {
  final List<CategoryModel> categories;
  const AllCategoryScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: S.current.category.toUpperCase(),
        icon: Icon(
          LineIcons.shoppingBag,
          size: sizeIcon,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXMd,
        ),
        itemBuilder: (context, index) {
          return widget.categories[index].listCell(context);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: offsetSm,
          );
        },
        itemCount: widget.categories.length,
      ),
    );
  }
}
