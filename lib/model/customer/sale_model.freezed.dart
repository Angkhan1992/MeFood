// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaleModel _$SaleModelFromJson(Map<String, dynamic> json) {
  return _SaleModel.fromJson(json);
}

/// @nodoc
mixin _$SaleModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  set amount(int? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  set product(ProductModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleModelCopyWith<SaleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleModelCopyWith<$Res> {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) then) =
      _$SaleModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? amount,
      String? regdate,
      String? other,
      String? status,
      ProductModel? product});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$SaleModelCopyWithImpl<$Res> implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._value, this._then);

  final SaleModel _value;
  // ignore: unused_field
  final $Res Function(SaleModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? status = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }

  @override
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$$_SaleModelCopyWith<$Res> implements $SaleModelCopyWith<$Res> {
  factory _$$_SaleModelCopyWith(
          _$_SaleModel value, $Res Function(_$_SaleModel) then) =
      __$$_SaleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? amount,
      String? regdate,
      String? other,
      String? status,
      ProductModel? product});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_SaleModelCopyWithImpl<$Res> extends _$SaleModelCopyWithImpl<$Res>
    implements _$$_SaleModelCopyWith<$Res> {
  __$$_SaleModelCopyWithImpl(
      _$_SaleModel _value, $Res Function(_$_SaleModel) _then)
      : super(_value, (v) => _then(v as _$_SaleModel));

  @override
  _$_SaleModel get _value => super._value as _$_SaleModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? status = freezed,
    Object? product = freezed,
  }) {
    return _then(_$_SaleModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaleModel implements _SaleModel {
  _$_SaleModel(
      {this.id,
      this.amount,
      this.regdate,
      this.other,
      this.status,
      this.product});

  factory _$_SaleModel.fromJson(Map<String, dynamic> json) =>
      _$$_SaleModelFromJson(json);

  @override
  int? id;
  @override
  int? amount;
  @override
  String? regdate;
  @override
  String? other;
  @override
  String? status;
  @override
  ProductModel? product;

  @override
  String toString() {
    return 'SaleModel(id: $id, amount: $amount, regdate: $regdate, other: $other, status: $status, product: $product)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SaleModelCopyWith<_$_SaleModel> get copyWith =>
      __$$_SaleModelCopyWithImpl<_$_SaleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaleModelToJson(this);
  }
}

abstract class _SaleModel implements SaleModel {
  factory _SaleModel(
      {int? id,
      int? amount,
      String? regdate,
      String? other,
      String? status,
      ProductModel? product}) = _$_SaleModel;

  factory _SaleModel.fromJson(Map<String, dynamic> json) =
      _$_SaleModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get amount => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  ProductModel? get product => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SaleModelCopyWith<_$_SaleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
