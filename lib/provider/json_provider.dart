import 'dart:convert';

import 'package:mefood/model/category_model.dart';
import 'package:flutter/services.dart' as bundle;
import 'package:mefood/model/country_model.dart';

class JsonProvider {
  static Future<List<CategoryModel>> readCategoryFromJson() async {
    final jsondata =
        await bundle.rootBundle.loadString('assets/jsons/category.json');
    final data = json.decode(jsondata);
    final list = data['result'] as List<dynamic>;
    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }

  static Future<List<CountryModel>> readCountryFromJson() async {
    final jsondata =
        await bundle.rootBundle.loadString('assets/jsons/countries.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => CountryModel.fromJson(e)).toList();
  }
}
