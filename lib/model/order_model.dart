import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/product_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory OrderModel({
    String? id,
    String? regdate,
    String? other,
    List<ProductModel>? models,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
