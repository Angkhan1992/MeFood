// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as String?,
      regdate: json['regdate'] as String?,
      other: json['other'] as String?,
      owner: json['owner'] == null
          ? null
          : MemberModel.fromJson(json['owner'] as Map<String, dynamic>),
      delivery: json['delivery'] == null
          ? null
          : MemberModel.fromJson(json['delivery'] as Map<String, dynamic>),
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'regdate': instance.regdate,
      'other': instance.other,
      'owner': instance.owner,
      'delivery': instance.delivery,
      'models': instance.models,
    };
