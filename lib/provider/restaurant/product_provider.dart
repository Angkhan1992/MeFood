import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mefood/model/model.dart';

class ProductProvider with ChangeNotifier, DiagnosticableTreeMixin {
  ProductModel? product;

  ProductProvider() {
    product = ProductModel();
  }

  void setProduct(ProductModel model) {
    product = model;
    notifyListeners();
  }

  void setProductTitle(String title) {
    product!.title = title;
    notifyListeners();
  }

  void setProductDesc(String desc) {
    product!.desc = desc;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('product', jsonEncode(product!.toJson())));
  }
}
