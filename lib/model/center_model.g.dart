// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CenterModel _$$_CenterModelFromJson(Map<String, dynamic> json) =>
    _$_CenterModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      opentime: json['opentime'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_CenterModelToJson(_$_CenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'opentime': instance.opentime,
      'regdate': instance.regdate,
      'other': instance.other,
    };
