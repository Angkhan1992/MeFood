import 'package:flutter/widgets.dart';
import 'package:mefood/model/model.dart';

class DeliveryProvider extends ChangeNotifier {
  MemberModel? user;
  AddressModel? address;
  CarModel? car;

  double? latitude;
  double? longitude;

  bool isExpired() {
    return true;
  }
}
