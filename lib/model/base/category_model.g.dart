// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'regdate': instance.regdate,
      'updated': instance.updated,
      'other': instance.other,
    };
