import 'package:flutter/material.dart';
import 'package:mefood/model/m_export.dart';

class DeliveryUserProvider extends ChangeNotifier {
  DriverModel user = DriverModel();

  void setUser(UserModel userModel) {
    user.user = userModel;
    notifyListeners();
  }

  void setAddress(AddressModel addressModel) {
    user.address = addressModel;
    notifyListeners();
  }

  void setCar(CarModel carModel) {
    user.car = carModel;
    notifyListeners();
  }

  void setUserId(int id) {
    user.id = id;
    notifyListeners();
  }
}
