// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
      linkIcon: json['link_icon'] as String?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'regdate': instance.regdate,
      'updated': instance.updated,
      'link_icon': instance.linkIcon,
    };
