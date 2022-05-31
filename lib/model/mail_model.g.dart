// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MailModel _$$_MailModelFromJson(Map<String, dynamic> json) => _$_MailModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      content: json['content'] as String?,
      regdate: json['regdate'] as String?,
      status: json['status'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_MailModelToJson(_$_MailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
      'regdate': instance.regdate,
      'status': instance.status,
      'other': instance.other,
    };
