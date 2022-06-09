// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'center_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CenterModel _$CenterModelFromJson(Map<String, dynamic> json) {
  return _CenterModel.fromJson(json);
}

/// @nodoc
mixin _$CenterModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_time')
  String? get opentime => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_time')
  set opentime(String? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) =>
      throw _privateConstructorUsedError; // extend fields
  MemberModel? get member =>
      throw _privateConstructorUsedError; // extend fields
  set member(MemberModel? value) => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;
  set address(AddressModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CenterModelCopyWith<CenterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CenterModelCopyWith<$Res> {
  factory $CenterModelCopyWith(
          CenterModel value, $Res Function(CenterModel) then) =
      _$CenterModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'open_time') String? opentime,
      String? regdate,
      String? other,
      MemberModel? member,
      AddressModel? address});

  $MemberModelCopyWith<$Res>? get member;
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$CenterModelCopyWithImpl<$Res> implements $CenterModelCopyWith<$Res> {
  _$CenterModelCopyWithImpl(this._value, this._then);

  final CenterModel _value;
  // ignore: unused_field
  final $Res Function(CenterModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? opentime = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? member = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      opentime: opentime == freezed
          ? _value.opentime
          : opentime // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      member: member == freezed
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ));
  }

  @override
  $MemberModelCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberModelCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value));
    });
  }

  @override
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$$_CenterModelCopyWith<$Res>
    implements $CenterModelCopyWith<$Res> {
  factory _$$_CenterModelCopyWith(
          _$_CenterModel value, $Res Function(_$_CenterModel) then) =
      __$$_CenterModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'open_time') String? opentime,
      String? regdate,
      String? other,
      MemberModel? member,
      AddressModel? address});

  @override
  $MemberModelCopyWith<$Res>? get member;
  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_CenterModelCopyWithImpl<$Res> extends _$CenterModelCopyWithImpl<$Res>
    implements _$$_CenterModelCopyWith<$Res> {
  __$$_CenterModelCopyWithImpl(
      _$_CenterModel _value, $Res Function(_$_CenterModel) _then)
      : super(_value, (v) => _then(v as _$_CenterModel));

  @override
  _$_CenterModel get _value => super._value as _$_CenterModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? opentime = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? member = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_CenterModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      opentime: opentime == freezed
          ? _value.opentime
          : opentime // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      member: member == freezed
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CenterModel implements _CenterModel {
  _$_CenterModel(
      {this.id,
      @JsonKey(name: 'open_time') this.opentime,
      this.regdate,
      this.other,
      this.member,
      this.address});

  factory _$_CenterModel.fromJson(Map<String, dynamic> json) =>
      _$$_CenterModelFromJson(json);

  @override
  int? id;
  @override
  @JsonKey(name: 'open_time')
  String? opentime;
  @override
  String? regdate;
  @override
  String? other;
// extend fields
  @override
  MemberModel? member;
  @override
  AddressModel? address;

  @override
  String toString() {
    return 'CenterModel(id: $id, opentime: $opentime, regdate: $regdate, other: $other, member: $member, address: $address)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_CenterModelCopyWith<_$_CenterModel> get copyWith =>
      __$$_CenterModelCopyWithImpl<_$_CenterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CenterModelToJson(this);
  }
}

abstract class _CenterModel implements CenterModel {
  factory _CenterModel(
      {int? id,
      @JsonKey(name: 'open_time') String? opentime,
      String? regdate,
      String? other,
      MemberModel? member,
      AddressModel? address}) = _$_CenterModel;

  factory _CenterModel.fromJson(Map<String, dynamic> json) =
      _$_CenterModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'open_time')
  String? get opentime => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override // extend fields
  MemberModel? get member => throw _privateConstructorUsedError;
  @override
  AddressModel? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CenterModelCopyWith<_$_CenterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
