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
  List<GeocodedWayPoint>? get geocodedWaypoints =>
      throw _privateConstructorUsedError;
  set geocodedWaypoints(List<GeocodedWayPoint>? value) =>
      throw _privateConstructorUsedError;
  List<Route>? get routes => throw _privateConstructorUsedError;
  set routes(List<Route>? value) => throw _privateConstructorUsedError;
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
      {List<GeocodedWayPoint>? geocodedWaypoints,
      List<Route>? routes,
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
              as List<Route>?,
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
      {List<GeocodedWayPoint>? geocodedWaypoints,
      List<Route>? routes,
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
              as List<Route>?,
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
  _$_LocationModel({this.geocodedWaypoints, this.routes, this.status});

  factory _$_LocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocationModelFromJson(json);

  @override
  List<GeocodedWayPoint>? geocodedWaypoints;
  @override
  List<Route>? routes;
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
      {List<GeocodedWayPoint>? geocodedWaypoints,
      List<Route>? routes,
      String? status}) = _$_LocationModel;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$_LocationModel.fromJson;

  @override
  List<GeocodedWayPoint>? get geocodedWaypoints =>
      throw _privateConstructorUsedError;
  @override
  List<Route>? get routes => throw _privateConstructorUsedError;
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
  String? get geocoderStatus => throw _privateConstructorUsedError;
  set geocoderStatus(String? value) => throw _privateConstructorUsedError;
  String? get placeId => throw _privateConstructorUsedError;
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
  $Res call({String? geocoderStatus, String? placeId, List<String>? types});
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
  $Res call({String? geocoderStatus, String? placeId, List<String>? types});
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
  _$_GeocodedWayPoint({this.geocoderStatus, this.placeId, this.types});

  factory _$_GeocodedWayPoint.fromJson(Map<String, dynamic> json) =>
      _$$_GeocodedWayPointFromJson(json);

  @override
  String? geocoderStatus;
  @override
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
      {String? geocoderStatus,
      String? placeId,
      List<String>? types}) = _$_GeocodedWayPoint;

  factory _GeocodedWayPoint.fromJson(Map<String, dynamic> json) =
      _$_GeocodedWayPoint.fromJson;

  @override
  String? get geocoderStatus => throw _privateConstructorUsedError;
  @override
  String? get placeId => throw _privateConstructorUsedError;
  @override
  List<String>? get types => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GeocodedWayPointCopyWith<_$_GeocodedWayPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  Bounds? get bounds => throw _privateConstructorUsedError;
  set bounds(Bounds? value) => throw _privateConstructorUsedError;
  String? get copyrights => throw _privateConstructorUsedError;
  set copyrights(String? value) => throw _privateConstructorUsedError;
  List<Leg>? get legs => throw _privateConstructorUsedError;
  set legs(List<Leg>? value) => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  set summary(String? value) => throw _privateConstructorUsedError;
  List<dynamic>? get warnings => throw _privateConstructorUsedError;
  set warnings(List<dynamic>? value) => throw _privateConstructorUsedError;
  List<int>? get waypointOrder => throw _privateConstructorUsedError;
  set waypointOrder(List<int>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res>;
  $Res call(
      {Bounds? bounds,
      String? copyrights,
      List<Leg>? legs,
      String? summary,
      List<dynamic>? warnings,
      List<int>? waypointOrder});

  $BoundsCopyWith<$Res>? get bounds;
}

/// @nodoc
class _$RouteCopyWithImpl<$Res> implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  final Route _value;
  // ignore: unused_field
  final $Res Function(Route) _then;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? copyrights = freezed,
    Object? legs = freezed,
    Object? summary = freezed,
    Object? warnings = freezed,
    Object? waypointOrder = freezed,
  }) {
    return _then(_value.copyWith(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
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
      warnings: warnings == freezed
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      waypointOrder: waypointOrder == freezed
          ? _value.waypointOrder
          : waypointOrder // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }

  @override
  $BoundsCopyWith<$Res>? get bounds {
    if (_value.bounds == null) {
      return null;
    }

    return $BoundsCopyWith<$Res>(_value.bounds!, (value) {
      return _then(_value.copyWith(bounds: value));
    });
  }
}

/// @nodoc
abstract class _$$_RouteCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$_RouteCopyWith(_$_Route value, $Res Function(_$_Route) then) =
      __$$_RouteCopyWithImpl<$Res>;
  @override
  $Res call(
      {Bounds? bounds,
      String? copyrights,
      List<Leg>? legs,
      String? summary,
      List<dynamic>? warnings,
      List<int>? waypointOrder});

  @override
  $BoundsCopyWith<$Res>? get bounds;
}

/// @nodoc
class __$$_RouteCopyWithImpl<$Res> extends _$RouteCopyWithImpl<$Res>
    implements _$$_RouteCopyWith<$Res> {
  __$$_RouteCopyWithImpl(_$_Route _value, $Res Function(_$_Route) _then)
      : super(_value, (v) => _then(v as _$_Route));

  @override
  _$_Route get _value => super._value as _$_Route;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? copyrights = freezed,
    Object? legs = freezed,
    Object? summary = freezed,
    Object? warnings = freezed,
    Object? waypointOrder = freezed,
  }) {
    return _then(_$_Route(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
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
      warnings: warnings == freezed
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      waypointOrder: waypointOrder == freezed
          ? _value.waypointOrder
          : waypointOrder // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Route implements _Route {
  _$_Route(
      {this.bounds,
      this.copyrights,
      this.legs,
      this.summary,
      this.warnings,
      this.waypointOrder});

  factory _$_Route.fromJson(Map<String, dynamic> json) =>
      _$$_RouteFromJson(json);

  @override
  Bounds? bounds;
  @override
  String? copyrights;
  @override
  List<Leg>? legs;
  @override
  String? summary;
  @override
  List<dynamic>? warnings;
  @override
  List<int>? waypointOrder;

  @override
  String toString() {
    return 'Route(bounds: $bounds, copyrights: $copyrights, legs: $legs, summary: $summary, warnings: $warnings, waypointOrder: $waypointOrder)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_RouteCopyWith<_$_Route> get copyWith =>
      __$$_RouteCopyWithImpl<_$_Route>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteToJson(this);
  }
}

abstract class _Route implements Route {
  factory _Route(
      {Bounds? bounds,
      String? copyrights,
      List<Leg>? legs,
      String? summary,
      List<dynamic>? warnings,
      List<int>? waypointOrder}) = _$_Route;

  factory _Route.fromJson(Map<String, dynamic> json) = _$_Route.fromJson;

  @override
  Bounds? get bounds => throw _privateConstructorUsedError;
  @override
  String? get copyrights => throw _privateConstructorUsedError;
  @override
  List<Leg>? get legs => throw _privateConstructorUsedError;
  @override
  String? get summary => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get warnings => throw _privateConstructorUsedError;
  @override
  List<int>? get waypointOrder => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RouteCopyWith<_$_Route> get copyWith =>
      throw _privateConstructorUsedError;
}

Bounds _$BoundsFromJson(Map<String, dynamic> json) {
  return _Bounds.fromJson(json);
}

/// @nodoc
mixin _$Bounds {
  Latlan? get northeast => throw _privateConstructorUsedError;
  set northeast(Latlan? value) => throw _privateConstructorUsedError;
  Latlan? get southwest => throw _privateConstructorUsedError;
  set southwest(Latlan? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoundsCopyWith<Bounds> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundsCopyWith<$Res> {
  factory $BoundsCopyWith(Bounds value, $Res Function(Bounds) then) =
      _$BoundsCopyWithImpl<$Res>;
  $Res call({Latlan? northeast, Latlan? southwest});

  $LatlanCopyWith<$Res>? get northeast;
  $LatlanCopyWith<$Res>? get southwest;
}

/// @nodoc
class _$BoundsCopyWithImpl<$Res> implements $BoundsCopyWith<$Res> {
  _$BoundsCopyWithImpl(this._value, this._then);

  final Bounds _value;
  // ignore: unused_field
  final $Res Function(Bounds) _then;

  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_value.copyWith(
      northeast: northeast == freezed
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      southwest: southwest == freezed
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as Latlan?,
    ));
  }

  @override
  $LatlanCopyWith<$Res>? get northeast {
    if (_value.northeast == null) {
      return null;
    }

    return $LatlanCopyWith<$Res>(_value.northeast!, (value) {
      return _then(_value.copyWith(northeast: value));
    });
  }

  @override
  $LatlanCopyWith<$Res>? get southwest {
    if (_value.southwest == null) {
      return null;
    }

    return $LatlanCopyWith<$Res>(_value.southwest!, (value) {
      return _then(_value.copyWith(southwest: value));
    });
  }
}

/// @nodoc
abstract class _$$_BoundsCopyWith<$Res> implements $BoundsCopyWith<$Res> {
  factory _$$_BoundsCopyWith(_$_Bounds value, $Res Function(_$_Bounds) then) =
      __$$_BoundsCopyWithImpl<$Res>;
  @override
  $Res call({Latlan? northeast, Latlan? southwest});

  @override
  $LatlanCopyWith<$Res>? get northeast;
  @override
  $LatlanCopyWith<$Res>? get southwest;
}

/// @nodoc
class __$$_BoundsCopyWithImpl<$Res> extends _$BoundsCopyWithImpl<$Res>
    implements _$$_BoundsCopyWith<$Res> {
  __$$_BoundsCopyWithImpl(_$_Bounds _value, $Res Function(_$_Bounds) _then)
      : super(_value, (v) => _then(v as _$_Bounds));

  @override
  _$_Bounds get _value => super._value as _$_Bounds;

  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_$_Bounds(
      northeast: northeast == freezed
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      southwest: southwest == freezed
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as Latlan?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bounds implements _Bounds {
  _$_Bounds({this.northeast, this.southwest});

  factory _$_Bounds.fromJson(Map<String, dynamic> json) =>
      _$$_BoundsFromJson(json);

  @override
  Latlan? northeast;
  @override
  Latlan? southwest;

  @override
  String toString() {
    return 'Bounds(northeast: $northeast, southwest: $southwest)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_BoundsCopyWith<_$_Bounds> get copyWith =>
      __$$_BoundsCopyWithImpl<_$_Bounds>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoundsToJson(this);
  }
}

abstract class _Bounds implements Bounds {
  factory _Bounds({Latlan? northeast, Latlan? southwest}) = _$_Bounds;

  factory _Bounds.fromJson(Map<String, dynamic> json) = _$_Bounds.fromJson;

  @override
  Latlan? get northeast => throw _privateConstructorUsedError;
  @override
  Latlan? get southwest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BoundsCopyWith<_$_Bounds> get copyWith =>
      throw _privateConstructorUsedError;
}

Latlan _$LatlanFromJson(Map<String, dynamic> json) {
  return _Latlan.fromJson(json);
}

/// @nodoc
mixin _$Latlan {
  double get lat => throw _privateConstructorUsedError;
  set lat(double value) => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  set lng(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatlanCopyWith<Latlan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatlanCopyWith<$Res> {
  factory $LatlanCopyWith(Latlan value, $Res Function(Latlan) then) =
      _$LatlanCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LatlanCopyWithImpl<$Res> implements $LatlanCopyWith<$Res> {
  _$LatlanCopyWithImpl(this._value, this._then);

  final Latlan _value;
  // ignore: unused_field
  final $Res Function(Latlan) _then;

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
abstract class _$$_LatlanCopyWith<$Res> implements $LatlanCopyWith<$Res> {
  factory _$$_LatlanCopyWith(_$_Latlan value, $Res Function(_$_Latlan) then) =
      __$$_LatlanCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LatlanCopyWithImpl<$Res> extends _$LatlanCopyWithImpl<$Res>
    implements _$$_LatlanCopyWith<$Res> {
  __$$_LatlanCopyWithImpl(_$_Latlan _value, $Res Function(_$_Latlan) _then)
      : super(_value, (v) => _then(v as _$_Latlan));

  @override
  _$_Latlan get _value => super._value as _$_Latlan;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_Latlan(
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
class _$_Latlan implements _Latlan {
  _$_Latlan({required this.lat, required this.lng});

  factory _$_Latlan.fromJson(Map<String, dynamic> json) =>
      _$$_LatlanFromJson(json);

  @override
  double lat;
  @override
  double lng;

  @override
  String toString() {
    return 'Latlan(lat: $lat, lng: $lng)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_LatlanCopyWith<_$_Latlan> get copyWith =>
      __$$_LatlanCopyWithImpl<_$_Latlan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatlanToJson(this);
  }
}

abstract class _Latlan implements Latlan {
  factory _Latlan({required double lat, required double lng}) = _$_Latlan;

  factory _Latlan.fromJson(Map<String, dynamic> json) = _$_Latlan.fromJson;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LatlanCopyWith<_$_Latlan> get copyWith =>
      throw _privateConstructorUsedError;
}

Leg _$LegFromJson(Map<String, dynamic> json) {
  return _Leg.fromJson(json);
}

/// @nodoc
mixin _$Leg {
  Distance? get distance => throw _privateConstructorUsedError;
  set distance(Distance? value) => throw _privateConstructorUsedError;
  Distance? get duration => throw _privateConstructorUsedError;
  set duration(Distance? value) => throw _privateConstructorUsedError;
  String? get endAddress => throw _privateConstructorUsedError;
  set endAddress(String? value) => throw _privateConstructorUsedError;
  Latlan? get endLocation => throw _privateConstructorUsedError;
  set endLocation(Latlan? value) => throw _privateConstructorUsedError;
  String? get startAddress => throw _privateConstructorUsedError;
  set startAddress(String? value) => throw _privateConstructorUsedError;
  Latlan? get startLocation => throw _privateConstructorUsedError;
  set startLocation(Latlan? value) => throw _privateConstructorUsedError;
  List<Step>? get steps => throw _privateConstructorUsedError;
  set steps(List<Step>? value) => throw _privateConstructorUsedError;
  List<dynamic>? get trafficSpeedEntry => throw _privateConstructorUsedError;
  set trafficSpeedEntry(List<dynamic>? value) =>
      throw _privateConstructorUsedError;
  List<dynamic>? get viaWaypoint => throw _privateConstructorUsedError;
  set viaWaypoint(List<dynamic>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LegCopyWith<Leg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegCopyWith<$Res> {
  factory $LegCopyWith(Leg value, $Res Function(Leg) then) =
      _$LegCopyWithImpl<$Res>;
  $Res call(
      {Distance? distance,
      Distance? duration,
      String? endAddress,
      Latlan? endLocation,
      String? startAddress,
      Latlan? startLocation,
      List<Step>? steps,
      List<dynamic>? trafficSpeedEntry,
      List<dynamic>? viaWaypoint});

  $DistanceCopyWith<$Res>? get distance;
  $DistanceCopyWith<$Res>? get duration;
  $LatlanCopyWith<$Res>? get endLocation;
  $LatlanCopyWith<$Res>? get startLocation;
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
    Object? trafficSpeedEntry = freezed,
    Object? viaWaypoint = freezed,
  }) {
    return _then(_value.copyWith(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Distance?,
      endAddress: endAddress == freezed
          ? _value.endAddress
          : endAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      startAddress: startAddress == freezed
          ? _value.startAddress
          : startAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      trafficSpeedEntry: trafficSpeedEntry == freezed
          ? _value.trafficSpeedEntry
          : trafficSpeedEntry // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      viaWaypoint: viaWaypoint == freezed
          ? _value.viaWaypoint
          : viaWaypoint // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }

  @override
  $DistanceCopyWith<$Res>? get distance {
    if (_value.distance == null) {
      return null;
    }

    return $DistanceCopyWith<$Res>(_value.distance!, (value) {
      return _then(_value.copyWith(distance: value));
    });
  }

  @override
  $DistanceCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $DistanceCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value));
    });
  }

  @override
  $LatlanCopyWith<$Res>? get endLocation {
    if (_value.endLocation == null) {
      return null;
    }

    return $LatlanCopyWith<$Res>(_value.endLocation!, (value) {
      return _then(_value.copyWith(endLocation: value));
    });
  }

  @override
  $LatlanCopyWith<$Res>? get startLocation {
    if (_value.startLocation == null) {
      return null;
    }

    return $LatlanCopyWith<$Res>(_value.startLocation!, (value) {
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
      {Distance? distance,
      Distance? duration,
      String? endAddress,
      Latlan? endLocation,
      String? startAddress,
      Latlan? startLocation,
      List<Step>? steps,
      List<dynamic>? trafficSpeedEntry,
      List<dynamic>? viaWaypoint});

  @override
  $DistanceCopyWith<$Res>? get distance;
  @override
  $DistanceCopyWith<$Res>? get duration;
  @override
  $LatlanCopyWith<$Res>? get endLocation;
  @override
  $LatlanCopyWith<$Res>? get startLocation;
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
    Object? trafficSpeedEntry = freezed,
    Object? viaWaypoint = freezed,
  }) {
    return _then(_$_Leg(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Distance?,
      endAddress: endAddress == freezed
          ? _value.endAddress
          : endAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      startAddress: startAddress == freezed
          ? _value.startAddress
          : startAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      trafficSpeedEntry: trafficSpeedEntry == freezed
          ? _value.trafficSpeedEntry
          : trafficSpeedEntry // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      viaWaypoint: viaWaypoint == freezed
          ? _value.viaWaypoint
          : viaWaypoint // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Leg implements _Leg {
  _$_Leg(
      {this.distance,
      this.duration,
      this.endAddress,
      this.endLocation,
      this.startAddress,
      this.startLocation,
      this.steps,
      this.trafficSpeedEntry,
      this.viaWaypoint});

  factory _$_Leg.fromJson(Map<String, dynamic> json) => _$$_LegFromJson(json);

  @override
  Distance? distance;
  @override
  Distance? duration;
  @override
  String? endAddress;
  @override
  Latlan? endLocation;
  @override
  String? startAddress;
  @override
  Latlan? startLocation;
  @override
  List<Step>? steps;
  @override
  List<dynamic>? trafficSpeedEntry;
  @override
  List<dynamic>? viaWaypoint;

  @override
  String toString() {
    return 'Leg(distance: $distance, duration: $duration, endAddress: $endAddress, endLocation: $endLocation, startAddress: $startAddress, startLocation: $startLocation, steps: $steps, trafficSpeedEntry: $trafficSpeedEntry, viaWaypoint: $viaWaypoint)';
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
      {Distance? distance,
      Distance? duration,
      String? endAddress,
      Latlan? endLocation,
      String? startAddress,
      Latlan? startLocation,
      List<Step>? steps,
      List<dynamic>? trafficSpeedEntry,
      List<dynamic>? viaWaypoint}) = _$_Leg;

  factory _Leg.fromJson(Map<String, dynamic> json) = _$_Leg.fromJson;

  @override
  Distance? get distance => throw _privateConstructorUsedError;
  @override
  Distance? get duration => throw _privateConstructorUsedError;
  @override
  String? get endAddress => throw _privateConstructorUsedError;
  @override
  Latlan? get endLocation => throw _privateConstructorUsedError;
  @override
  String? get startAddress => throw _privateConstructorUsedError;
  @override
  Latlan? get startLocation => throw _privateConstructorUsedError;
  @override
  List<Step>? get steps => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get trafficSpeedEntry => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get viaWaypoint => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LegCopyWith<_$_Leg> get copyWith => throw _privateConstructorUsedError;
}

Distance _$DistanceFromJson(Map<String, dynamic> json) {
  return _Distance.fromJson(json);
}

/// @nodoc
mixin _$Distance {
  String? get text => throw _privateConstructorUsedError;
  set text(String? value) => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;
  set value(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceCopyWith<Distance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceCopyWith<$Res> {
  factory $DistanceCopyWith(Distance value, $Res Function(Distance) then) =
      _$DistanceCopyWithImpl<$Res>;
  $Res call({String? text, int? value});
}

/// @nodoc
class _$DistanceCopyWithImpl<$Res> implements $DistanceCopyWith<$Res> {
  _$DistanceCopyWithImpl(this._value, this._then);

  final Distance _value;
  // ignore: unused_field
  final $Res Function(Distance) _then;

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
abstract class _$$_DistanceCopyWith<$Res> implements $DistanceCopyWith<$Res> {
  factory _$$_DistanceCopyWith(
          _$_Distance value, $Res Function(_$_Distance) then) =
      __$$_DistanceCopyWithImpl<$Res>;
  @override
  $Res call({String? text, int? value});
}

/// @nodoc
class __$$_DistanceCopyWithImpl<$Res> extends _$DistanceCopyWithImpl<$Res>
    implements _$$_DistanceCopyWith<$Res> {
  __$$_DistanceCopyWithImpl(
      _$_Distance _value, $Res Function(_$_Distance) _then)
      : super(_value, (v) => _then(v as _$_Distance));

  @override
  _$_Distance get _value => super._value as _$_Distance;

  @override
  $Res call({
    Object? text = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_Distance(
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
class _$_Distance implements _Distance {
  _$_Distance({this.text, this.value});

  factory _$_Distance.fromJson(Map<String, dynamic> json) =>
      _$$_DistanceFromJson(json);

  @override
  String? text;
  @override
  int? value;

  @override
  String toString() {
    return 'Distance(text: $text, value: $value)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_DistanceCopyWith<_$_Distance> get copyWith =>
      __$$_DistanceCopyWithImpl<_$_Distance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistanceToJson(this);
  }
}

abstract class _Distance implements Distance {
  factory _Distance({String? text, int? value}) = _$_Distance;

  factory _Distance.fromJson(Map<String, dynamic> json) = _$_Distance.fromJson;

  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  int? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DistanceCopyWith<_$_Distance> get copyWith =>
      throw _privateConstructorUsedError;
}

Step _$StepFromJson(Map<String, dynamic> json) {
  return _Step.fromJson(json);
}

/// @nodoc
mixin _$Step {
  Distance? get distance => throw _privateConstructorUsedError;
  set distance(Distance? value) => throw _privateConstructorUsedError;
  Distance? get duration => throw _privateConstructorUsedError;
  set duration(Distance? value) => throw _privateConstructorUsedError;
  Latlan? get endLocation => throw _privateConstructorUsedError;
  set endLocation(Latlan? value) => throw _privateConstructorUsedError;
  String? get htmlInstructions => throw _privateConstructorUsedError;
  set htmlInstructions(String? value) => throw _privateConstructorUsedError;
  Latlan? get startLocation => throw _privateConstructorUsedError;
  set startLocation(Latlan? value) => throw _privateConstructorUsedError;
  TravelMode? get travelMode => throw _privateConstructorUsedError;
  set travelMode(TravelMode? value) => throw _privateConstructorUsedError;
  Maneuver? get maneuver => throw _privateConstructorUsedError;
  set maneuver(Maneuver? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res>;
  $Res call(
      {Distance? distance,
      Distance? duration,
      Latlan? endLocation,
      String? htmlInstructions,
      Latlan? startLocation,
      TravelMode? travelMode,
      Maneuver? maneuver});

  $DistanceCopyWith<$Res>? get distance;
  $DistanceCopyWith<$Res>? get duration;
  $LatlanCopyWith<$Res>? get endLocation;
  $LatlanCopyWith<$Res>? get startLocation;
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
    Object? travelMode = freezed,
    Object? maneuver = freezed,
  }) {
    return _then(_value.copyWith(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Distance?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      htmlInstructions: htmlInstructions == freezed
          ? _value.htmlInstructions
          : htmlInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      travelMode: travelMode == freezed
          ? _value.travelMode
          : travelMode // ignore: cast_nullable_to_non_nullable
              as TravelMode?,
      maneuver: maneuver == freezed
          ? _value.maneuver
          : maneuver // ignore: cast_nullable_to_non_nullable
              as Maneuver?,
    ));
  }

  @override
  $DistanceCopyWith<$Res>? get distance {
    if (_value.distance == null) {
      return null;
    }

    return $DistanceCopyWith<$Res>(_value.distance!, (value) {
      return _then(_value.copyWith(distance: value));
    });
  }

  @override
  $DistanceCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $DistanceCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value));
    });
  }

  @override
  $LatlanCopyWith<$Res>? get endLocation {
    if (_value.endLocation == null) {
      return null;
    }

    return $LatlanCopyWith<$Res>(_value.endLocation!, (value) {
      return _then(_value.copyWith(endLocation: value));
    });
  }

  @override
  $LatlanCopyWith<$Res>? get startLocation {
    if (_value.startLocation == null) {
      return null;
    }

    return $LatlanCopyWith<$Res>(_value.startLocation!, (value) {
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
      {Distance? distance,
      Distance? duration,
      Latlan? endLocation,
      String? htmlInstructions,
      Latlan? startLocation,
      TravelMode? travelMode,
      Maneuver? maneuver});

  @override
  $DistanceCopyWith<$Res>? get distance;
  @override
  $DistanceCopyWith<$Res>? get duration;
  @override
  $LatlanCopyWith<$Res>? get endLocation;
  @override
  $LatlanCopyWith<$Res>? get startLocation;
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
    Object? travelMode = freezed,
    Object? maneuver = freezed,
  }) {
    return _then(_$_Step(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Distance?,
      endLocation: endLocation == freezed
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      htmlInstructions: htmlInstructions == freezed
          ? _value.htmlInstructions
          : htmlInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: startLocation == freezed
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as Latlan?,
      travelMode: travelMode == freezed
          ? _value.travelMode
          : travelMode // ignore: cast_nullable_to_non_nullable
              as TravelMode?,
      maneuver: maneuver == freezed
          ? _value.maneuver
          : maneuver // ignore: cast_nullable_to_non_nullable
              as Maneuver?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Step implements _Step {
  _$_Step(
      {this.distance,
      this.duration,
      this.endLocation,
      this.htmlInstructions,
      this.startLocation,
      this.travelMode,
      this.maneuver});

  factory _$_Step.fromJson(Map<String, dynamic> json) => _$$_StepFromJson(json);

  @override
  Distance? distance;
  @override
  Distance? duration;
  @override
  Latlan? endLocation;
  @override
  String? htmlInstructions;
  @override
  Latlan? startLocation;
  @override
  TravelMode? travelMode;
  @override
  Maneuver? maneuver;

  @override
  String toString() {
    return 'Step(distance: $distance, duration: $duration, endLocation: $endLocation, htmlInstructions: $htmlInstructions, startLocation: $startLocation, travelMode: $travelMode, maneuver: $maneuver)';
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
      {Distance? distance,
      Distance? duration,
      Latlan? endLocation,
      String? htmlInstructions,
      Latlan? startLocation,
      TravelMode? travelMode,
      Maneuver? maneuver}) = _$_Step;

  factory _Step.fromJson(Map<String, dynamic> json) = _$_Step.fromJson;

  @override
  Distance? get distance => throw _privateConstructorUsedError;
  @override
  Distance? get duration => throw _privateConstructorUsedError;
  @override
  Latlan? get endLocation => throw _privateConstructorUsedError;
  @override
  String? get htmlInstructions => throw _privateConstructorUsedError;
  @override
  Latlan? get startLocation => throw _privateConstructorUsedError;
  @override
  TravelMode? get travelMode => throw _privateConstructorUsedError;
  @override
  Maneuver? get maneuver => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StepCopyWith<_$_Step> get copyWith => throw _privateConstructorUsedError;
}
