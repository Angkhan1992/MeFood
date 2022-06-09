// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'support_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportModel _$SupportModelFromJson(Map<String, dynamic> json) {
  return _SupportModel.fromJson(json);
}

/// @nodoc
mixin _$SupportModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  set type(String? value) => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  set category(String? value) => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  set content(String? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportModelCopyWith<SupportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportModelCopyWith<$Res> {
  factory $SupportModelCopyWith(
          SupportModel value, $Res Function(SupportModel) then) =
      _$SupportModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? email,
      String? type,
      String? category,
      String? content,
      String? regdate,
      String? status});
}

/// @nodoc
class _$SupportModelCopyWithImpl<$Res> implements $SupportModelCopyWith<$Res> {
  _$SupportModelCopyWithImpl(this._value, this._then);

  final SupportModel _value;
  // ignore: unused_field
  final $Res Function(SupportModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? content = freezed,
    Object? regdate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SupportModelCopyWith<$Res>
    implements $SupportModelCopyWith<$Res> {
  factory _$$_SupportModelCopyWith(
          _$_SupportModel value, $Res Function(_$_SupportModel) then) =
      __$$_SupportModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? email,
      String? type,
      String? category,
      String? content,
      String? regdate,
      String? status});
}

/// @nodoc
class __$$_SupportModelCopyWithImpl<$Res>
    extends _$SupportModelCopyWithImpl<$Res>
    implements _$$_SupportModelCopyWith<$Res> {
  __$$_SupportModelCopyWithImpl(
      _$_SupportModel _value, $Res Function(_$_SupportModel) _then)
      : super(_value, (v) => _then(v as _$_SupportModel));

  @override
  _$_SupportModel get _value => super._value as _$_SupportModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? content = freezed,
    Object? regdate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_SupportModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportModel implements _SupportModel {
  _$_SupportModel(
      {this.id,
      this.email,
      this.type,
      this.category,
      this.content,
      this.regdate,
      this.status});

  factory _$_SupportModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupportModelFromJson(json);

  @override
  int? id;
  @override
  String? email;
  @override
  String? type;
  @override
  String? category;
  @override
  String? content;
  @override
  String? regdate;
  @override
  String? status;

  @override
  String toString() {
    return 'SupportModel(id: $id, email: $email, type: $type, category: $category, content: $content, regdate: $regdate, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SupportModelCopyWith<_$_SupportModel> get copyWith =>
      __$$_SupportModelCopyWithImpl<_$_SupportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportModelToJson(this);
  }
}

abstract class _SupportModel implements SupportModel {
  factory _SupportModel(
      {int? id,
      String? email,
      String? type,
      String? category,
      String? content,
      String? regdate,
      String? status}) = _$_SupportModel;

  factory _SupportModel.fromJson(Map<String, dynamic> json) =
      _$_SupportModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SupportModelCopyWith<_$_SupportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
