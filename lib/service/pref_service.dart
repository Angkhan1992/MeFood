import 'dart:convert';

import 'package:mefood/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  PrefService();

  factory PrefService.of() {
    return PrefService();
  }

  Future<bool> isLanding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_landing') ?? false;
  }

  Future<void> passLanding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_landing', true);
  }

  Future<List<MailModel>> getMailHistory() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonArray = jsonDecode(prefs.getString('history_mail') ?? '[]');
    return (jsonArray as List).map((e) => MailModel.fromJson(e)).toList();
  }

  Future<void> saveMailHistory(List<MailModel> models) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'history_mail',
      jsonEncode(models.map((e) => e.toJson()).toList()),
    );
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> token() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

// Restaurant Provider Service
  Future<MemberModel?> getMember() async {
    final prefs = await SharedPreferences.getInstance();
    var userPref = prefs.getString('user');
    if (userPref == null) {
      return null;
    }
    return MemberModel.fromJson(jsonDecode(userPref));
  }

  Future<void> setMember(MemberModel user) async {
    final prefs = await SharedPreferences.getInstance();
    var userPref = jsonEncode(user.toJson());
    await prefs.setString('user', userPref);
  }

  Future<RestaurantModel?> getRestaurant() async {
    final prefs = await SharedPreferences.getInstance();
    var restPref = prefs.getString('restaurant');
    if (restPref == null) {
      return null;
    }
    return RestaurantModel.fromJson(jsonDecode(restPref));
  }

  Future<void> setRestaurant(RestaurantModel restaurant) async {
    final prefs = await SharedPreferences.getInstance();
    var restPref = jsonEncode(restaurant.toJson());
    await prefs.setString('restaurant', restPref);
  }

  Future<List<ProductModel>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = prefs.getString('products');
    if (prodPref == null) {
      return [];
    }
    return (jsonDecode(prodPref) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> setProducts(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = jsonEncode(products.map((e) => e.toJson()).toList());
    await prefs.setString('products', prodPref);
  }

  Future<List<SaleModel>> getSales() async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = prefs.getString('mycart');
    if (prodPref == null) {
      return [];
    }
    return (jsonDecode(prodPref) as List)
        .map((e) => SaleModel.fromJson(e))
        .toList();
  }

  Future<void> setSales(List<SaleModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = jsonEncode(products.map((e) => e.toJson()).toList());
    await prefs.setString('mycart', prodPref);
  }

  Future<List<CategoryModel>> getCategories() async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = prefs.getString('categories');
    if (prodPref == null) {
      return [];
    }
    return (jsonDecode(prodPref) as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  Future<void> setCategories(List<CategoryModel> categories) async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = jsonEncode(categories.map((e) => e.toJson()).toList());
    await prefs.setString('categories', prodPref);
  }

  Future<List<ProductModel>> getNewProducts() async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = prefs.getString('new_product');
    if (prodPref == null) {
      return [];
    }
    return (jsonDecode(prodPref) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> setNewProducts(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = jsonEncode(products.map((e) => e.toJson()).toList());
    await prefs.setString('new_product', prodPref);
  }

  Future<List<ProductModel>> getHotProducts() async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = prefs.getString('hot_product');
    if (prodPref == null) {
      return [];
    }
    return (jsonDecode(prodPref) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> setHotProducts(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    var prodPref = jsonEncode(products.map((e) => e.toJson()).toList());
    await prefs.setString('hot_product', prodPref);
  }
}
