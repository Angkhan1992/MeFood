import 'package:flutter/material.dart';
import 'package:mefood/extensions/e_string.dart';

import '../themes/dimens.dart';
import '../themes/textstyles.dart';
import '../widget/common/mark.dart';

class RestaurantModel {
  static Widget fakeModel(
    BuildContext context,
  ) {
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
                'assets/images/img_restaurant.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              const SaleMark(),
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
                                  'Amarzon Coffee'.wText(
                                    CustomText.bold(
                                      fontSize: fontMd,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  ),
                                  '23 pieces'.wText(
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
                            // Icon(
                            //   Icons.favorite,
                            //   color: Theme.of(context).colorScheme.onSecondary,
                            // ),
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
}
