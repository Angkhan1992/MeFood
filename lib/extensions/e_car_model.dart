import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:provider/provider.dart';

extension ECarModel on CarModel {
  String? get isFullData {
    if (name == null || name!.isEmpty) return 'Name Data Empty';
    if (number == null || number!.isEmpty) return 'License Number Empty';
    if (color == null || color!.isEmpty) return 'Car Color Empty';
    if (since == null) return 'Car Since Empty';
    if (type == null || type!.isEmpty) return 'Delivery Type Empty';
    if (distance == null) return 'Delivery Distance Empty';
    if (speed == null) return 'Delivery Speed Empty';
    if (weight == null) return 'Delivery Weight Empty';

    return null;
  }

  String get registerParam {
    var result = <String, String>{};
    for (var key in toJson().keys) {
      var value = toJson()[key];
      result[key] = value == null ? '' : value.toString();
    }
    return jsonEncode(result);
  }

  Future<String?> update(BuildContext? context) async {
    if (isFullData != null) {
      return isFullData!;
    }

    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlAuth}/updateCar',
      toJson(),
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return 'Server Error!';
    }
  }

  Future<String?> add(BuildContext? context) async {
    if (isFullData != null) {
      return isFullData!;
    }

    var provider = Provider.of<DriverProvider>(context!, listen: false);
    var resp = await APIService().post(
      APIService.kUrlAuth + '/registerCar',
      {
        'car': registerParam,
        'delivery': provider.user.id,
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        id = resp['result']['user_id'] as int;
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return 'Server Error!';
    }
  }
}
