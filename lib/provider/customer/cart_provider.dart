import 'package:flutter/widgets.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

class CartProvider with ChangeNotifier {
  List<SaleModel>? products;

  CartProvider() {
    products = [];
  }

  Future<void> initData() async {
    products = await PrefService.of().getSales();
  }

  Future<void> addCart(SaleModel model) async {
    products!.add(model);
    await updateProvider();
  }

  Future<void> updateCart(SaleModel model) async {
    products![products!.indexWhere((element) => element.id == model.id)] =
        model;
    await updateProvider();
  }

  Future<void> removeCart(SaleModel model) async {
    products!
        .removeAt(products!.indexWhere((element) => element.id == model.id));
    await updateProvider();
  }

  String? getCost() {
    if (products == null || products!.isEmpty) {
      return null;
    }
    var cost = 0;
    for (var model in products!) {
      cost += model.product!.price! * model.productAmount!;
    }
    return '₭ ${formatCurrency.format(cost)}';
  }

  Future<void> updateProvider() async {
    await PrefService.of().setSales(products ?? []);
    notifyListeners();
  }
}
