// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get member => throw _privateConstructorUsedError;
  set member(String? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get updated => throw _privateConstructorUsedError;
  set updated(String? value) =>
      throw _privateConstructorUsedError; // extend fields
  AddressModel? get address =>
      throw _privateConstructorUsedError; // extend fields
  set address(AddressModel? value) => throw _privateConstructorUsedError;
  CarModel? get car => throw _privateConstructorUsedError;
  set car(CarModel? value) => throw _privateConstructorUsedError;
  MemberModel? get user => throw _privateConstructorUsedError;
  set user(MemberModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? member,
      String? regdate,
      String? updated,
      AddressModel? address,
      CarModel? car,
      MemberModel? user});

  $AddressModelCopyWith<$Res>? get address;
  $CarModelCopyWith<$Res>? get car;
  $MemberModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  final DeliveryModel _value;
  // ignore: unused_field
  final $Res Function(DeliveryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? member = freezed,
    Object? regdate = freezed,
    Object? updated = freezed,
    Object? address = freezed,
    Object? car = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      member: member == freezed
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      car: car == freezed
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as CarModel?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
    ));
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

  @override
  $CarModelCopyWith<$Res>? get car {
    if (_value.car == null) {
      return null;
    }

    return $CarModelCopyWith<$Res>(_value.car!, (value) {
      return _then(_value.copyWith(car: value));
    });
  }

  @override
  $MemberModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $MemberModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_DeliveryModelCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$_DeliveryModelCopyWith(
          _$_DeliveryModel value, $Res Function(_$_DeliveryModel) then) =
      __$$_DeliveryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? member,
      String? regdate,
      String? updated,
      AddressModel? address,
      CarModel? car,
      MemberModel? user});

  @override
  $AddressModelCopyWith<$Res>? get address;
  @override
  $CarModelCopyWith<$Res>? get car;
  @override
  $MemberModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_DeliveryModelCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res>
    implements _$$_DeliveryModelCopyWith<$Res> {
  __$$_DeliveryModelCopyWithImpl(
      _$_DeliveryModel _value, $Res Function(_$_DeliveryModel) _then)
      : super(_value, (v) => _then(v as _$_DeliveryModel));

  @override
  _$_DeliveryModel get _value => super._value as _$_DeliveryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? member = freezed,
    Object? regdate = freezed,
    Object? updated = freezed,
    Object? address = freezed,
    Object? car = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_DeliveryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      member: member == freezed
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      car: car == freezed
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as CarModel?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryModel implements _DeliveryModel {
  _$_DeliveryModel(
      {this.id,
      this.member,
      this.regdate,
      this.updated,
      this.address,
      this.car,
      this.user});

  factory _$_DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryModelFromJson(json);

  @override
  int? id;
  @override
  String? member;
  @override
  String? regdate;
  @override
  String? updated;
// extend fields
  @override
  AddressModel? address;
  @override
  CarModel? car;
  @override
  MemberModel? user;

  @override
  String toString() {
    return 'DeliveryModel(id: $id, member: $member, regdate: $regdate, updated: $updated, address: $address, car: $car, user: $user)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      __$$_DeliveryModelCopyWithImpl<_$_DeliveryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryModelToJson(this);
  }
}

abstract class _DeliveryModel implements DeliveryModel {
  factory _DeliveryModel(
      {int? id,
      String? member,
      String? regdate,
      String? updated,
      AddressModel? address,
      CarModel? car,
      MemberModel? user}) = _$_DeliveryModel;

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$_DeliveryModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get member => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get updated => throw _privateConstructorUsedError;
  @override // extend fields
  AddressModel? get address => throw _privateConstructorUsedError;
  @override
  CarModel? get car => throw _privateConstructorUsedError;
  @override
  MemberModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryModelCopyWith<_$_DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
