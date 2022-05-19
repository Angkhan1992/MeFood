// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String? get id => throw _privateConstructorUsedError;
  String? get rest_id => throw _privateConstructorUsedError;
  String? get cooking_time => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? rest_id,
      String? cooking_time,
      String? title,
      String? desc,
      String? regdate,
      String? other});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? rest_id = freezed,
    Object? cooking_time = freezed,
    Object? title = freezed,
    Object? desc = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rest_id: rest_id == freezed
          ? _value.rest_id
          : rest_id // ignore: cast_nullable_to_non_nullable
              as String?,
      cooking_time: cooking_time == freezed
          ? _value.cooking_time
          : cooking_time // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? rest_id,
      String? cooking_time,
      String? title,
      String? desc,
      String? regdate,
      String? other});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, (v) => _then(v as _$_ProductModel));

  @override
  _$_ProductModel get _value => super._value as _$_ProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? rest_id = freezed,
    Object? cooking_time = freezed,
    Object? title = freezed,
    Object? desc = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
  }) {
    return _then(_$_ProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rest_id: rest_id == freezed
          ? _value.rest_id
          : rest_id // ignore: cast_nullable_to_non_nullable
              as String?,
      cooking_time: cooking_time == freezed
          ? _value.cooking_time
          : cooking_time // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {this.id,
      this.rest_id,
      this.cooking_time,
      this.title,
      this.desc,
      this.regdate,
      this.other});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String? id;
  @override
  final String? rest_id;
  @override
  final String? cooking_time;
  @override
  final String? title;
  @override
  final String? desc;
  @override
  final String? regdate;
  @override
  final String? other;

  @override
  String toString() {
    return 'ProductModel(id: $id, rest_id: $rest_id, cooking_time: $cooking_time, title: $title, desc: $desc, regdate: $regdate, other: $other)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.rest_id, rest_id) &&
            const DeepCollectionEquality()
                .equals(other.cooking_time, cooking_time) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.regdate, regdate) &&
            const DeepCollectionEquality().equals(other.other, this.other));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(rest_id),
      const DeepCollectionEquality().hash(cooking_time),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(regdate),
      const DeepCollectionEquality().hash(other));

  @JsonKey(ignore: true)
  @override
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {final String? id,
      final String? rest_id,
      final String? cooking_time,
      final String? title,
      final String? desc,
      final String? regdate,
      final String? other}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get rest_id => throw _privateConstructorUsedError;
  @override
  String? get cooking_time => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get desc => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
