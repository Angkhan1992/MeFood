// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryModel _$$_DeliveryModelFromJson(Map<String, dynamic> json) =>
    _$_DeliveryModel(
      id: json['id'] as int?,
      member: json['member'] as String?,
      regdate: json['regdate'] as String?,
      updated: json['updated'] as String?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      car: json['car'] == null
          ? null
          : CarModel.fromJson(json['car'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : MemberModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeliveryModelToJson(_$_DeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member': instance.member,
      'regdate': instance.regdate,
      'updated': instance.updated,
      'address': instance.address,
      'car': instance.car,
      'user': instance.user,
    };
