// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CenterModel _$$_CenterModelFromJson(Map<String, dynamic> json) =>
    _$_CenterModel(
      id: json['id'] as int?,
      opentime: json['open_time'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
      member: json['member'] == null
          ? null
          : MemberModel.fromJson(json['member'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CenterModelToJson(_$_CenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'open_time': instance.opentime,
      'regdate': instance.regdate,
      'other': instance.other,
      'member': instance.member,
      'address': instance.address,
    };
