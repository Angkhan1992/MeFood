import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel>? orders;
  List<SaleModel>? products;
  int selected = -1;

  OrderProvider() {
    orders = [];
    products = [];

    initData();
  }

  Future<void> initData() async {
    products = await PrefService().getSales();
    orders = await PrefService.of().getOrders();
    notifyListeners();
    await fetchData();
  }

  Future<void> fetchData() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlOrder}/orders',
      {},
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        orders!.clear();
        orders!.addAll((resp['result']['orders'] as List)
            .map((e) => OrderModel.fromJson(e))
            .toList());
        await updateLocal();
      }
    }
  }

  void updateSelected(int value) {
    if (selected == value) {
      selected = -1;
    } else {
      selected = value;
    }

    notifyListeners();
  }

  Future<void> updateLocal() async {
    await PrefService.of().setSales(products!);
    await PrefService.of().setOrders(orders!);
    notifyListeners();
  }

  Future<bool> addCart(SaleModel model) async {
    products ??= [];
    for (var product in products!) {
      if (product.product!.id! == model.product!.id!) {
        return false;
      }
    }
    products!.add(model);
    await updateLocal();
    return true;
  }

  Future<void> changeAmount(SaleModel model) async {
    products![products!.indexWhere(
        (element) => element.product!.id == model.product!.id)] = model;
    await updateLocal();
  }

  Future<void> removeCart(SaleModel model) async {
    products!.removeAt(products!
        .indexWhere((element) => element.product!.id == model.product!.id));
    await updateLocal();
  }

  String getCurrency() {
    var amount = 0;
    for (var product in products!) {
      amount = amount + product.product!.price! * product.amount!;
    }
    return '₭ ${formatCurrency.format(amount)}';
  }

  Future<String?> createOrder(
    BuildContext context, {
    required String lat,
    required String lon,
    required int delivery,
  }) async {
    var param = {};
    param['sales'] = jsonEncode(products!.map((e) => e.toJson()).toList());

    var resp = await APIService.of(context).post(
      '${APIService.kUrlOrder}/add',
      {
        'order': jsonEncode(param),
        'lat': lat,
        'lon': lon,
        'delivery': delivery,
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        socketService!.createOrder(resp['result']['id']);
        products!.clear();
        await fetchData();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  List<SaleModel> getCartProductsByRest(int id) {
    if (products == null || products!.isEmpty) return [];
    return products!.where((e) => e.product!.restaurant!.id == id).toList();
  }

  String getCartPriceByRest(int id) {
    var sales = getCartProductsByRest(id);
    var amount = 0;
    for (var sale in sales) {
      amount += sale.product!.price! * sale.amount!;
    }
    return '₭ ${formatCurrency.format(amount)}';
  }
}
