import 'package:flutter/widgets.dart';
import 'package:mefood/extension/product.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

class NewProductProvider with ChangeNotifier {
  List<ProductModel>? products;

  NewProductProvider() {
    products = [];
    initData();
  }

  Future<void> initData() async {
    products = await PrefService.of().getNewProducts();
    notifyListeners();
    await fetchData();
  }

  Future<void> fetchData() async {
    var respCate = await EProduct.getNewProducts();
    if (respCate.isNotEmpty) {
      products = respCate;
      await updateLocal();
    }
  }

  Future<void> updateLocal() async {
    await PrefService.of().setNewProducts(products!);
    notifyListeners();
  }
}
