import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory OrderModel({
    String? id,
    String? regdate,
    String? other,
    // extend fields
    MemberModel? owner,
    MemberModel? delivery,
    List<SaleModel>? models,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
