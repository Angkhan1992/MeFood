import 'package:flutter/widgets.dart';
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

  Future<void> addCart(SaleModel model) async {
    products ??= [];
    products!.add(model);
    await updateLocal();
  }
}
