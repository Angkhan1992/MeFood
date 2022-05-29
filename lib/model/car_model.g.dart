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
      license: json['license'] as String?,
      plate: json['plate'] as String?,
      front: json['front_image'] as String?,
      back: json['back_image'] as String?,
      left: json['left_image'] as String?,
      right: json['right_image'] as String?,
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
      'license': instance.license,
      'plate': instance.plate,
      'front_image': instance.front,
      'back_image': instance.back,
      'left_image': instance.left,
      'right_image': instance.right,
    };
