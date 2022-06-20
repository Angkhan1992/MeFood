import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel>? orders;
  List<SaleModel>? products;

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

  Future<void> fetchData() async {}

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

  Future<String?> createOrder(BuildContext context) async {
    var order = OrderModel();
    var param = {};
    param['sales'] = jsonEncode(products!.map((e) => e.toJson()).toList());

    var resp = await APIService.of(context).post(
      '${APIService.kUrlOrder}/add',
      {
        'order': jsonEncode(param),
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        order.id = resp['result'];
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
