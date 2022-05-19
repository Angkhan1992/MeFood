import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProductModel({
    String? id,
    String? rest_id,
    String? cooking_time,
    String? title,
    String? desc,
    String? regdate,
    String? other,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
