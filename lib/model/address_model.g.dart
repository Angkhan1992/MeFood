// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      id: json['adr_id'] as int?,
      address1: json['adr_address1'] as String?,
      address2: json['adr_address2'] as String?,
      city: json['adr_city'] as String?,
      postal: json['adr_postal'] as String?,
      province: json['adr_province'] as String?,
      country: json['adr_country'] as String?,
      lat: json['adr_lat'] as String?,
      lon: json['adr_lon'] as String?,
      regdate: json['reg_date'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'adr_id': instance.id,
      'adr_address1': instance.address1,
      'adr_address2': instance.address2,
      'adr_city': instance.city,
      'adr_postal': instance.postal,
      'adr_province': instance.province,
      'adr_country': instance.country,
      'adr_lat': instance.lat,
      'adr_lon': instance.lon,
      'reg_date': instance.regdate,
      'other': instance.other,
    };
