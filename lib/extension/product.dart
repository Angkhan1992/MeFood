import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/provider/restaurant/restaurant_provider.dart';
import 'package:mefood/service/service.dart';

final formatCurrency = NumberFormat('###,###,###');

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

  String get currency {
    return '₭ ${formatCurrency.format(price)}';
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
                  imageUrl:
                      kDomain + (galleries == null ? 'url' : galleries![0]),
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
                            child: Text(
                              title!,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            currency,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Text(
                        desc!,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w200,
                        ),
                        maxLines: 2,
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
    var restaurant = context.read<RestaurantProvider>().restaurant!;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    galleries == null
                        ? AspectRatio(
                            aspectRatio: 8 / 5,
                            child: Container(
                              width: double.infinity,
                              color: Theme.of(context).hintColor,
                            ),
                          )
                        : CarouselSlider(
                            options: CarouselOptions(
                              height: 300 * 5 / 8,
                              aspectRatio: 8 / 5,
                              viewportFraction: 1.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            items: galleries!.map((link) {
                              return CachedNetworkImage(
                                imageUrl: '$kDomain$link',
                                width: 300.0,
                                height: 300 * 5 / 8,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: SizedBox(
                                    width: 75.0,
                                    height: 75.0,
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      strokeWidth: 2.0,
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
                              );
                            }).toList(),
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
                    children: [
                      Row(
                        children: [
                          Text(
                            title!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                          ),
                          const Spacer(),
                          Text(
                            currency,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        desc!,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.cookie,
                            size: 16.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '$prepareTime Minutes',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.columns,
                            size: 16.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '$value $unit',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.searchLocation,
                            size: 16.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Go to Google Map',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.dinner_dining,
                            size: 16.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            restaurant.name!,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Recent Reviews',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 48.0,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        size: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Center(
                    child: Text(
                      '${currency}\nADD CART',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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

  Future<String?> updateProduct(BuildContext context) async {
    if (validate != null) {
      return validate;
    }
    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantProduct}/update',
      {
        'product': jsonEncode(toJson()),
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        var provider = context.read<RestaurantProvider>();
        await provider.updateProduct(this);
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  Future<String?> removeProduct(BuildContext context) async {
    if (validate != null) {
      return 'Already chaanged item information';
    }
    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantProduct}/remove',
      {
        'product': jsonEncode(toJson()),
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        var provider = context.read<RestaurantProvider>();
        await provider.removeProduct(this);
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
