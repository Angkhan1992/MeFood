import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';

class RestaurantProvider extends ChangeNotifier {
  RestaurantModel? restaurant;
  MemberModel? user;

  void setRestaurant(RestaurantModel model) {
    restaurant = model;
    notifyListeners();
  }

  void setUser(MemberModel model) {
    user = model;
    notifyListeners();
  }

  Future<String?> login(
    BuildContext context, {
    required String email,
    required String pass,
    required String type,
  }) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantAuth}/login',
      {
        'email': email,
        'password': pass.generateMD5,
        'type': type,
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        logger.d(resp['result']);
        restaurant = RestaurantModel.fromJson(resp['result']['restaurant']);
        user = MemberModel.fromJson(resp['result']['user']);
        notifyListeners();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
