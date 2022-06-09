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
      since: json['since'] as int?,
      type: json['type'] as String?,
      distance: json['distance'] as int?,
      speed: json['speed'] as int?,
      weight: json['weight'] as int?,
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
      linkLicense: json['link_license'] as String?,
      linkPlate: json['link_plate'] as String?,
      linkGalleries: json['link_galleries'] as String?,
    );

Map<String, dynamic> _$$_CarModelToJson(_$_CarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'color': instance.color,
      'since': instance.since,
      'type': instance.type,
      'distance': instance.distance,
      'speed': instance.speed,
      'weight': instance.weight,
      'regdate': instance.regdate,
      'updated': instance.updated,
      'link_license': instance.linkLicense,
      'link_plate': instance.linkPlate,
      'link_galleries': instance.linkGalleries,
    };
