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
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  RestaurantModel? get restaurant => throw _privateConstructorUsedError;
  set restaurant(RestaurantModel? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'prepare_time')
  int? get prepareTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'prepare_time')
  set prepareTime(int? value) => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  set desc(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_value')
  int? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_value')
  set value(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_unit')
  set unit(String? value) => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  set price(int? value) => throw _privateConstructorUsedError;
  String? get regdate => throw _privateConstructorUsedError;
  set regdate(String? value) => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  set other(String? value) => throw _privateConstructorUsedError;
  int? get enabled => throw _privateConstructorUsedError;
  set enabled(int? value) =>
      throw _privateConstructorUsedError; // extend fields
  List<String>? get galleries =>
      throw _privateConstructorUsedError; // extend fields
  set galleries(List<String>? value) => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  set category(CategoryModel? value) => throw _privateConstructorUsedError;

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
      {int? id,
      RestaurantModel? restaurant,
      @JsonKey(name: 'prepare_time') int? prepareTime,
      String? title,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'unit_value') int? value,
      @JsonKey(name: 'product_unit') String? unit,
      int? price,
      String? regdate,
      String? other,
      int? enabled,
      List<String>? galleries,
      CategoryModel? category});

  $RestaurantModelCopyWith<$Res>? get restaurant;
  $CategoryModelCopyWith<$Res>? get category;
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
    Object? restaurant = freezed,
    Object? prepareTime = freezed,
    Object? title = freezed,
    Object? desc = freezed,
    Object? value = freezed,
    Object? unit = freezed,
    Object? price = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? enabled = freezed,
    Object? galleries = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as RestaurantModel?,
      prepareTime: prepareTime == freezed
          ? _value.prepareTime
          : prepareTime // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as int?,
      galleries: galleries == freezed
          ? _value.galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }

  @override
  $RestaurantModelCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $RestaurantModelCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value));
    });
  }

  @override
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
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
      {int? id,
      RestaurantModel? restaurant,
      @JsonKey(name: 'prepare_time') int? prepareTime,
      String? title,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'unit_value') int? value,
      @JsonKey(name: 'product_unit') String? unit,
      int? price,
      String? regdate,
      String? other,
      int? enabled,
      List<String>? galleries,
      CategoryModel? category});

  @override
  $RestaurantModelCopyWith<$Res>? get restaurant;
  @override
  $CategoryModelCopyWith<$Res>? get category;
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
    Object? restaurant = freezed,
    Object? prepareTime = freezed,
    Object? title = freezed,
    Object? desc = freezed,
    Object? value = freezed,
    Object? unit = freezed,
    Object? price = freezed,
    Object? regdate = freezed,
    Object? other = freezed,
    Object? enabled = freezed,
    Object? galleries = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_ProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as RestaurantModel?,
      prepareTime: prepareTime == freezed
          ? _value.prepareTime
          : prepareTime // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      regdate: regdate == freezed
          ? _value.regdate
          : regdate // ignore: cast_nullable_to_non_nullable
              as String?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as int?,
      galleries: galleries == freezed
          ? _value.galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {this.id,
      this.restaurant,
      @JsonKey(name: 'prepare_time') this.prepareTime,
      this.title,
      @JsonKey(name: 'description') this.desc,
      @JsonKey(name: 'unit_value') this.value,
      @JsonKey(name: 'product_unit') this.unit,
      this.price,
      this.regdate,
      this.other,
      this.enabled,
      this.galleries,
      this.category});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  int? id;
  @override
  RestaurantModel? restaurant;
  @override
  @JsonKey(name: 'prepare_time')
  int? prepareTime;
  @override
  String? title;
  @override
  @JsonKey(name: 'description')
  String? desc;
  @override
  @JsonKey(name: 'unit_value')
  int? value;
  @override
  @JsonKey(name: 'product_unit')
  String? unit;
  @override
  int? price;
  @override
  String? regdate;
  @override
  String? other;
  @override
  int? enabled;
// extend fields
  @override
  List<String>? galleries;
  @override
  CategoryModel? category;

  @override
  String toString() {
    return 'ProductModel(id: $id, restaurant: $restaurant, prepareTime: $prepareTime, title: $title, desc: $desc, value: $value, unit: $unit, price: $price, regdate: $regdate, other: $other, enabled: $enabled, galleries: $galleries, category: $category)';
  }

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
      {int? id,
      RestaurantModel? restaurant,
      @JsonKey(name: 'prepare_time') int? prepareTime,
      String? title,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'unit_value') int? value,
      @JsonKey(name: 'product_unit') String? unit,
      int? price,
      String? regdate,
      String? other,
      int? enabled,
      List<String>? galleries,
      CategoryModel? category}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  RestaurantModel? get restaurant => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'prepare_time')
  int? get prepareTime => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'description')
  String? get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'unit_value')
  int? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'product_unit')
  String? get unit => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  String? get regdate => throw _privateConstructorUsedError;
  @override
  String? get other => throw _privateConstructorUsedError;
  @override
  int? get enabled => throw _privateConstructorUsedError;
  @override // extend fields
  List<String>? get galleries => throw _privateConstructorUsedError;
  @override
  CategoryModel? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
