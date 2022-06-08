import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';

class RestaurantProvider with ChangeNotifier, DiagnosticableTreeMixin {
  RestaurantModel? restaurant;
  MemberModel? user;
  List<ProductModel> products = [];
  String pageIndex = '0:0';

  RestaurantProvider() {
    pageIndex = '0:0';
    initProvider();
  }

  Future<void> initProvider() async {
    restaurant = (await PrefService.of().getRestaurant()) ?? RestaurantModel();
    user = (await PrefService.of().getMember()) ?? MemberModel();
    products = await PrefService.of().getProducts();
    notifyListeners();
  }

  Future<void> setRestaurant(RestaurantModel model) async {
    await PrefService.of().setRestaurant(model);
    restaurant = model;
    notifyListeners();
  }

  Future<void> setUser(MemberModel model) async {
    await PrefService.of().setMember(model);
    user = model;
    notifyListeners();
  }

  Future<void> setProduct(List<ProductModel> models) async {
    await PrefService.of().setProducts(models);
    products = models;
    notifyListeners();
  }

  Future<void> addProduct(ProductModel model) async {
    products.insert(0, model);
    await _saveProvider();
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
        products = (resp['result']['products'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        await PrefService.of().saveToken(resp['result']['token']);
        await _saveProvider();
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
        products = (resp['result']['products'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        await PrefService.of().saveToken(resp['result']['token']);
        await _saveProvider();
        notifyListeners();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  Future<void> _saveProvider() async {
    if (restaurant != null) {
      await PrefService.of().setRestaurant(restaurant!);
    }
    if (user != null) {
      await PrefService.of().setMember(user!);
    }
    if (products.isNotEmpty) {
      await PrefService.of().setProducts(products);
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
