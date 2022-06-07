import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mefood/model/model.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@unfreezed
class RestaurantModel with _$RestaurantModel {
  factory RestaurantModel({
    int? id,
    AddressModel? address,
    String? name,
    String? email,
    String? phone,
    String? category,
    String? regdate,
    //extend field
    String? logo,
    List<String>? galleries,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
