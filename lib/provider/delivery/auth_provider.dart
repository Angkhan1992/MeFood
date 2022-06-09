import 'package:flutter/widgets.dart';
import 'package:mefood/model/model.dart';

class AuthProvider extends ChangeNotifier {
  MemberModel? user;
  AddressModel? address;
  CarModel? car;

  String? member;

  void setUser(MemberModel member) {
    user = member;
    notifyListeners();
  }

  void setAddress(AddressModel address) {
    this.address = address;
    notifyListeners();
  }

  void setCar(CarModel car) {
    this.car = car;
    notifyListeners();
  }
}
