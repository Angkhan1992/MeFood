// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CarModel _$$_CarModelFromJson(Map<String, dynamic> json) => _$_CarModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      number: json['number'] as String?,
      color: json['color'] as String?,
      since: json['since'] as String?,
      type: json['type'] as String?,
      fuel: json['fuel'] as String?,
      distance: json['distance'] as String?,
      speed: json['speed'] as String?,
      weight: json['weight'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$$_CarModelToJson(_$_CarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'color': instance.color,
      'since': instance.since,
      'type': instance.type,
      'fuel': instance.fuel,
      'distance': instance.distance,
      'speed': instance.speed,
      'weight': instance.weight,
      'regdate': instance.regdate,
      'other': instance.other,
    };
