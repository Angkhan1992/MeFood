import 'package:flutter/widgets.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/pref_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<RestaurantModel>? restaurants;

  RestaurantProvider() {
    restaurants = [];
    initData();
  }

  Future<void> initData() async {
    restaurants = await PrefService.of().getCustomerRestaurant();
    notifyListeners();

    await fetchData();
  }

  Future<void> fetchData() async {
    var respCate = await ERestaurantModel.getNewRestaurants();
    if (respCate.isNotEmpty) {
      restaurants = respCate;
      await updateLocal();
    }
  }

  Future<void> updateLocal() async {
    await PrefService.of().setCustomerRestaurant(restaurants!);
    notifyListeners();
  }
}
