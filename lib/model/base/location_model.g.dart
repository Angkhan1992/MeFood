// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    _$_LocationModel(
      geocodedWaypoints: (json['geocoded_waypoints'] as List<dynamic>?)
          ?.map((e) => GeocodedWayPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => MeRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'geocoded_waypoints': instance.geocodedWaypoints,
      'routes': instance.routes,
      'status': instance.status,
    };

_$_GeocodedWayPoint _$$_GeocodedWayPointFromJson(Map<String, dynamic> json) =>
    _$_GeocodedWayPoint(
      geocoderStatus: json['geocoder_status'] as String?,
      placeId: json['place_id'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_GeocodedWayPointToJson(_$_GeocodedWayPoint instance) =>
    <String, dynamic>{
      'geocoder_status': instance.geocoderStatus,
      'place_id': instance.placeId,
      'types': instance.types,
    };

_$_MeRoute _$$_MeRouteFromJson(Map<String, dynamic> json) => _$_MeRoute(
      bounds: json['bounds'] == null
          ? null
          : MeBounds.fromJson(json['bounds'] as Map<String, dynamic>),
      copyrights: json['copyrights'] as String?,
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$_MeRouteToJson(_$_MeRoute instance) =>
    <String, dynamic>{
      'bounds': instance.bounds,
      'copyrights': instance.copyrights,
      'legs': instance.legs,
      'summary': instance.summary,
    };

_$_MeBounds _$$_MeBoundsFromJson(Map<String, dynamic> json) => _$_MeBounds(
      northeast: json['northeast'] == null
          ? null
          : MeLatlan.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : MeLatlan.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MeBoundsToJson(_$_MeBounds instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

_$_MeLatlan _$$_MeLatlanFromJson(Map<String, dynamic> json) => _$_MeLatlan(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_MeLatlanToJson(_$_MeLatlan instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_Leg _$$_LegFromJson(Map<String, dynamic> json) => _$_Leg(
      distance: json['distance'] == null
          ? null
          : MeValue.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : MeValue.fromJson(json['duration'] as Map<String, dynamic>),
      endAddress: json['end_address'] as String?,
      endLocation: json['end_location'] == null
          ? null
          : MeLatlan.fromJson(json['end_location'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String?,
      startLocation: json['start_location'] == null
          ? null
          : MeLatlan.fromJson(json['start_location'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LegToJson(_$_Leg instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'end_address': instance.endAddress,
      'end_location': instance.endLocation,
      'start_address': instance.startAddress,
      'start_location': instance.startLocation,
      'steps': instance.steps,
    };

_$_MeValue _$$_MeValueFromJson(Map<String, dynamic> json) => _$_MeValue(
      text: json['text'] as String?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$$_MeValueToJson(_$_MeValue instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

_$_Step _$$_StepFromJson(Map<String, dynamic> json) => _$_Step(
      distance: json['distance'] == null
          ? null
          : MeValue.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : MeValue.fromJson(json['duration'] as Map<String, dynamic>),
      endLocation: json['end_location'] == null
          ? null
          : MeLatlan.fromJson(json['end_location'] as Map<String, dynamic>),
      htmlInstructions: json['html_instructions'] as String?,
      startLocation: json['start_location'] == null
          ? null
          : MeLatlan.fromJson(json['start_location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StepToJson(_$_Step instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'end_location': instance.endLocation,
      'html_instructions': instance.htmlInstructions,
      'start_location': instance.startLocation,
    };
