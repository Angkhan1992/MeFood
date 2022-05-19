// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String?,
      rest_id: json['rest_id'] as String?,
      cooking_time: json['cooking_time'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rest_id': instance.rest_id,
      'cooking_time': instance.cooking_time,
      'title': instance.title,
      'desc': instance.desc,
      'regdate': instance.regdate,
      'other': instance.other,
    };
