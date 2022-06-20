import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProductModel({
    int? id,
    RestaurantModel? restaurant,
    @JsonKey(name: 'prepare_time') int? prepareTime,
    String? title,
    @JsonKey(name: 'description') String? desc,
    @JsonKey(name: 'unit_value') int? value,
    @JsonKey(name: 'product_unit') String? unit,
    int? price,
    String? regdate,
    String? other,
    int? enabled,
    // extend fields
    List<String>? galleries,
    CategoryModel? category,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
