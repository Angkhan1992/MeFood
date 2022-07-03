import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/screen/customer/base/restaurant_detail.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';

extension ERestaurantModel on RestaurantModel {
  String? get hasFullData {
    if (address!.hasFullData != null) {
      return '${address!.hasFullData} on ${S.current.address}';
    }
    if (name == null || name!.isEmpty) {
      return '${S.current.empty} ${S.current.name}';
    }
    if (email == null || email!.isEmpty) {
      return '${S.current.empty} ${S.current.email_address}';
    }
    if (phone == null || phone!.isEmpty) {
      return '${S.current.empty} ${S.current.phone_number}';
    }
    if (logo == null || logo!.isEmpty) {
      return '${S.current.empty} ${S.current.logo}';
    }
    if (galleries == null || galleries!.isEmpty) {
      return '${S.current.empty} ${S.current.galleries}';
    }
    if (category == null || category!.isEmpty) {
      return '${S.current.empty} ${S.current.category}';
    }
    return null;
  }

  Widget customerHomeList(BuildContext context) {
    var height = 96.0;
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: offsetSm),
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
        child: InkWell(
          onTap: () => NavigatorService.of(context).push(
            screen: RestaurantDetail(restaurant: this),
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
                          Text(
                            name!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
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
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.user,
                            size: 14.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            email!,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w200,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.phone,
                            size: 14.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            phone!,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w200,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            LineIcons.locationArrow,
                            size: 14.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            S.current.goto_google_map,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w200,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
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

  Widget gridCell(BuildContext context) {
    var logoSize = 36.0;
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
      child: InkWell(
        onTap: () => NavigatorService.of(context).push(
          screen: RestaurantDetail(restaurant: this),
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
                        child: Row(
                          children: [
                            Container(
                              width: logoSize,
                              height: logoSize,
                              padding: const EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  logoSize / 2.0,
                                ),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(logoSize / 2.0),
                                child: CachedNetworkImage(
                                  imageUrl: '$kDomain$logo',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: offsetSm,
                            ),
                            Expanded(
                              child: Text(
                                name!,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                              ),
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
      ),
    );
  }

  Widget orderCell(
    BuildContext context, {
    required OrderProvider provider,
  }) {
    var products = provider.getCartProductsByRest(id!);
    var price = provider.getCartPriceByRest(id!);
    var maxTime = 0;
    for (var product in products) {
      if (product.product!.prepareTime! > maxTime) {
        maxTime = product.product!.prepareTime!;
      }
    }
    return Container(
      margin: const EdgeInsets.only(bottom: offsetSm),
      padding: const EdgeInsets.all(offsetSm),
      decoration: containerBorder(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 44.0,
                height: 44.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: CachedNetworkImage(
                    imageUrl: '$kDomain$logo',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      name!,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
              Text(
                '$maxTime ${S.current.unit_min}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          Divider(),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.only(left: offsetMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var product in products) ...{
                  product.orderCell(
                    context,
                    amount: product.amount!,
                  ),
                  const SizedBox(height: offsetSm),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<List<RestaurantModel>> getNewRestaurants() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlCustomerHome}/recents',
      {},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((e) => RestaurantModel.fromJson(e))
            .toList();
      }
    }
    return [];
  }

  static Future<List<RestaurantModel>> getRestaurants(
    BuildContext context, {
    int page = 0,
  }) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlCustomerHome}/restaurants',
      {'page': page},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((e) => RestaurantModel.fromJson(e))
            .toList();
      }
    }
    return [];
  }
}
