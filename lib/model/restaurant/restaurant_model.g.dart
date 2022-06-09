// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantModel _$$_RestaurantModelFromJson(Map<String, dynamic> json) =>
    _$_RestaurantModel(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      category: json['category'] as String?,
      regdate: json['regdate'] as String?,
      logo: json['logo'] as String?,
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantModelToJson(_$_RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'category': instance.category,
      'regdate': instance.regdate,
      'logo': instance.logo,
      'galleries': instance.galleries,
    };
