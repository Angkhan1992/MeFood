import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@unfreezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    @JsonKey(name: 'geocoded_waypoints')
        List<GeocodedWayPoint>? geocodedWaypoints,
    List<MeRoute>? routes,
    String? status,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@unfreezed
class GeocodedWayPoint with _$GeocodedWayPoint {
  factory GeocodedWayPoint({
    @JsonKey(name: 'geocoder_status') String? geocoderStatus,
    @JsonKey(name: 'place_id') String? placeId,
    List<String>? types,
  }) = _GeocodedWayPoint;

  factory GeocodedWayPoint.fromJson(Map<String, dynamic> json) =>
      _$GeocodedWayPointFromJson(json);
}

@unfreezed
class MeRoute with _$MeRoute {
  factory MeRoute({
    MeBounds? bounds,
    String? copyrights,
    List<Leg>? legs,
    String? summary,
  }) = _MeRoute;

  factory MeRoute.fromJson(Map<String, dynamic> json) =>
      _$MeRouteFromJson(json);
}

@unfreezed
class MeBounds with _$MeBounds {
  factory MeBounds({
    MeLatlan? northeast,
    MeLatlan? southwest,
  }) = _MeBounds;

  factory MeBounds.fromJson(Map<String, dynamic> json) =>
      _$MeBoundsFromJson(json);
}

@unfreezed
class MeLatlan with _$MeLatlan {
  factory MeLatlan({
    required double lat,
    required double lng,
  }) = _MeLatlan;

  factory MeLatlan.fromJson(Map<String, dynamic> json) =>
      _$MeLatlanFromJson(json);
}

@unfreezed
class Leg with _$Leg {
  factory Leg({
    MeValue? distance,
    MeValue? duration,
    @JsonKey(name: 'end_address') String? endAddress,
    @JsonKey(name: 'end_location') MeLatlan? endLocation,
    @JsonKey(name: 'start_address') String? startAddress,
    @JsonKey(name: 'start_location') MeLatlan? startLocation,
    List<Step>? steps,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}

@unfreezed
class MeValue with _$MeValue {
  factory MeValue({
    String? text,
    int? value,
  }) = _MeValue;

  factory MeValue.fromJson(Map<String, dynamic> json) =>
      _$MeValueFromJson(json);
}

@unfreezed
class Step with _$Step {
  factory Step({
    MeValue? distance,
    MeValue? duration,
    @JsonKey(name: 'end_location') MeLatlan? endLocation,
    @JsonKey(name: 'html_instructions') String? htmlInstructions,
    @JsonKey(name: 'start_location') MeLatlan? startLocation,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}
