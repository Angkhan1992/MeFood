// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CenterModel _$$_CenterModelFromJson(Map<String, dynamic> json) =>
    _$_CenterModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      adr_id: json['adr_id'] as int?,
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
      'lat': instance.lat,
      'lon': instance.lon,
      'adr_id': instance.adr_id,
      'email': instance.email,
      'phone': instance.phone,
      'opentime': instance.opentime,
      'regdate': instance.regdate,
      'other': instance.other,
    };
