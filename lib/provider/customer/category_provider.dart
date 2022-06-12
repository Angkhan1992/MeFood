import 'package:flutter/widgets.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel>? categories;

  CategoryProvider() {
    categories = [];

    initData();
  }

  Future<void> initData() async {
    categories = await PrefService.of().getCategories();
    notifyListeners();
    fetchData();
  }

  Future<void> fetchData() async {
    var respCate = await ECategory.getCategories();
    if (respCate.isNotEmpty) {
      categories = respCate;
      updateLocal();
    }
  }

  Future<void> updateLocal() async {
    await PrefService.of().setCategories(categories!);
    notifyListeners();
  }
}
