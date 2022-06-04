import 'package:flutter/widgets.dart';
import 'package:mefood/model/model.dart';

class RestaurantAuthProvider extends ChangeNotifier {
  RestaurantModel? restaurant;
  MemberModel? owner;
  List<MemberModel> members = [];

  RestaurantAuthProvider() {
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
}
