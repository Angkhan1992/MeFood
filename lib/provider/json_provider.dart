import 'dart:convert';

import 'package:mefood/model/category_model.dart';
import 'package:flutter/services.dart' as bundle;

class JsonProvider {
  static Future<List<CategoryModel>> readCategoryFromJson() async {
    //read json file
    final jsondata =
        await bundle.rootBundle.loadString('assets/jsons/category.json');
    //decode json data as list
    final data = json.decode(jsondata);
    final list = data['result'] as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
