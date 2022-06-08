import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';

extension EProduct on ProductModel {
  String? get validate {
    if (title == null || title!.isEmpty || title!.length > 40) {
      return 'Invalid product title.';
    }
    if (prepareTime == null || prepareTime! < 0) {
      return 'Invalid product preparing time.';
    }
    if (desc == null || desc!.isEmpty || desc!.length > 300) {
      return 'Invalid product description.';
    }
    if (value == null || value! < 1) {
      return 'Invalid product unit value.';
    }
    if (unit == null || unit!.isEmpty) {
      return 'Invalid product unit.';
    }
    if (price == null || price! < 1) {
      return 'Invalid product price.';
    }
    if (galleries == null || galleries!.isEmpty) {
      return 'Empty product galleries.';
    }
    for (var gallery in galleries!) {
      if (gallery.isEmpty) {
        return 'Empty some product galleries.';
      }
    }
    return null;
  }

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
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
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
              ),
              Positioned.fill(
                bottom: 0.0,
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
                        Theme.of(context).primaryColor.withOpacity(0),
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

  Future<String?> addProduct(
    BuildContext context,
    int restId,
  ) async {
    var param = toJson();
    param['rst_id'] = restId;

    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantProduct}/add',
      {
        'product': jsonEncode(param),
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        id = resp['result'];
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
