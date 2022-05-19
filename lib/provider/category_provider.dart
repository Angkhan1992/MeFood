import 'package:flutter/material.dart';
import 'package:mefood/model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categories = [];

  void instanceOf(CategoryProvider provider) {
    categories.clear();
    for (var model in provider.categories) {
      categories.add(model);
    }
    notifyListeners();
  }

  void instanceOfCategories(List<CategoryModel> models) {
    categories.clear();
    for (var model in models) {
      categories.add(model);
    }
    notifyListeners();
  }

  void addCategory(CategoryModel model) {
    categories.add(model);
    notifyListeners();
  }
}
