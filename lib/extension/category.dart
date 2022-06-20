import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/screen/customer/home/category_screen.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';

extension ECategory on CategoryModel {
  static Future<List<CategoryModel>> getCategories() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlCategory}/get',
      {},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return (resp['result'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      }
    }
    return [];
  }

  Future<String?> add(BuildContext context) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlCategory}/add',
      toJson(),
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return null;
      } else {
        return resp['msg'];
      }
    }
    return S.current.sever_error;
  }

  Future<List<ProductModel>> getProducts() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlRestaurantProduct}/getByCat',
      toJson(),
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

  String get icon => '$kDomain$kUrlCategory${name!.toLowerCase()}.svg';

  Widget homeCell(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () => NavigatorService.of(context).push(
          screen: CategoryScreen(category: this),
        ),
        child: Column(
          children: [
            Container(
              width: 44.0,
              height: 44.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.0,
                ),
              ),
              child: SvgPicture.network(
                icon,
                color: Theme.of(context).colorScheme.secondary,
                placeholderBuilder: (context) => Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 28.0,
                    height: 28.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              name!,
              style: TextStyle(
                fontSize: 12.0,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listCell(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: offsetBase,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () => NavigatorService.of(context).push(
          screen: CategoryScreen(category: this),
          replace: true,
        ),
        child: Row(
          children: [
            SvgPicture.network(
              icon,
              width: 28.0,
              height: 28.0,
              color: Theme.of(context).colorScheme.secondary,
              placeholderBuilder: (context) => Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 28.0,
                  height: 28.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(width: offsetBase),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    description!,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
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
}
