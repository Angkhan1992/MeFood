import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/model/restaurant/restaurant.dart';

extension EProduct on ProductModel {
  Widget listItem(
    BuildContext context, {
    Function()? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).hintColor,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: galleries![0],
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Image.asset(
                    'assets/images/web/logo.png',
                    width: 75.0,
                    height: 75.0,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 160.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title!,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  desc!,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '$price\nກີບ',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customerPreview(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 8 / 5,
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).hintColor,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/status_bar.svg',
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
