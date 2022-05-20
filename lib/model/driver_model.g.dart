// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriverModel _$$_DriverModelFromJson(Map<String, dynamic> json) =>
    _$_DriverModel(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      car: json['car'] == null
          ? null
          : CarModel.fromJson(json['car'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      member: json['member'] as String?,
      isEnabled: json['isEnabled'] as int?,
      isDeleted: json['isDeleted'] as int?,
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_DriverModelToJson(_$_DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'car': instance.car,
      'user': instance.user,
      'member': instance.member,
      'isEnabled': instance.isEnabled,
      'isDeleted': instance.isDeleted,
      'regdate': instance.regdate,
      'updated': instance.updated,
      'other': instance.other,
    };
