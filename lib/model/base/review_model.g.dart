// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModel _$$_ReviewModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewModel(
      id: json['id'] as int?,
      content: json['content'] as String?,
      rating: json['rating'] as int?,
      typeId: json['typeId'] as int?,
      type: json['type'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
      user: json['user'] == null
          ? null
          : MemberModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReviewModelToJson(_$_ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'rating': instance.rating,
      'typeId': instance.typeId,
      'type': instance.type,
      'regdate': instance.regdate,
      'other': instance.other,
      'user': instance.user,
    };
