// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;
  set address(AddressModel? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get updated => throw _privateConstructorUsedError;
  set updated(String? value) => throw _privateConstructorUsedError;
  String? get member => throw _privateConstructorUsedError;
  set member(String? value) =>
      throw _privateConstructorUsedError; // extend fields
  MemberModel? get user => throw _privateConstructorUsedError; // extend fields
  set user(MemberModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      AddressModel? address,
      String? regdate,
      String? updated,
      String? member,
      MemberModel? user});

  $AddressModelCopyWith<$Res>? get address;
  $MemberModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  final CustomerModel _value;
  // ignore: unused_field
  final $Res Function(CustomerModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? regdate = freezed,
    Object? updated = freezed,
    Object? member = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      member: member == freezed
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$_CustomerModelCopyWith(
          _$_CustomerModel value, $Res Function(_$_CustomerModel) then) =
      __$$_CustomerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      AddressModel? address,
      String? regdate,
      String? updated,
      String? member,
      MemberModel? user});

  @override
  $AddressModelCopyWith<$Res>? get address;
  @override
  $MemberModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CustomerModelCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res>
    implements _$$_CustomerModelCopyWith<$Res> {
  __$$_CustomerModelCopyWithImpl(
      _$_CustomerModel _value, $Res Function(_$_CustomerModel) _then)
      : super(_value, (v) => _then(v as _$_CustomerModel));

  @override
  _$_CustomerModel get _value => super._value as _$_CustomerModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? regdate = freezed,
    Object? updated = freezed,
    Object? member = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_CustomerModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      member: member == freezed
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerModel implements _CustomerModel {
  _$_CustomerModel(
      {this.id,
      this.address,
      this.regdate,
      this.updated,
      this.member,
      this.user});

  factory _$_CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerModelFromJson(json);

  @override
  int? id;
  @override
  AddressModel? address;
  @override
  String? regdate;
  @override
  String? updated;
  @override
  String? member;
// extend fields
  @override
  MemberModel? user;

  @override
  String toString() {
    return 'CustomerModel(id: $id, address: $address, regdate: $regdate, updated: $updated, member: $member, user: $user)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      __$$_CustomerModelCopyWithImpl<_$_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerModelToJson(this);
  }
}

abstract class _CustomerModel implements CustomerModel {
  factory _CustomerModel(
      {int? id,
      AddressModel? address,
      String? regdate,
      String? updated,
      String? member,
      MemberModel? user}) = _$_CustomerModel;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  AddressModel? get address => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get updated => throw _privateConstructorUsedError;
  @override
  String? get member => throw _privateConstructorUsedError;
  @override // extend fields
  MemberModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
