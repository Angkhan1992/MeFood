import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@unfreezed
class CarModel with _$CarModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CarModel({
    int? id,
    String? name,
    @JsonKey(name: 'car_number') String? number,
    @JsonKey(name: 'car_color') String? color,
    @JsonKey(name: 'car_since') int? since,
    String? type,
    int? distance,
    int? speed,
    int? weight,
    String? regdate,
    String? updated,
    // extend fields
    String? linkLicense,
    String? linkPlate,
    String? linkGalleries,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
