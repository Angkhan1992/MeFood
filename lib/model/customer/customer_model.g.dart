// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerModel _$$_CustomerModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerModel(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
      member: json['member'] as String?,
      user: json['user'] == null
          ? null
          : MemberModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CustomerModelToJson(_$_CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'regdate': instance.regdate,
      'updated': instance.updated,
      'member': instance.member,
      'user': instance.user,
    };
