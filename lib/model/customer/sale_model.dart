import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/restaurant/restaurant.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

@unfreezed
abstract class SaleModel with _$SaleModel {
  factory SaleModel({
    int? id,
    int? productAmount,
    String? other,
    ProductModel? product,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}