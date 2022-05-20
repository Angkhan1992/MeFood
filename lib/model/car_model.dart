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
    String? since,
    String? type,
    String? fuel,
    String? distance,
    String? speed,
    String? weight,
    String? regdate,
    String? other,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
