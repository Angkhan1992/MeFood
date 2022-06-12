import 'package:flutter/widgets.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';

class HotProductProvider with ChangeNotifier {
  List<ProductModel>? products;

  CategoryProvider() {
    products = [];

    initData();
  }

  Future<void> initData() async {
    products = await PrefService.of().getHotProducts();
    notifyListeners();
    fetchData();
  }

  Future<void> fetchData() async {
    var respCate = await EProduct.getTopProducts();
    if (respCate.isNotEmpty) {
      products = respCate;
      updateLocal();
    }
  }

  Future<void> updateLocal() async {
    await PrefService.of().setHotProducts(products!);
    notifyListeners();
  }
}
