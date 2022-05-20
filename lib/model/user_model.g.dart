// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['usr_id'] as int?,
      first: json['usr_first_name'] as String?,
      last: json['usr_last_name'] as String?,
      avatar: json['usr_avatar'] as String?,
      email: json['usr_email'] as String?,
      phone: json['usr_phone'] as String?,
      gender: json['usr_gender'] as String?,
      dob: json['usr_dob'] as String?,
      type: json['usr_type'] as String?,
      regdate: json['reg_date'] as String?,
      updated: json['update_date'] as String?,
      isEnabled: json['is_enable'] as int?,
      isDeleted: json['is_deleted'] as int?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'usr_id': instance.id,
      'usr_first_name': instance.first,
      'usr_last_name': instance.last,
      'usr_avatar': instance.avatar,
      'usr_email': instance.email,
      'usr_phone': instance.phone,
      'usr_gender': instance.gender,
      'usr_dob': instance.dob,
      'usr_type': instance.type,
      'reg_date': instance.regdate,
      'update_date': instance.updated,
      'is_enable': instance.isEnabled,
      'is_deleted': instance.isDeleted,
      'other': instance.other,
    };
