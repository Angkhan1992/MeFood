// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberModel _$$_MemberModelFromJson(Map<String, dynamic> json) =>
    _$_MemberModel(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      authEmail: json['auth_email'] as int?,
      authType: json['auth_type'] as String?,
      phone: json['phone'] as String?,
      authPhone: json['auth_phone'] as int?,
      memberType: json['member_type'] as String?,
      typeId: json['id_type'] as int?,
      regdate: json['regdate'] as String?,
      update: json['update'] as String?,
      enabled: json['enabled'] as int?,
      deleted: json['deleted'] as int?,
      linkAvatar: json['linkAvatar'] as String?,
      linkIdCard: json['linkIdCard'] as String?,
    );

Map<String, dynamic> _$$_MemberModelToJson(_$_MemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob,
      'auth_email': instance.authEmail,
      'auth_type': instance.authType,
      'phone': instance.phone,
      'auth_phone': instance.authPhone,
      'member_type': instance.memberType,
      'id_type': instance.typeId,
      'regdate': instance.regdate,
      'update': instance.update,
      'enabled': instance.enabled,
      'deleted': instance.deleted,
      'linkAvatar': instance.linkAvatar,
      'linkIdCard': instance.linkIdCard,
    };
