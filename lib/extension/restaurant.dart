import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
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
            // onTap: () => NavigatorService.of(context).push(
            //   screen: ProductDetail(product: this),
            // ),
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
                              'View on Google Map',
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
}
