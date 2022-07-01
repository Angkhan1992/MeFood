// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  @JsonKey(name: 'geocoded_waypoints')
  List<GeocodedWayPoint>? get geocodedWaypoints =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'geocoded_waypoints')
  set geocodedWaypoints(List<GeocodedWayPoint>? value) =>
      throw _privateConstructorUsedError;
  List<MeRoute>? get routes => throw _privateConstructorUsedError;
  set routes(List<MeRoute>? value) => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  set status(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'geocoded_waypoints')
          List<GeocodedWayPoint>? geocodedWaypoints,
      List<MeRoute>? routes,
      String? status});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  final LocationModel _value;
  // ignore: unused_field
  final $Res Function(LocationModel) _then;

  @override
  $Res call({
    Object? geocodedWaypoints = freezed,
    Object? routes = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      geocodedWaypoints: geocodedWaypoints == freezed
          ? _value.geocodedWaypoints
          : geocodedWaypoints // ignore: cast_nullable_to_non_nullable
              as List<GeocodedWayPoint>?,
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<MeRoute>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$_LocationModelCopyWith(
          _$_LocationModel value, $Res Function(_$_LocationModel) then) =
      __$$_LocationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'geocoded_waypoints')
          List<GeocodedWayPoint>? geocodedWaypoints,
      List<MeRoute>? routes,
      String? status});
}

/// @nodoc
class __$$_LocationModelCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res>
    implements _$$_LocationModelCopyWith<$Res> {
  __$$_LocationModelCopyWithImpl(
      _$_LocationModel _value, $Res Function(_$_LocationModel) _then)
      : super(_value, (v) => _then(v as _$_LocationModel));

  @override
  _$_LocationModel get _value => super._value as _$_LocationModel;

  @override
  $Res call({
    Object? geocodedWaypoints = freezed,
    Object? routes = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_LocationModel(
      geocodedWaypoints: geocodedWaypoints == freezed
          ? _value.geocodedWaypoints
          : geocodedWaypoints // ignore: cast_nullable_to_non_nullable
              as List<GeocodedWayPoint>?,
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<MeRoute>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationModel implements _LocationModel {
  _$_LocationModel(
      {@JsonKey(name: 'geocoded_waypoints') this.geocodedWaypoints,
      this.routes,
      this.status});

  factory _$_LocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocationModelFromJson(json);

  @override
  @JsonKey(name: 'geocoded_waypoints')
  List<GeocodedWayPoint>? geocodedWaypoints;
  @override
  List<MeRoute>? routes;
  @override
  String? status;

  @override
  String toString() {
    return 'LocationModel(geocodedWaypoints: $geocodedWaypoints, routes: $routes, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_LocationModelCopyWith<_$_LocationModel> get copyWith =>
      __$$_LocationModelCopyWithImpl<_$_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationModelToJson(this);
  }
}

abstract class _LocationModel implements LocationModel {
  factory _LocationModel(
      {@JsonKey(name: 'geocoded_waypoints')
          List<GeocodedWayPoint>? geocodedWaypoints,
      List<MeRoute>? routes,
      String? status}) = _$_LocationModel;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$_LocationModel.fromJson;

  @override
  @JsonKey(name: 'geocoded_waypoints')
  List<GeocodedWayPoint>? get geocodedWaypoints =>
      throw _privateConstructorUsedError;
  @override
  List<MeRoute>? get routes => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LocationModelCopyWith<_$_LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

GeocodedWayPoint _$GeocodedWayPointFromJson(Map<String, dynamic> json) {
  return _GeocodedWayPoint.fromJson(json);
}

/// @nodoc
mixin _$GeocodedWayPoint {
  @JsonKey(name: 'geocoder_status')
  String? get geocoderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'geocoder_status')
  set geocoderStatus(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_id')
  String? get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_id')
  set placeId(String? value) => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;
  set types(List<String>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodedWayPointCopyWith<GeocodedWayPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodedWayPointCopyWith<$Res> {
  factory $GeocodedWayPointCopyWith(
          GeocodedWayPoint value, $Res Function(GeocodedWayPoint) then) =
      _$GeocodedWayPointCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'geocoder_status') String? geocoderStatus,
      @JsonKey(name: 'place_id') String? placeId,
      List<String>? types});
}

/// @nodoc
class _$GeocodedWayPointCopyWithImpl<$Res>
    implements $GeocodedWayPointCopyWith<$Res> {
  _$GeocodedWayPointCopyWithImpl(this._value, this._then);

  final GeocodedWayPoint _value;
  // ignore: unused_field
  final $Res Function(GeocodedWayPoint) _then;

  @override
  $Res call({
    Object? geocoderStatus = freezed,
    Object? placeId = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      geocoderStatus: geocoderStatus == freezed
          ? _value.geocoderStatus
          : geocoderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$$_GeocodedWayPointCopyWith<$Res>
    implements $GeocodedWayPointCopyWith<$Res> {
  factory _$$_GeocodedWayPointCopyWith(
          _$_GeocodedWayPoint value, $Res Function(_$_GeocodedWayPoint) then) =
      __$$_GeocodedWayPointCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'geocoder_status') String? geocoderStatus,
      @JsonKey(name: 'place_id') String? placeId,
      List<String>? types});
}

/// @nodoc
class __$$_GeocodedWayPointCopyWithImpl<$Res>
    extends _$GeocodedWayPointCopyWithImpl<$Res>
    implements _$$_GeocodedWayPointCopyWith<$Res> {
  __$$_GeocodedWayPointCopyWithImpl(
      _$_GeocodedWayPoint _value, $Res Function(_$_GeocodedWayPoint) _then)
      : super(_value, (v) => _then(v as _$_GeocodedWayPoint));

  @override
  _$_GeocodedWayPoint get _value => super._value as _$_GeocodedWayPoint;

  @override
  $Res call({
    Object? geocoderStatus = freezed,
    Object? placeId = freezed,
    Object? types = freezed,
  }) {
    return _then(_$_GeocodedWayPoint(
      geocoderStatus: geocoderStatus == freezed
          ? _value.geocoderStatus
          : geocoderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeocodedWayPoint implements _GeocodedWayPoint {
  _$_GeocodedWayPoint(
      {@JsonKey(name: 'geocoder_status') this.geocoderStatus,
      @JsonKey(name: 'place_id') this.placeId,
      this.types});

  factory _$_GeocodedWayPoint.fromJson(Map<String, dynamic> json) =>
      _$$_GeocodedWayPointFromJson(json);

  @override
  @JsonKey(name: 'geocoder_status')
  String? geocoderStatus;
  @override
  @JsonKey(name: 'place_id')
  String? placeId;
  @override
  List<String>? types;

  @override
  String toString() {
    return 'GeocodedWayPoint(geocoderStatus: $geocoderStatus, placeId: $placeId, types: $types)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_GeocodedWayPointCopyWith<_$_GeocodedWayPoint> get copyWith =>
      __$$_GeocodedWayPointCopyWithImpl<_$_GeocodedWayPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeocodedWayPointToJson(this);
  }
}

abstract class _GeocodedWayPoint implements GeocodedWayPoint {
  factory _GeocodedWayPoint(
      {@JsonKey(name: 'geocoder_status') String? geocoderStatus,
      @JsonKey(name: 'place_id') String? placeId,
      List<String>? types}) = _$_GeocodedWayPoint;

  factory _GeocodedWayPoint.fromJson(Map<String, dynamic> json) =
      _$_GeocodedWayPoint.fromJson;

  @override
  @JsonKey(name: 'geocoder_status')
  String? get geocoderStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'place_id')
  String? get placeId => throw _privateConstructorUsedError;
  @override
  List<String>? get types => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GeocodedWayPointCopyWith<_$_GeocodedWayPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

MeRoute _$MeRouteFromJson(Map<String, dynamic> json) {
  return _MeRoute.fromJson(json);
}

/// @nodoc
mixin _$MeRoute {
  MeBounds? get bounds => throw _privateConstructorUsedError;
  set bounds(MeBounds? value) => throw _privateConstructorUsedError;
  String? get copyrights => throw _privateConstructorUsedError;
  set copyrights(String? value) => throw _privateConstructorUsedError;
  List<Leg>? get legs => throw _privateConstructorUsedError;
  set legs(List<Leg>? value) => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  set summary(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeRouteCopyWith<MeRoute> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeRouteCopyWith<$Res> {
  factory $MeRouteCopyWith(MeRoute value, $Res Function(MeRoute) then) =
      _$MeRouteCopyWithImpl<$Res>;
  $Res call(
      {MeBounds? bounds, String? copyrights, List<Leg>? legs, String? summary});

  $MeBoundsCopyWith<$Res>? get bounds;
}

/// @nodoc
class _$MeRouteCopyWithImpl<$Res> implements $MeRouteCopyWith<$Res> {
  _$MeRouteCopyWithImpl(this._value, this._then);

  final MeRoute _value;
  // ignore: unused_field
  final $Res Function(MeRoute) _then;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? copyrights = freezed,
    Object? legs = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as MeBounds?,
      copyrights: copyrights == freezed
          ? _value.copyrights
          : copyrights // ignore: cast_nullable_to_non_nullable
              as String?,
      legs: legs == freezed
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Leg>?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $MeBoundsCopyWith<$Res>? get bounds {
    if (_value.bounds == null) {
      return null;
    }

    return $MeBoundsCopyWith<$Res>(_value.bounds!, (value) {
      return _then(_value.copyWith(bounds: value));
    });
  }
}

/// @nodoc
abstract class _$$_MeRouteCopyWith<$Res> implements $MeRouteCopyWith<$Res> {
  factory _$$_MeRouteCopyWith(
          _$_MeRoute value, $Res Function(_$_MeRoute) then) =
      __$$_MeRouteCopyWithImpl<$Res>;
  @override
  $Res call(
      {MeBounds? bounds, String? copyrights, List<Leg>? legs, String? summary});

  @override
  $MeBoundsCopyWith<$Res>? get bounds;
}

/// @nodoc
class __$$_MeRouteCopyWithImpl<$Res> extends _$MeRouteCopyWithImpl<$Res>
    implements _$$_MeRouteCopyWith<$Res> {
  __$$_MeRouteCopyWithImpl(_$_MeRoute _value, $Res Function(_$_MeRoute) _then)
      : super(_value, (v) => _then(v as _$_MeRoute));

  @override
  _$_MeRoute get _value => super._value as _$_MeRoute;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? copyrights = freezed,
    Object? legs = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$_MeRoute(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as MeBounds?,
      copyrights: copyrights == freezed
          ? _value.copyrights
          : copyrights // ignore: cast_nullable_to_non_nullable
              as String?,
      legs: legs == freezed
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Leg>?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeRoute implements _MeRoute {
  _$_MeRoute({this.bounds, this.copyrights, this.legs, this.summary});

  factory _$_MeRoute.fromJson(Map<String, dynamic> json) =>
      _$$_MeRouteFromJson(json);

  @override
  MeBounds? bounds;
  @override
  String? copyrights;
  @override
  List<Leg>? legs;
  @override
  String? summary;

  @override
  String toString() {
    return 'MeRoute(bounds: $bounds, copyrights: $copyrights, legs: $legs, summary: $summary)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MeRouteCopyWith<_$_MeRoute> get copyWith =>
      __$$_MeRouteCopyWithImpl<_$_MeRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeRouteToJson(this);
  }
}

abstract class _MeRoute implements MeRoute {
  factory _MeRoute(
      {MeBounds? bounds,
      String? copyrights,
      List<Leg>? legs,
      String? summary}) = _$_MeRoute;

  factory _MeRoute.fromJson(Map<String, dynamic> json) = _$_MeRoute.fromJson;

  @override
  MeBounds? get bounds => throw _privateConstructorUsedError;
  @override
  String? get copyrights => throw _privateConstructorUsedError;
  @override
  List<Leg>? get legs => throw _privateConstructorUsedError;
  @override
  String? get summary => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MeRouteCopyWith<_$_MeRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

MeBounds _$MeBoundsFromJson(Map<String, dynamic> json) {
  return _MeBounds.fromJson(json);
}

/// @nodoc
mixin _$MeBounds {
  MeLatlan? get northeast => throw _privateConstructorUsedError;
  set northeast(MeLatlan? value) => throw _privateConstructorUsedError;
  MeLatlan? get southwest => throw _privateConstructorUsedError;
  set southwest(MeLatlan? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeBoundsCopyWith<MeBounds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeBoundsCopyWith<$Res> {
  factory $MeBoundsCopyWith(MeBounds value, $Res Function(MeBounds) then) =
      _$MeBoundsCopyWithImpl<$Res>;
  $Res call({MeLatlan? northeast, MeLatlan? southwest});

  $MeLatlanCopyWith<$Res>? get northeast;
  $MeLatlanCopyWith<$Res>? get southwest;
}

/// @nodoc
class _$MeBoundsCopyWithImpl<$Res> implements $MeBoundsCopyWith<$Res> {
  _$MeBoundsCopyWithImpl(this._value, this._then);

  final MeBounds _value;
  // ignore: unused_field
  final $Res Function(MeBounds) _then;

  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_value.copyWith(
      northeast: northeast == freezed
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      southwest: southwest == freezed
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
    ));
  }

  @override
  $MeLatlanCopyWith<$Res>? get northeast {
    if (_value.northeast == null) {
      return null;
    }

    return $MeLatlanCopyWith<$Res>(_value.northeast!, (value) {
      return _then(_value.copyWith(northeast: value));
    });
  }

  @override
  $MeLatlanCopyWith<$Res>? get southwest {
    if (_value.southwest == null) {
      return null;
    }

    return $MeLatlanCopyWith<$Res>(_value.southwest!, (value) {
      return _then(_value.copyWith(southwest: value));
    });
  }
}

/// @nodoc
abstract class _$$_MeBoundsCopyWith<$Res> implements $MeBoundsCopyWith<$Res> {
  factory _$$_MeBoundsCopyWith(
          _$_MeBounds value, $Res Function(_$_MeBounds) then) =
      __$$_MeBoundsCopyWithImpl<$Res>;
  @override
  $Res call({MeLatlan? northeast, MeLatlan? southwest});

  @override
  $MeLatlanCopyWith<$Res>? get northeast;
  @override
  $MeLatlanCopyWith<$Res>? get southwest;
}

/// @nodoc
class __$$_MeBoundsCopyWithImpl<$Res> extends _$MeBoundsCopyWithImpl<$Res>
    implements _$$_MeBoundsCopyWith<$Res> {
  __$$_MeBoundsCopyWithImpl(
      _$_MeBounds _value, $Res Function(_$_MeBounds) _then)
      : super(_value, (v) => _then(v as _$_MeBounds));

  @override
  _$_MeBounds get _value => super._value as _$_MeBounds;

  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_$_MeBounds(
      northeast: northeast == freezed
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      southwest: southwest == freezed
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeBounds implements _MeBounds {
  _$_MeBounds({this.northeast, this.southwest});

  factory _$_MeBounds.fromJson(Map<String, dynamic> json) =>
      _$$_MeBoundsFromJson(json);

  @override
  MeLatlan? northeast;
  @override
  MeLatlan? southwest;

  @override
  String toString() {
    return 'MeBounds(northeast: $northeast, southwest: $southwest)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MeBoundsCopyWith<_$_MeBounds> get copyWith =>
      __$$_MeBoundsCopyWithImpl<_$_MeBounds>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeBoundsToJson(this);
  }
}

abstract class _MeBounds implements MeBounds {
  factory _MeBounds({MeLatlan? northeast, MeLatlan? southwest}) = _$_MeBounds;

  factory _MeBounds.fromJson(Map<String, dynamic> json) = _$_MeBounds.fromJson;

  @override
  MeLatlan? get northeast => throw _privateConstructorUsedError;
  @override
  MeLatlan? get southwest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MeBoundsCopyWith<_$_MeBounds> get copyWith =>
      throw _privateConstructorUsedError;
}

MeLatlan _$MeLatlanFromJson(Map<String, dynamic> json) {
  return _MeLatlan.fromJson(json);
}

/// @nodoc
mixin _$MeLatlan {
  double get lat => throw _privateConstructorUsedError;
  set lat(double value) => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  set lng(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeLatlanCopyWith<MeLatlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeLatlanCopyWith<$Res> {
  factory $MeLatlanCopyWith(MeLatlan value, $Res Function(MeLatlan) then) =
      _$MeLatlanCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$MeLatlanCopyWithImpl<$Res> implements $MeLatlanCopyWith<$Res> {
  _$MeLatlanCopyWithImpl(this._value, this._then);

  final MeLatlan _value;
  // ignore: unused_field
  final $Res Function(MeLatlan) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_MeLatlanCopyWith<$Res> implements $MeLatlanCopyWith<$Res> {
  factory _$$_MeLatlanCopyWith(
          _$_MeLatlan value, $Res Function(_$_MeLatlan) then) =
      __$$_MeLatlanCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_MeLatlanCopyWithImpl<$Res> extends _$MeLatlanCopyWithImpl<$Res>
    implements _$$_MeLatlanCopyWith<$Res> {
  __$$_MeLatlanCopyWithImpl(
      _$_MeLatlan _value, $Res Function(_$_MeLatlan) _then)
      : super(_value, (v) => _then(v as _$_MeLatlan));

  @override
  _$_MeLatlan get _value => super._value as _$_MeLatlan;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_MeLatlan(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeLatlan implements _MeLatlan {
  _$_MeLatlan({required this.lat, required this.lng});

  factory _$_MeLatlan.fromJson(Map<String, dynamic> json) =>
      _$$_MeLatlanFromJson(json);

  @override
  double lat;
  @override
  double lng;

  @override
  String toString() {
    return 'MeLatlan(lat: $lat, lng: $lng)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MeLatlanCopyWith<_$_MeLatlan> get copyWith =>
      __$$_MeLatlanCopyWithImpl<_$_MeLatlan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeLatlanToJson(this);
  }
}

abstract class _MeLatlan implements MeLatlan {
  factory _MeLatlan({required double lat, required double lng}) = _$_MeLatlan;

  factory _MeLatlan.fromJson(Map<String, dynamic> json) = _$_MeLatlan.fromJson;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MeLatlanCopyWith<_$_MeLatlan> get copyWith =>
      throw _privateConstructorUsedError;
}

Leg _$LegFromJson(Map<String, dynamic> json) {
  return _Leg.fromJson(json);
}

/// @nodoc
mixin _$Leg {
  MeDistance? get distance => throw _privateConstructorUsedError;
  set distance(MeDistance? value) => throw _privateConstructorUsedError;
  MeDistance? get duration => throw _privateConstructorUsedError;
  set duration(MeDistance? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_address')
  String? get endAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_address')
  set endAddress(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_location')
  MeLatlan? get endLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_location')
  set endLocation(MeLatlan? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_address')
  String? get startAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_address')
  set startAddress(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_location')
  MeLatlan? get startLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_location')
  set startLocation(MeLatlan? value) => throw _privateConstructorUsedError;
  List<Step>? get steps => throw _privateConstructorUsedError;
  set steps(List<Step>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LegCopyWith<Leg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegCopyWith<$Res> {
  factory $LegCopyWith(Leg value, $Res Function(Leg) then) =
      _$LegCopyWithImpl<$Res>;
  $Res call(
      {MeDistance? distance,
      MeDistance? duration,
      @JsonKey(name: 'end_address') String? endAddress,
      @JsonKey(name: 'end_location') MeLatlan? endLocation,
      @JsonKey(name: 'start_address') String? startAddress,
      @JsonKey(name: 'start_location') MeLatlan? startLocation,
      List<Step>? steps});

  $MeDistanceCopyWith<$Res>? get distance;
  $MeDistanceCopyWith<$Res>? get duration;
  $MeLatlanCopyWith<$Res>? get endLocation;
  $MeLatlanCopyWith<$Res>? get startLocation;
}

/// @nodoc
class _$LegCopyWithImpl<$Res> implements $LegCopyWith<$Res> {
  _$LegCopyWithImpl(this._value, this._then);

  final Leg _value;
  // ignore: unused_field
  final $Res Function(Leg) _then;

  @override
  $Res call({
    Object? distance = freezed,
    Object? duration = freezed,
    Object? endAddress = freezed,
    Object? endLocation = freezed,
    Object? startAddress = freezed,
    Object? startLocation = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      endAddress: endAddress == freezed
          ? _value.endAddress
          : endAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      startAddress: startAddress == freezed
          ? _value.startAddress
          : startAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
    ));
  }

  @override
  $MeDistanceCopyWith<$Res>? get distance {
    if (_value.distance == null) {
      return null;
    }

    return $MeDistanceCopyWith<$Res>(_value.distance!, (value) {
      return _then(_value.copyWith(distance: value));
    });
  }

  @override
  $MeDistanceCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $MeDistanceCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value));
    });
  }

  @override
  $MeLatlanCopyWith<$Res>? get endLocation {
    if (_value.endLocation == null) {
      return null;
    }

    return $MeLatlanCopyWith<$Res>(_value.endLocation!, (value) {
      return _then(_value.copyWith(endLocation: value));
    });
  }

  @override
  $MeLatlanCopyWith<$Res>? get startLocation {
    if (_value.startLocation == null) {
      return null;
    }

    return $MeLatlanCopyWith<$Res>(_value.startLocation!, (value) {
      return _then(_value.copyWith(startLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_LegCopyWith<$Res> implements $LegCopyWith<$Res> {
  factory _$$_LegCopyWith(_$_Leg value, $Res Function(_$_Leg) then) =
      __$$_LegCopyWithImpl<$Res>;
  @override
  $Res call(
      {MeDistance? distance,
      MeDistance? duration,
      @JsonKey(name: 'end_address') String? endAddress,
      @JsonKey(name: 'end_location') MeLatlan? endLocation,
      @JsonKey(name: 'start_address') String? startAddress,
      @JsonKey(name: 'start_location') MeLatlan? startLocation,
      List<Step>? steps});

  @override
  $MeDistanceCopyWith<$Res>? get distance;
  @override
  $MeDistanceCopyWith<$Res>? get duration;
  @override
  $MeLatlanCopyWith<$Res>? get endLocation;
  @override
  $MeLatlanCopyWith<$Res>? get startLocation;
}

/// @nodoc
class __$$_LegCopyWithImpl<$Res> extends _$LegCopyWithImpl<$Res>
    implements _$$_LegCopyWith<$Res> {
  __$$_LegCopyWithImpl(_$_Leg _value, $Res Function(_$_Leg) _then)
      : super(_value, (v) => _then(v as _$_Leg));

  @override
  _$_Leg get _value => super._value as _$_Leg;

  @override
  $Res call({
    Object? distance = freezed,
    Object? duration = freezed,
    Object? endAddress = freezed,
    Object? endLocation = freezed,
    Object? startAddress = freezed,
    Object? startLocation = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$_Leg(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      endAddress: endAddress == freezed
          ? _value.endAddress
          : endAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      startAddress: startAddress == freezed
          ? _value.startAddress
          : startAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Leg implements _Leg {
  _$_Leg(
      {this.distance,
      this.duration,
      @JsonKey(name: 'end_address') this.endAddress,
      @JsonKey(name: 'end_location') this.endLocation,
      @JsonKey(name: 'start_address') this.startAddress,
      @JsonKey(name: 'start_location') this.startLocation,
      this.steps});

  factory _$_Leg.fromJson(Map<String, dynamic> json) => _$$_LegFromJson(json);

  @override
  MeDistance? distance;
  @override
  MeDistance? duration;
  @override
  @JsonKey(name: 'end_address')
  String? endAddress;
  @override
  @JsonKey(name: 'end_location')
  MeLatlan? endLocation;
  @override
  @JsonKey(name: 'start_address')
  String? startAddress;
  @override
  @JsonKey(name: 'start_location')
  MeLatlan? startLocation;
  @override
  List<Step>? steps;

  @override
  String toString() {
    return 'Leg(distance: $distance, duration: $duration, endAddress: $endAddress, endLocation: $endLocation, startAddress: $startAddress, startLocation: $startLocation, steps: $steps)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_LegCopyWith<_$_Leg> get copyWith =>
      __$$_LegCopyWithImpl<_$_Leg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LegToJson(this);
  }
}

abstract class _Leg implements Leg {
  factory _Leg(
      {MeDistance? distance,
      MeDistance? duration,
      @JsonKey(name: 'end_address') String? endAddress,
      @JsonKey(name: 'end_location') MeLatlan? endLocation,
      @JsonKey(name: 'start_address') String? startAddress,
      @JsonKey(name: 'start_location') MeLatlan? startLocation,
      List<Step>? steps}) = _$_Leg;

  factory _Leg.fromJson(Map<String, dynamic> json) = _$_Leg.fromJson;

  @override
  MeDistance? get distance => throw _privateConstructorUsedError;
  @override
  MeDistance? get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'end_address')
  String? get endAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'end_location')
  MeLatlan? get endLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'start_address')
  String? get startAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'start_location')
  MeLatlan? get startLocation => throw _privateConstructorUsedError;
  @override
  List<Step>? get steps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LegCopyWith<_$_Leg> get copyWith => throw _privateConstructorUsedError;
}

MeDistance _$MeDistanceFromJson(Map<String, dynamic> json) {
  return _MeDistance.fromJson(json);
}

/// @nodoc
mixin _$MeDistance {
  String? get text => throw _privateConstructorUsedError;
  set text(String? value) => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;
  set value(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeDistanceCopyWith<MeDistance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeDistanceCopyWith<$Res> {
  factory $MeDistanceCopyWith(
          MeDistance value, $Res Function(MeDistance) then) =
      _$MeDistanceCopyWithImpl<$Res>;
  $Res call({String? text, int? value});
}

/// @nodoc
class _$MeDistanceCopyWithImpl<$Res> implements $MeDistanceCopyWith<$Res> {
  _$MeDistanceCopyWithImpl(this._value, this._then);

  final MeDistance _value;
  // ignore: unused_field
  final $Res Function(MeDistance) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_MeDistanceCopyWith<$Res>
    implements $MeDistanceCopyWith<$Res> {
  factory _$$_MeDistanceCopyWith(
          _$_MeDistance value, $Res Function(_$_MeDistance) then) =
      __$$_MeDistanceCopyWithImpl<$Res>;
  @override
  $Res call({String? text, int? value});
}

/// @nodoc
class __$$_MeDistanceCopyWithImpl<$Res> extends _$MeDistanceCopyWithImpl<$Res>
    implements _$$_MeDistanceCopyWith<$Res> {
  __$$_MeDistanceCopyWithImpl(
      _$_MeDistance _value, $Res Function(_$_MeDistance) _then)
      : super(_value, (v) => _then(v as _$_MeDistance));

  @override
  _$_MeDistance get _value => super._value as _$_MeDistance;

  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_MeDistance(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeDistance implements _MeDistance {
  _$_MeDistance({this.text, this.value});

  factory _$_MeDistance.fromJson(Map<String, dynamic> json) =>
      _$$_MeDistanceFromJson(json);

  @override
  String? text;
  @override
  int? value;

  @override
  String toString() {
    return 'MeDistance(text: $text, value: $value)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MeDistanceCopyWith<_$_MeDistance> get copyWith =>
      __$$_MeDistanceCopyWithImpl<_$_MeDistance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeDistanceToJson(this);
  }
}

abstract class _MeDistance implements MeDistance {
  factory _MeDistance({String? text, int? value}) = _$_MeDistance;

  factory _MeDistance.fromJson(Map<String, dynamic> json) =
      _$_MeDistance.fromJson;

  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  int? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MeDistanceCopyWith<_$_MeDistance> get copyWith =>
      throw _privateConstructorUsedError;
}

Step _$StepFromJson(Map<String, dynamic> json) {
  return _Step.fromJson(json);
}

/// @nodoc
mixin _$Step {
  MeDistance? get distance => throw _privateConstructorUsedError;
  set distance(MeDistance? value) => throw _privateConstructorUsedError;
  MeDistance? get duration => throw _privateConstructorUsedError;
  set duration(MeDistance? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_location')
  MeLatlan? get endLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_location')
  set endLocation(MeLatlan? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_instructions')
  String? get htmlInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_instructions')
  set htmlInstructions(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_location')
  MeLatlan? get startLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_location')
  set startLocation(MeLatlan? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res>;
  $Res call(
      {MeDistance? distance,
      MeDistance? duration,
      @JsonKey(name: 'end_location') MeLatlan? endLocation,
      @JsonKey(name: 'html_instructions') String? htmlInstructions,
      @JsonKey(name: 'start_location') MeLatlan? startLocation});

  $MeDistanceCopyWith<$Res>? get distance;
  $MeDistanceCopyWith<$Res>? get duration;
  $MeLatlanCopyWith<$Res>? get endLocation;
  $MeLatlanCopyWith<$Res>? get startLocation;
}

/// @nodoc
class _$StepCopyWithImpl<$Res> implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._value, this._then);

  final Step _value;
  // ignore: unused_field
  final $Res Function(Step) _then;

  @override
  $Res call({
    Object? distance = freezed,
    Object? duration = freezed,
    Object? endLocation = freezed,
    Object? htmlInstructions = freezed,
    Object? startLocation = freezed,
  }) {
    return _then(_value.copyWith(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      htmlInstructions: htmlInstructions == freezed
          ? _value.htmlInstructions
          : htmlInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
    ));
  }

  @override
  $MeDistanceCopyWith<$Res>? get distance {
    if (_value.distance == null) {
      return null;
    }

    return $MeDistanceCopyWith<$Res>(_value.distance!, (value) {
      return _then(_value.copyWith(distance: value));
    });
  }

  @override
  $MeDistanceCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $MeDistanceCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value));
    });
  }

  @override
  $MeLatlanCopyWith<$Res>? get endLocation {
    if (_value.endLocation == null) {
      return null;
    }

    return $MeLatlanCopyWith<$Res>(_value.endLocation!, (value) {
      return _then(_value.copyWith(endLocation: value));
    });
  }

  @override
  $MeLatlanCopyWith<$Res>? get startLocation {
    if (_value.startLocation == null) {
      return null;
    }

    return $MeLatlanCopyWith<$Res>(_value.startLocation!, (value) {
      return _then(_value.copyWith(startLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_StepCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$$_StepCopyWith(_$_Step value, $Res Function(_$_Step) then) =
      __$$_StepCopyWithImpl<$Res>;
  @override
  $Res call(
      {MeDistance? distance,
      MeDistance? duration,
      @JsonKey(name: 'end_location') MeLatlan? endLocation,
      @JsonKey(name: 'html_instructions') String? htmlInstructions,
      @JsonKey(name: 'start_location') MeLatlan? startLocation});

  @override
  $MeDistanceCopyWith<$Res>? get distance;
  @override
  $MeDistanceCopyWith<$Res>? get duration;
  @override
  $MeLatlanCopyWith<$Res>? get endLocation;
  @override
  $MeLatlanCopyWith<$Res>? get startLocation;
}

/// @nodoc
class __$$_StepCopyWithImpl<$Res> extends _$StepCopyWithImpl<$Res>
    implements _$$_StepCopyWith<$Res> {
  __$$_StepCopyWithImpl(_$_Step _value, $Res Function(_$_Step) _then)
      : super(_value, (v) => _then(v as _$_Step));

  @override
  _$_Step get _value => super._value as _$_Step;

  @override
  $Res call({
    Object? distance = freezed,
    Object? duration = freezed,
    Object? endLocation = freezed,
    Object? htmlInstructions = freezed,
    Object? startLocation = freezed,
  }) {
    return _then(_$_Step(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as MeDistance?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
      htmlInstructions: htmlInstructions == freezed
          ? _value.htmlInstructions
          : htmlInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as MeLatlan?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Step implements _Step {
  _$_Step(
      {this.distance,
      this.duration,
      @JsonKey(name: 'end_location') this.endLocation,
      @JsonKey(name: 'html_instructions') this.htmlInstructions,
      @JsonKey(name: 'start_location') this.startLocation});

  factory _$_Step.fromJson(Map<String, dynamic> json) => _$$_StepFromJson(json);

  @override
  MeDistance? distance;
  @override
  MeDistance? duration;
  @override
  @JsonKey(name: 'end_location')
  MeLatlan? endLocation;
  @override
  @JsonKey(name: 'html_instructions')
  String? htmlInstructions;
  @override
  @JsonKey(name: 'start_location')
  MeLatlan? startLocation;

  @override
  String toString() {
    return 'Step(distance: $distance, duration: $duration, endLocation: $endLocation, htmlInstructions: $htmlInstructions, startLocation: $startLocation)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_StepCopyWith<_$_Step> get copyWith =>
      __$$_StepCopyWithImpl<_$_Step>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepToJson(this);
  }
}

abstract class _Step implements Step {
  factory _Step(
      {MeDistance? distance,
      MeDistance? duration,
      @JsonKey(name: 'end_location') MeLatlan? endLocation,
      @JsonKey(name: 'html_instructions') String? htmlInstructions,
      @JsonKey(name: 'start_location') MeLatlan? startLocation}) = _$_Step;

  factory _Step.fromJson(Map<String, dynamic> json) = _$_Step.fromJson;

  @override
  MeDistance? get distance => throw _privateConstructorUsedError;
  @override
  MeDistance? get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'end_location')
  MeLatlan? get endLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'html_instructions')
  String? get htmlInstructions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'start_location')
  MeLatlan? get startLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StepCopyWith<_$_Step> get copyWith => throw _privateConstructorUsedError;
}
