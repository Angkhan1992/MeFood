// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportModel _$$_SupportModelFromJson(Map<String, dynamic> json) =>
    _$_SupportModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      category: json['category'] as String?,
      content: json['content'] as String?,
      regdate: json['regdate'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_SupportModelToJson(_$_SupportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'type': instance.type,
      'category': instance.category,
      'content': instance.content,
      'regdate': instance.regdate,
      'status': instance.status,
    };
