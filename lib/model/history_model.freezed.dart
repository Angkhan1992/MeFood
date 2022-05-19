// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryModel {
  String? get id => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res>;
  $Res call({String? id, double? distance, double? price, String? date});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res> implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  final HistoryModel _value;
  // ignore: unused_field
  final $Res Function(HistoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? distance = freezed,
    Object? price = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$_HistoryModelCopyWith(
          _$_HistoryModel value, $Res Function(_$_HistoryModel) then) =
      __$$_HistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, double? distance, double? price, String? date});
}

/// @nodoc
class __$$_HistoryModelCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res>
    implements _$$_HistoryModelCopyWith<$Res> {
  __$$_HistoryModelCopyWithImpl(
      _$_HistoryModel _value, $Res Function(_$_HistoryModel) _then)
      : super(_value, (v) => _then(v as _$_HistoryModel));

  @override
  _$_HistoryModel get _value => super._value as _$_HistoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? distance = freezed,
    Object? price = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_HistoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_HistoryModel implements _HistoryModel {
  _$_HistoryModel({this.id, this.distance, this.price, this.date});

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryModelFromJson(json);

  @override
  final String? id;
  @override
  final double? distance;
  @override
  final double? price;
  @override
  final String? date;

  @override
  String toString() {
    return 'HistoryModel(id: $id, distance: $distance, price: $price, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      __$$_HistoryModelCopyWithImpl<_$_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryModelToJson(this);
  }
}

abstract class _HistoryModel implements HistoryModel {
  factory _HistoryModel(
      {final String? id,
      final double? distance,
      final double? price,
      final String? date}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  double? get distance => throw _privateConstructorUsedError;
  @override
  double? get price => throw _privateConstructorUsedError;
  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
