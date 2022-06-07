import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';

class RestaurantProvider with ChangeNotifier, DiagnosticableTreeMixin {
  RestaurantModel? restaurant;
  MemberModel? user;
  List<ProductModel> products = [];
  String pageIndex = '0:0';

  void setRestaurant(RestaurantModel model) {
    restaurant = model;
    notifyListeners();
  }

  void setUser(MemberModel model) {
    user = model;
    notifyListeners();
  }

  void setPageIndex(String index) {
    pageIndex = index;
    notifyListeners();
  }

  Future<String?> login(
    BuildContext context, {
    required String email,
    required String pass,
    required String type,
  }) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantAuth}/login',
      {
        'email': email,
        'password': pass.generateMD5,
        'type': type,
      },
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        restaurant = RestaurantModel.fromJson(resp['result']['restaurant']);
        user = MemberModel.fromJson(resp['result']['user']);
        logger.d(user);
        await PrefService.of().saveToken(resp['result']['token']);
        pageIndex = '0:0';
        notifyListeners();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  Future<String?> loginToken() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlRestaurantAuth}/token',
      {},
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        restaurant = RestaurantModel.fromJson(resp['result']['restaurant']);
        user = MemberModel.fromJson(resp['result']['user']);
        await PrefService.of().saveToken(resp['result']['token']);
        notifyListeners();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(StringProperty('restaurant', jsonEncode(restaurant!.toJson())));
    properties.add(StringProperty('user', jsonEncode(user!.toJson())));
    properties.add(StringProperty('pageIndex', pageIndex));
    properties.add(StringProperty(
        'products', jsonEncode(products.map((e) => e.toJson()).toList())));
  }
}
