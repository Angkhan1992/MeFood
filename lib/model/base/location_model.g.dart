// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    _$_LocationModel(
      geocodedWaypoints: (json['geocodedWaypoints'] as List<dynamic>?)
          ?.map((e) => GeocodedWayPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'geocodedWaypoints': instance.geocodedWaypoints,
      'routes': instance.routes,
      'status': instance.status,
    };

_$_GeocodedWayPoint _$$_GeocodedWayPointFromJson(Map<String, dynamic> json) =>
    _$_GeocodedWayPoint(
      geocoderStatus: json['geocoderStatus'] as String?,
      placeId: json['placeId'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_GeocodedWayPointToJson(_$_GeocodedWayPoint instance) =>
    <String, dynamic>{
      'geocoderStatus': instance.geocoderStatus,
      'placeId': instance.placeId,
      'types': instance.types,
    };

_$_Route _$$_RouteFromJson(Map<String, dynamic> json) => _$_Route(
      bounds: json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
      copyrights: json['copyrights'] as String?,
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as String?,
      warnings: json['warnings'] as List<dynamic>?,
      waypointOrder: (json['waypointOrder'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_RouteToJson(_$_Route instance) => <String, dynamic>{
      'bounds': instance.bounds,
      'copyrights': instance.copyrights,
      'legs': instance.legs,
      'summary': instance.summary,
      'warnings': instance.warnings,
      'waypointOrder': instance.waypointOrder,
    };

_$_Bounds _$$_BoundsFromJson(Map<String, dynamic> json) => _$_Bounds(
      northeast: json['northeast'] == null
          ? null
          : Latlan.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : Latlan.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BoundsToJson(_$_Bounds instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

_$_Latlan _$$_LatlanFromJson(Map<String, dynamic> json) => _$_Latlan(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LatlanToJson(_$_Latlan instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_Leg _$$_LegFromJson(Map<String, dynamic> json) => _$_Leg(
      distance: json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Distance.fromJson(json['duration'] as Map<String, dynamic>),
      endAddress: json['endAddress'] as String?,
      endLocation: json['endLocation'] == null
          ? null
          : Latlan.fromJson(json['endLocation'] as Map<String, dynamic>),
      startAddress: json['startAddress'] as String?,
      startLocation: json['startLocation'] == null
          ? null
          : Latlan.fromJson(json['startLocation'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      trafficSpeedEntry: json['trafficSpeedEntry'] as List<dynamic>?,
      viaWaypoint: json['viaWaypoint'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_LegToJson(_$_Leg instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'endAddress': instance.endAddress,
      'endLocation': instance.endLocation,
      'startAddress': instance.startAddress,
      'startLocation': instance.startLocation,
      'steps': instance.steps,
      'trafficSpeedEntry': instance.trafficSpeedEntry,
      'viaWaypoint': instance.viaWaypoint,
    };

_$_Distance _$$_DistanceFromJson(Map<String, dynamic> json) => _$_Distance(
      text: json['text'] as String?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$$_DistanceToJson(_$_Distance instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

_$_Step _$$_StepFromJson(Map<String, dynamic> json) => _$_Step(
      distance: json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Distance.fromJson(json['duration'] as Map<String, dynamic>),
      endLocation: json['endLocation'] == null
          ? null
          : Latlan.fromJson(json['endLocation'] as Map<String, dynamic>),
      htmlInstructions: json['htmlInstructions'] as String?,
      startLocation: json['startLocation'] == null
          ? null
          : Latlan.fromJson(json['startLocation'] as Map<String, dynamic>),
      travelMode: $enumDecodeNullable(_$TravelModeEnumMap, json['travelMode']),
      maneuver: $enumDecodeNullable(_$ManeuverEnumMap, json['maneuver']),
    );

Map<String, dynamic> _$$_StepToJson(_$_Step instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'endLocation': instance.endLocation,
      'htmlInstructions': instance.htmlInstructions,
      'startLocation': instance.startLocation,
      'travelMode': _$TravelModeEnumMap[instance.travelMode],
      'maneuver': _$ManeuverEnumMap[instance.maneuver],
    };

const _$TravelModeEnumMap = {
  TravelMode.DRIVING: 'DRIVING',
};

const _$ManeuverEnumMap = {
  Maneuver.TURN_RIGHT: 'TURN_RIGHT',
  Maneuver.TURN_LEFT: 'TURN_LEFT',
};
