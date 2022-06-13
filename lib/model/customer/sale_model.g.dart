// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaleModel _$$_SaleModelFromJson(Map<String, dynamic> json) => _$_SaleModel(
      id: json['id'] as int?,
      amount: json['amount'] as int?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SaleModelToJson(_$_SaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'regdate': instance.regdate,
      'other': instance.other,
      'product': instance.product,
    };
