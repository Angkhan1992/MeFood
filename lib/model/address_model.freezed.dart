// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  @JsonKey(name: 'adr_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_address1')
  String? get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_address1')
  set address1(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_address2')
  String? get address2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_address2')
  set address2(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_city')
  set city(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_postal')
  String? get postal => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_postal')
  set postal(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_province')
  String? get province => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_province')
  set province(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_country')
  set country(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_lat')
  String? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_lat')
  set lat(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_lon')
  String? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'adr_lon')
  set lon(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_date')
  String? get regdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_date')
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'adr_id') int? id,
      @JsonKey(name: 'adr_address1') String? address1,
      @JsonKey(name: 'adr_address2') String? address2,
      @JsonKey(name: 'adr_city') String? city,
      @JsonKey(name: 'adr_postal') String? postal,
      @JsonKey(name: 'adr_province') String? province,
      @JsonKey(name: 'adr_country') String? country,
      @JsonKey(name: 'adr_lat') String? lat,
      @JsonKey(name: 'adr_lon') String? lon,
      @JsonKey(name: 'reg_date') String? regdate,
      String? other});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? city = freezed,
    Object? postal = freezed,
    Object? province = freezed,
    Object? country = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      postal: postal == freezed
          ? _value.postal
          : postal // ignore: cast_nullable_to_non_nullable
              as String?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$_AddressModelCopyWith(
          _$_AddressModel value, $Res Function(_$_AddressModel) then) =
      __$$_AddressModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'adr_id') int? id,
      @JsonKey(name: 'adr_address1') String? address1,
      @JsonKey(name: 'adr_address2') String? address2,
      @JsonKey(name: 'adr_city') String? city,
      @JsonKey(name: 'adr_postal') String? postal,
      @JsonKey(name: 'adr_province') String? province,
      @JsonKey(name: 'adr_country') String? country,
      @JsonKey(name: 'adr_lat') String? lat,
      @JsonKey(name: 'adr_lon') String? lon,
      @JsonKey(name: 'reg_date') String? regdate,
      String? other});
}

/// @nodoc
class __$$_AddressModelCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res>
    implements _$$_AddressModelCopyWith<$Res> {
  __$$_AddressModelCopyWithImpl(
      _$_AddressModel _value, $Res Function(_$_AddressModel) _then)
      : super(_value, (v) => _then(v as _$_AddressModel));

  @override
  _$_AddressModel get _value => super._value as _$_AddressModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? city = freezed,
    Object? postal = freezed,
    Object? province = freezed,
    Object? country = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
  }) {
    return _then(_$_AddressModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      postal: postal == freezed
          ? _value.postal
          : postal // ignore: cast_nullable_to_non_nullable
              as String?,
      province: province == freezed
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModel implements _AddressModel {
  _$_AddressModel(
      {@JsonKey(name: 'adr_id') this.id,
      @JsonKey(name: 'adr_address1') this.address1,
      @JsonKey(name: 'adr_address2') this.address2,
      @JsonKey(name: 'adr_city') this.city,
      @JsonKey(name: 'adr_postal') this.postal,
      @JsonKey(name: 'adr_province') this.province,
      @JsonKey(name: 'adr_country') this.country,
      @JsonKey(name: 'adr_lat') this.lat,
      @JsonKey(name: 'adr_lon') this.lon,
      @JsonKey(name: 'reg_date') this.regdate,
      this.other});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  @JsonKey(name: 'adr_id')
  int? id;
  @override
  @JsonKey(name: 'adr_address1')
  String? address1;
  @override
  @JsonKey(name: 'adr_address2')
  String? address2;
  @override
  @JsonKey(name: 'adr_city')
  String? city;
  @override
  @JsonKey(name: 'adr_postal')
  String? postal;
  @override
  @JsonKey(name: 'adr_province')
  String? province;
  @override
  @JsonKey(name: 'adr_country')
  String? country;
  @override
  @JsonKey(name: 'adr_lat')
  String? lat;
  @override
  @JsonKey(name: 'adr_lon')
  String? lon;
  @override
  @JsonKey(name: 'reg_date')
  String? regdate;
  @override
  String? other;

  @override
  String toString() {
    return 'AddressModel(id: $id, address1: $address1, address2: $address2, city: $city, postal: $postal, province: $province, country: $country, lat: $lat, lon: $lon, regdate: $regdate, other: $other)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      __$$_AddressModelCopyWithImpl<_$_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  factory _AddressModel(
      {@JsonKey(name: 'adr_id') int? id,
      @JsonKey(name: 'adr_address1') String? address1,
      @JsonKey(name: 'adr_address2') String? address2,
      @JsonKey(name: 'adr_city') String? city,
      @JsonKey(name: 'adr_postal') String? postal,
      @JsonKey(name: 'adr_province') String? province,
      @JsonKey(name: 'adr_country') String? country,
      @JsonKey(name: 'adr_lat') String? lat,
      @JsonKey(name: 'adr_lon') String? lon,
      @JsonKey(name: 'reg_date') String? regdate,
      String? other}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  @JsonKey(name: 'adr_id')
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_address1')
  String? get address1 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_address2')
  String? get address2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_city')
  String? get city => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_postal')
  String? get postal => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_province')
  String? get province => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_country')
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_lat')
  String? get lat => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'adr_lon')
  String? get lon => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'reg_date')
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}
