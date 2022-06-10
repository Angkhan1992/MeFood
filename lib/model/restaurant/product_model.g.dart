// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int?,
      restaurant: json['restaurant'] == null
          ? null
          : RestaurantModel.fromJson(
              json['restaurant'] as Map<String, dynamic>),
      prepareTime: json['prepare_time'] as int?,
      title: json['title'] as String?,
      desc: json['description'] as String?,
      value: json['unit_value'] as int?,
      unit: json['product_unit'] as String?,
      price: json['price'] as int?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
      hidden: json['hidden'] as int?,
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurant': instance.restaurant,
      'prepare_time': instance.prepareTime,
      'title': instance.title,
      'description': instance.desc,
      'unit_value': instance.value,
      'product_unit': instance.unit,
      'price': instance.price,
      'regdate': instance.regdate,
      'other': instance.other,
      'hidden': instance.hidden,
      'galleries': instance.galleries,
      'category': instance.category,
    };
