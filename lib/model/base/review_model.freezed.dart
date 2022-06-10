// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  set content(String? value) => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  set rating(int? value) => throw _privateConstructorUsedError;
  int? get typeId => throw _privateConstructorUsedError;
  set typeId(int? value) => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  set type(String? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) =>
      throw _privateConstructorUsedError; // extended field
  MemberModel? get user => throw _privateConstructorUsedError; // extended field
  set user(MemberModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? content,
      int? rating,
      int? typeId,
      String? type,
      String? regdate,
      String? other,
      MemberModel? user});

  $MemberModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res> implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  final ReviewModel _value;
  // ignore: unused_field
  final $Res Function(ReviewModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? rating = freezed,
    Object? typeId = freezed,
    Object? type = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      typeId: typeId == freezed
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
    ));
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
abstract class _$$_ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$_ReviewModelCopyWith(
          _$_ReviewModel value, $Res Function(_$_ReviewModel) then) =
      __$$_ReviewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? content,
      int? rating,
      int? typeId,
      String? type,
      String? regdate,
      String? other,
      MemberModel? user});

  @override
  $MemberModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ReviewModelCopyWithImpl<$Res> extends _$ReviewModelCopyWithImpl<$Res>
    implements _$$_ReviewModelCopyWith<$Res> {
  __$$_ReviewModelCopyWithImpl(
      _$_ReviewModel _value, $Res Function(_$_ReviewModel) _then)
      : super(_value, (v) => _then(v as _$_ReviewModel));

  @override
  _$_ReviewModel get _value => super._value as _$_ReviewModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? rating = freezed,
    Object? typeId = freezed,
    Object? type = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ReviewModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      typeId: typeId == freezed
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
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
class _$_ReviewModel implements _ReviewModel {
  _$_ReviewModel(
      {this.id,
      this.content,
      this.rating,
      this.typeId,
      this.type,
      this.regdate,
      this.other,
      this.user});

  factory _$_ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewModelFromJson(json);

  @override
  int? id;
  @override
  String? content;
  @override
  int? rating;
  @override
  int? typeId;
  @override
  String? type;
  @override
  String? regdate;
  @override
  String? other;
// extended field
  @override
  MemberModel? user;

  @override
  String toString() {
    return 'ReviewModel(id: $id, content: $content, rating: $rating, typeId: $typeId, type: $type, regdate: $regdate, other: $other, user: $user)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      __$$_ReviewModelCopyWithImpl<_$_ReviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewModelToJson(this);
  }
}

abstract class _ReviewModel implements ReviewModel {
  factory _ReviewModel(
      {int? id,
      String? content,
      int? rating,
      int? typeId,
      String? type,
      String? regdate,
      String? other,
      MemberModel? user}) = _$_ReviewModel;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$_ReviewModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  int? get rating => throw _privateConstructorUsedError;
  @override
  int? get typeId => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override // extended field
  MemberModel? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
