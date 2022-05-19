import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mefood/model/category_model.dart';
import 'package:mefood/model/product_model.dart';
import 'package:mefood/util/extensions.dart';

import '../../themes/dimens.dart';
import '../../themes/textstyles.dart';
import '../common/mark.dart';

Widget homeCell(
  BuildContext context, {
  required CategoryModel model,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(offsetBase),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: SvgPicture.asset(
            'assets/icons/category/${model.icon}',
            width: sizeHomeCategoryIcon,
            height: sizeHomeCategoryIcon,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        const SizedBox(
          height: offsetSm,
        ),
        model.name!.wText(
          CustomText.regular(),
        ),
      ],
    ),
  );
}

Widget listCell(
  BuildContext context, {
  required CategoryModel model,
  Function()? onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(offsetBase),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: offsetMd,
      vertical: offsetBase,
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/category/${model.icon}',
            width: sizeHomeCategoryIcon,
            height: sizeHomeCategoryIcon,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            width: offsetBase,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.name!.wText(
                  CustomText.bold(
                    fontSize: fontMd,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: offsetXSm,
                ),
                model.description!.wText(
                  CustomText.medium(
                    fontSize: fontSm,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: offsetSm,
          ),
          '>'.wText(
            CustomText.bold(
              fontSize: fontMd,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget fakeHotModel(
  BuildContext context, {
  required ProductModel model,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(offsetBase),
    child: Container(
      width: 150.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: AspectRatio(
        aspectRatio: 0.8,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/img_pizza.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            const HotMark(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 90.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.secondary.withOpacity(0),
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(offsetSm),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Italic Pizza'.wText(
                                  CustomText.bold(
                                    fontSize: fontMd,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                                '\$19.99'.wText(
                                  CustomText.medium(
                                    fontSize: fontXSm,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget fakeOrderModel(
  BuildContext context, {
  required ProductModel model,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(offsetBase),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/img_pizza.png',
                width: sizeOrderProduct,
                height: sizeOrderProduct,
              ),
              const HotMark(
                size: 36.0,
              ),
            ],
          ),
          const SizedBox(
            width: offsetSm,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Italic Pizza'.wText(
                  CustomText.bold(
                    fontSize: fontXMd,
                  ),
                ),
                Row(
                  children: [
                    '₭ 177,000'.wText(
                      CustomText.medium(
                        fontSize: fontSm,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(
                      width: offsetSm,
                    ),
                    for (var i = 0; i < 5; i++) ...{
                      Icon(
                        Icons.star,
                        size: 14.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    },
                  ],
                ),
                const SizedBox(
                  height: offsetXSm,
                ),
                'But if the question were phrased such that reclining wasn’t the default, passengers were willing to pay only \$12 to recline, while people wanted \$39 for their forward space to be infringed upon.'
                    .wText(
                  CustomText.medium(
                    fontSize: fontSm,
                  ),
                  lines: 2,
                ),
                const SizedBox(
                  height: offsetXSm,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 14.0,
                    ),
                    const SizedBox(
                      width: offsetSm,
                    ),
                    'Amarzon Coffee'.wText(
                      CustomText.bold(
                        fontSize: fontBase,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
