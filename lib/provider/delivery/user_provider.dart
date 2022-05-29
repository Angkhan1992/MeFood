import 'package:flutter/material.dart';
import 'package:mefood/model/model.dart';

class DeliveryUserProvider extends ChangeNotifier {
  DriverModel user = DriverModel();

  void setUser(UserModel userModel) {
    user.user = userModel;
    notifyListeners();
  }

  void setDeliveryUser(DriverModel userModel) {
    user = userModel;
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

  void setVerifyInfor(Map<String, dynamic> infor) {
    user.user!.idcard = infor['idcard'];
    user.car!.plate = infor['plate'];
    user.car!.license = infor['license'];
    user.car!.front = infor['front'];
    user.car!.back = infor['back'];
    user.car!.left = infor['left'];
    user.car!.right = infor['right'];
    notifyListeners();
  }

  bool isEnabled() {
    return user.user!.isEnabled == null ? false : user.user!.isEnabled == 1;
  }
}
