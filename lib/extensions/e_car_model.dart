import 'package:mefood/model/car_model.dart';

extension ECarModel on CarModel {
  String? get isFullData {
    if (name == null || name!.isEmpty) return 'Name Data Empty';
    if (number == null || number!.isEmpty) return 'License Number Empty';
    if (color == null || color!.isEmpty) return 'Car Color Empty';
    if (since == null || since!.isEmpty) return 'Car Since Empty';
    if (type == null || type!.isEmpty) return 'Delivery Type Empty';
    if (distance == null || distance!.isEmpty) return 'Delivery Distance Empty';
    if (speed == null || speed!.isEmpty) return 'Delivery Speed Empty';
    if (weight == null || weight!.isEmpty) return 'Delivery Weight Empty';

    return null;
  }
}
