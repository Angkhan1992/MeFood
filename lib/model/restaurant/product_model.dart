import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/restaurant/restaurant_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProductModel({
    String? id,
    String? cooking_time,
    String? title,
    String? desc,
    String? regdate,
    String? other,
    // extend fields
    RestaurantModel? restaurant,
    String? galleries,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
