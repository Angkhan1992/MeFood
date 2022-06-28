import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@unfreezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    List<GeocodedWayPoint>? geocodedWaypoints,
    List<Route>? routes,
    String? status,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@unfreezed
class GeocodedWayPoint with _$GeocodedWayPoint {
  factory GeocodedWayPoint({
    String? geocoderStatus,
    String? placeId,
    List<String>? types,
  }) = _GeocodedWayPoint;

  factory GeocodedWayPoint.fromJson(Map<String, dynamic> json) =>
      _$GeocodedWayPointFromJson(json);
}

@unfreezed
class Route with _$Route {
  factory Route({
    Bounds? bounds,
    String? copyrights,
    List<Leg>? legs,
    String? summary,
    List<dynamic>? warnings,
    List<int>? waypointOrder,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

@unfreezed
class Bounds with _$Bounds {
  factory Bounds({
    Latlan? northeast,
    Latlan? southwest,
  }) = _Bounds;

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}

@unfreezed
class Latlan with _$Latlan {
  factory Latlan({
    required double lat,
    required double lng,
  }) = _Latlan;

  factory Latlan.fromJson(Map<String, dynamic> json) => _$LatlanFromJson(json);
}

@unfreezed
class Leg with _$Leg {
  factory Leg({
    Distance? distance,
    Distance? duration,
    String? endAddress,
    Latlan? endLocation,
    String? startAddress,
    Latlan? startLocation,
    List<Step>? steps,
    List<dynamic>? trafficSpeedEntry,
    List<dynamic>? viaWaypoint,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}

@unfreezed
class Distance with _$Distance {
  factory Distance({
    String? text,
    int? value,
  }) = _Distance;

  factory Distance.fromJson(Map<String, dynamic> json) =>
      _$DistanceFromJson(json);
}

@unfreezed
class Step with _$Step {
  factory Step({
    Distance? distance,
    Distance? duration,
    Latlan? endLocation,
    String? htmlInstructions,
    Latlan? startLocation,
    TravelMode? travelMode,
    Maneuver? maneuver,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

enum Maneuver { TURN_RIGHT, TURN_LEFT }

final maneuverValues = EnumValues(
    {"turn-left": Maneuver.TURN_LEFT, "turn-right": Maneuver.TURN_RIGHT});

enum TravelMode { DRIVING }

final travelModeValues = EnumValues({"DRIVING": TravelMode.DRIVING});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
