// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  set lat(String? value) => throw _privateConstructorUsedError;
  String? get lon => throw _privateConstructorUsedError;
  set lon(String? value) => throw _privateConstructorUsedError;
  int? get fee => throw _privateConstructorUsedError;
  set fee(int? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) =>
      throw _privateConstructorUsedError; // extend fields
  MemberModel? get owner => throw _privateConstructorUsedError; // extend fields
  set owner(MemberModel? value) => throw _privateConstructorUsedError;
  MemberModel? get delivery => throw _privateConstructorUsedError;
  set delivery(MemberModel? value) => throw _privateConstructorUsedError;
  List<SaleModel>? get sales => throw _privateConstructorUsedError;
  set sales(List<SaleModel>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? regdate,
      String? other,
      String? lat,
      String? lon,
      int? fee,
      String? status,
      MemberModel? owner,
      MemberModel? delivery,
      List<SaleModel>? sales});

  $MemberModelCopyWith<$Res>? get owner;
  $MemberModelCopyWith<$Res>? get delivery;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  final OrderModel _value;
  // ignore: unused_field
  final $Res Function(OrderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? fee = freezed,
    Object? status = freezed,
    Object? owner = freezed,
    Object? delivery = freezed,
    Object? sales = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      delivery: delivery == freezed
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      sales: sales == freezed
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<SaleModel>?,
    ));
  }

  @override
  $MemberModelCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $MemberModelCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }

  @override
  $MemberModelCopyWith<$Res>? get delivery {
    if (_value.delivery == null) {
      return null;
    }

    return $MemberModelCopyWith<$Res>(_value.delivery!, (value) {
      return _then(_value.copyWith(delivery: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? regdate,
      String? other,
      String? lat,
      String? lon,
      int? fee,
      String? status,
      MemberModel? owner,
      MemberModel? delivery,
      List<SaleModel>? sales});

  @override
  $MemberModelCopyWith<$Res>? get owner;
  @override
  $MemberModelCopyWith<$Res>? get delivery;
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res> extends _$OrderModelCopyWithImpl<$Res>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, (v) => _then(v as _$_OrderModel));

  @override
  _$_OrderModel get _value => super._value as _$_OrderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? fee = freezed,
    Object? status = freezed,
    Object? owner = freezed,
    Object? delivery = freezed,
    Object? sales = freezed,
  }) {
    return _then(_$_OrderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      delivery: delivery == freezed
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      sales: sales == freezed
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<SaleModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_OrderModel implements _OrderModel {
  _$_OrderModel(
      {this.id,
      this.regdate,
      this.other,
      this.lat,
      this.lon,
      this.fee,
      this.status,
      this.owner,
      this.delivery,
      this.sales});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  int? id;
  @override
  String? regdate;
  @override
  String? other;
  @override
  String? lat;
  @override
  String? lon;
  @override
  int? fee;
  @override
  String? status;
// extend fields
  @override
  MemberModel? owner;
  @override
  MemberModel? delivery;
  @override
  List<SaleModel>? sales;

  @override
  String toString() {
    return 'OrderModel(id: $id, regdate: $regdate, other: $other, lat: $lat, lon: $lon, fee: $fee, status: $status, owner: $owner, delivery: $delivery, sales: $sales)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {int? id,
      String? regdate,
      String? other,
      String? lat,
      String? lon,
      int? fee,
      String? status,
      MemberModel? owner,
      MemberModel? delivery,
      List<SaleModel>? sales}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  String? get lat => throw _privateConstructorUsedError;
  @override
  String? get lon => throw _privateConstructorUsedError;
  @override
  int? get fee => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override // extend fields
  MemberModel? get owner => throw _privateConstructorUsedError;
  @override
  MemberModel? get delivery => throw _privateConstructorUsedError;
  @override
  List<SaleModel>? get sales => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
