// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      id: json['id'] as int?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      postal: json['postal'] as String?,
      province: json['province'] as String?,
      country: json['country'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'postal': instance.postal,
      'province': instance.province,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'regdate': instance.regdate,
      'updated': instance.updated,
    };
