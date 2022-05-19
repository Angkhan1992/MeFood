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
  String? get id => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  List<ProductModel>? get models => throw _privateConstructorUsedError;

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
      {String? id, String? regdate, String? other, List<ProductModel>? models});
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
    Object? models = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      models: models == freezed
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
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
      {String? id, String? regdate, String? other, List<ProductModel>? models});
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
    Object? models = freezed,
  }) {
    return _then(_$_OrderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      models: models == freezed
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_OrderModel implements _OrderModel {
  _$_OrderModel(
      {this.id, this.regdate, this.other, final List<ProductModel>? models})
      : _models = models;

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final String? id;
  @override
  final String? regdate;
  @override
  final String? other;
  final List<ProductModel>? _models;
  @override
  List<ProductModel>? get models {
    final value = _models;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, regdate: $regdate, other: $other, models: $models)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.regdate, regdate) &&
            const DeepCollectionEquality().equals(other.other, this.other) &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(regdate),
      const DeepCollectionEquality().hash(other),
      const DeepCollectionEquality().hash(_models));

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
      {final String? id,
      final String? regdate,
      final String? other,
      final List<ProductModel>? models}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  List<ProductModel>? get models => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
