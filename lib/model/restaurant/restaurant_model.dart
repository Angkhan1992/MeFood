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
    String? logo,
    String? galleries,
    String? category,
    String? regdate,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
