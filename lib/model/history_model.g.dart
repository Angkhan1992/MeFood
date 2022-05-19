// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryModel _$$_HistoryModelFromJson(Map<String, dynamic> json) =>
    _$_HistoryModel(
      id: json['id'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$_HistoryModelToJson(_$_HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'distance': instance.distance,
      'price': instance.price,
      'date': instance.date,
    };
