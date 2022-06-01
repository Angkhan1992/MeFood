// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MailModel _$MailModelFromJson(Map<String, dynamic> json) {
  return _MailModel.fromJson(json);
}

/// @nodoc
mixin _$MailModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  set subtitle(String? value) => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  set content(String? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MailModelCopyWith<MailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailModelCopyWith<$Res> {
  factory $MailModelCopyWith(MailModel value, $Res Function(MailModel) then) =
      _$MailModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? title,
      String? subtitle,
      String? content,
      String? regdate,
      String? status,
      String? other});
}

/// @nodoc
class _$MailModelCopyWithImpl<$Res> implements $MailModelCopyWith<$Res> {
  _$MailModelCopyWithImpl(this._value, this._then);

  final MailModel _value;
  // ignore: unused_field
  final $Res Function(MailModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? content = freezed,
    Object? regdate = freezed,
    Object? status = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
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
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MailModelCopyWith<$Res> implements $MailModelCopyWith<$Res> {
  factory _$$_MailModelCopyWith(
          _$_MailModel value, $Res Function(_$_MailModel) then) =
      __$$_MailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? title,
      String? subtitle,
      String? content,
      String? regdate,
      String? status,
      String? other});
}

/// @nodoc
class __$$_MailModelCopyWithImpl<$Res> extends _$MailModelCopyWithImpl<$Res>
    implements _$$_MailModelCopyWith<$Res> {
  __$$_MailModelCopyWithImpl(
      _$_MailModel _value, $Res Function(_$_MailModel) _then)
      : super(_value, (v) => _then(v as _$_MailModel));

  @override
  _$_MailModel get _value => super._value as _$_MailModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? content = freezed,
    Object? regdate = freezed,
    Object? status = freezed,
    Object? other = freezed,
  }) {
    return _then(_$_MailModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
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
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MailModel implements _MailModel {
  _$_MailModel(
      {this.id,
      this.title,
      this.subtitle,
      this.content,
      this.regdate,
      this.status,
      this.other});

  factory _$_MailModel.fromJson(Map<String, dynamic> json) =>
      _$$_MailModelFromJson(json);

  @override
  int? id;
  @override
  String? title;
  @override
  String? subtitle;
  @override
  String? content;
  @override
  String? regdate;
  @override
  String? status;
  @override
  String? other;

  @override
  String toString() {
    return 'MailModel(id: $id, title: $title, subtitle: $subtitle, content: $content, regdate: $regdate, status: $status, other: $other)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MailModelCopyWith<_$_MailModel> get copyWith =>
      __$$_MailModelCopyWithImpl<_$_MailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MailModelToJson(this);
  }
}

abstract class _MailModel implements MailModel {
  factory _MailModel(
      {int? id,
      String? title,
      String? subtitle,
      String? content,
      String? regdate,
      String? status,
      String? other}) = _$_MailModel;

  factory _MailModel.fromJson(Map<String, dynamic> json) =
      _$_MailModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get subtitle => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MailModelCopyWith<_$_MailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
