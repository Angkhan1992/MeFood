import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@unfreezed
class CarModel with _$CarModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CarModel({
    int? id,
    String? name,
    String? number,
    String? color,
    int? since,
    String? type,
    int? distance,
    int? speed,
    int? weight,
    String? regdate,
    String? license,
    String? plate,
    @JsonKey(name: 'front_image') String? front,
    @JsonKey(name: 'back_image') String? back,
    @JsonKey(name: 'left_image') String? left,
    @JsonKey(name: 'right_image') String? right,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
