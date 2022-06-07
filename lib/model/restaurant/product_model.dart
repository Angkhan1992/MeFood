import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/restaurant/restaurant.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProductModel({
    String? id,
    RestaurantModel? restaurant,
    @JsonKey(name: 'prepare_time') String? prepareTime,
    String? title,
    String? desc,
    int? value,
    String? unit,
    int? price,
    String? regdate,
    String? other,
    int? hidden,
    // extend fields
    List<String>? galleries,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
