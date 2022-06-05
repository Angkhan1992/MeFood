// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String?,
      cooking_time: json['cooking_time'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
      restaurant: json['restaurant'] == null
          ? null
          : RestaurantModel.fromJson(
              json['restaurant'] as Map<String, dynamic>),
      galleries: json['galleries'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cooking_time': instance.cooking_time,
      'title': instance.title,
      'desc': instance.desc,
      'regdate': instance.regdate,
      'other': instance.other,
      'restaurant': instance.restaurant,
      'galleries': instance.galleries,
    };
