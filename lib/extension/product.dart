import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/util/util.dart';
import 'package:provider/provider.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/screen/customer/base/product_detail.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/button.dart';

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

  Widget customerListItem(BuildContext context) {
    var height = 96.0;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            onTap: () => NavigatorService.of(context).push(
              screen: ProductDetail(product: this),
            ),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: '$kDomain${galleries![0]}',
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        width: height / 2,
                        height: height / 2,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: height / 3 * 2,
                        height: height / 3 * 2,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: offsetBase,
                      vertical: offsetSm,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title!,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  currency,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                ActionButton(
                                  iconData: Icons.ios_share_rounded,
                                ),
                                const SizedBox(width: 16.0),
                                ActionButton(
                                  iconData: Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 16.0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  child: Text(
                                    'Add Cart',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
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
                      '$currency\nADD CART',
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

  Widget productSquare(
    BuildContext context, {
    String? type,
    bool showRestaurant = true,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: InkWell(
        onTap: () => NavigatorService.of(context).push(
          screen: ProductDetail(
            product: this,
            showRestaurant: showRestaurant,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Stack(children: [
            CachedNetworkImage(
              width: 250.0,
              height: 200.0,
              imageUrl: '$kDomain${galleries![0]}',
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 125.0,
                  height: 125.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
              fit: BoxFit.cover,
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
            if (type != null) SvgPicture.asset('assets/tags/tag_$type.svg'),
          ]),
        ),
      ),
    );
  }

  Widget gridItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 1.0,
            color: Theme.of(context).shadowColor.withOpacity(0.15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: '$kDomain${galleries![0]}',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor,
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title!,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(width: offsetXSm),
                                    Text(
                                      currency,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  var sale =
                                      SaleModel(product: this, amount: 1);
                                  var orderProvider =
                                      context.read<OrderProvider>();
                                  var resp = await orderProvider.addCart(sale);
                                  if (resp) {
                                    DialogService.of(context).showSnackBar(
                                      'Successfully added to cart',
                                    );
                                  } else {
                                    DialogService.of(context).showSnackBar(
                                      'This product was already added to cart.',
                                      type: SnackBarType.info,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  child: Icon(
                                    LineIcons.shoppingBasket,
                                    size: 18.0,
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }

  Future<String?> addProduct(
    BuildContext context,
    int restId,
  ) async {
    var param = toJson();
    param['rst_id'] = restId;
    param['cat_id'] = category!.id!;

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
    var param = toJson();
    param['cat_id'] = category!.id!;
    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantProduct}/update',
      {
        'product': jsonEncode(param),
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

  static Future<List<ProductModel>> getNewProducts() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlProduct}/new',
      {},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      }
    }
    return [];
  }

  static Future<List<ProductModel>> getTopProducts() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlProduct}/top',
      {},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      }
    }
    return [];
  }

  static Future<List<ProductModel>> getProductsByRest(
    BuildContext context,
    RestaurantModel restaurant, {
    int page = 0,
  }) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlProduct}/res',
      {'id': restaurant.id, 'page': page},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((e) => ProductModel.fromJson(e)..restaurant = restaurant)
            .toList();
      }
    }
    return [];
  }

  static Future<List<ProductModel>> getNewProductsByRest(int restId) async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlProduct}/newRest',
      {'id': restId},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      }
    }
    return [];
  }
}
