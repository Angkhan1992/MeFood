// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
mixin _$CountryModel {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) then) =
      _$CountryModelCopyWithImpl<$Res>;
  $Res call({String? name, String? code});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res> implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  final CountryModel _value;
  // ignore: unused_field
  final $Res Function(CountryModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CountryModelCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$$_CountryModelCopyWith(
          _$_CountryModel value, $Res Function(_$_CountryModel) then) =
      __$$_CountryModelCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? code});
}

/// @nodoc
class __$$_CountryModelCopyWithImpl<$Res>
    extends _$CountryModelCopyWithImpl<$Res>
    implements _$$_CountryModelCopyWith<$Res> {
  __$$_CountryModelCopyWithImpl(
      _$_CountryModel _value, $Res Function(_$_CountryModel) _then)
      : super(_value, (v) => _then(v as _$_CountryModel));

  @override
  _$_CountryModel get _value => super._value as _$_CountryModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_CountryModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryModel implements _CountryModel {
  _$_CountryModel({this.name, this.code});

  factory _$_CountryModel.fromJson(Map<String, dynamic> json) =>
      _$$_CountryModelFromJson(json);

  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'CountryModel(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$$_CountryModelCopyWith<_$_CountryModel> get copyWith =>
      __$$_CountryModelCopyWithImpl<_$_CountryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryModelToJson(this);
  }
}

abstract class _CountryModel implements CountryModel {
  factory _CountryModel({final String? name, final String? code}) =
      _$_CountryModel;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$_CountryModel.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CountryModelCopyWith<_$_CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
