import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:provider/provider.dart';

extension ECarModel on CarModel {
  String? get isFullData {
    if (name == null || name!.isEmpty) {
      return '${S.current.empty} ${S.current.name}';
    }
    if (number == null || number!.isEmpty) {
      return '${S.current.empty} ${S.current.car_license}';
    }
    if (color == null || color!.isEmpty) {
      return '${S.current.empty} ${S.current.hint_car_color}';
    }
    if (since == null) return '${S.current.empty} ${S.current.hint_car_since}';
    if (type == null || type!.isEmpty) {
      return '${S.current.empty} ${S.current.delivery_type}';
    }
    if (distance == null) {
      return '${S.current.empty} ${S.current.hint_delivery_distance}';
    }
    if (speed == null) {
      return '${S.current.empty} ${S.current.hint_delivery_speed}';
    }
    if (weight == null) {
      return '${S.current.empty} ${S.current.hint_delivery_weight}';
    }

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
      return S.current.sever_error;
    }
  }
}
