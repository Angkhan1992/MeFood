import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

class AuthProvider with ChangeNotifier, DiagnosticableTreeMixin {
  RestaurantModel? restaurant;
  MemberModel? owner;
  List<MemberModel> members = [];

  AuthProvider() {
    restaurant = RestaurantModel();
    owner = MemberModel();
    members.clear();
  }

  void setRestaurant(RestaurantModel model) {
    restaurant = model;
    notifyListeners();
  }

  void setOwner(MemberModel model) {
    owner = model;
    notifyListeners();
  }

  void addUsers(MemberModel model) {
    members.add(model);
    notifyListeners();
  }

  Future<String?> register(
    BuildContext? context, {
    required String ownerPass,
    required String adminPass,
    required String userPass,
  }) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlRestaurantAuth}/register',
      {
        'restaurant': jsonEncode(restaurant!.toJson()),
        'address': jsonEncode(restaurant!.address!.toJson()),
        'owner': jsonEncode(owner!.toRegisterJson(ownerPass)),
        'admin': jsonEncode(members[0].toRegisterJson(adminPass)),
        'user': jsonEncode(members[1].toRegisterJson(userPass)),
      },
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(StringProperty('restaurant', jsonEncode(restaurant!.toJson())));
    properties.add(StringProperty('owner', jsonEncode(owner!.toJson())));
    properties.add(StringProperty(
        'members', jsonEncode(members.map((e) => e.toJson()).toList())));
  }
}
