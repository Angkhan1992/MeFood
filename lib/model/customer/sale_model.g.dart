// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaleModel _$$_SaleModelFromJson(Map<String, dynamic> json) => _$_SaleModel(
      id: json['id'] as int?,
      productAmount: json['productAmount'] as int?,
      other: json['other'] as String?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SaleModelToJson(_$_SaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productAmount': instance.productAmount,
      'other': instance.other,
      'product': instance.product,
    };
