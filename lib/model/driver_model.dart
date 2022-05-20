import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/address_model.dart';
import 'package:mefood/model/car_model.dart';
import 'package:mefood/model/user_model.dart';

part 'driver_model.freezed.dart';
part 'driver_model.g.dart';

@unfreezed
class DriverModel with _$DriverModel {
  factory DriverModel({
    int? id,
    AddressModel? address,
    CarModel? car,
    UserModel? user,
    String? member,
    int? isEnabled,
    int? isDeleted,
    String? regdate,
    String? updated,
    String? other,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}
