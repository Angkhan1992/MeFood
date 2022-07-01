import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';

extension ELocation on LocationModel {
  MeDistance get totalDistance {
    var total = 0;
    var legs = routes![0].legs!;
    for (var leg in legs) {
      for (var step in leg.steps!) {
        total += step.distance!.value ?? 0;
      }
    }
    var value = total / 1000;
    var text = '$value Km';
    return MeDistance(value: value.round(), text: text);
  }

  MeDistance get deliveryDuration {
    var deliveryTime = 0;
    var legs = routes![0].legs!;
    for (var leg in legs) {
      for (var step in leg.steps!) {
        deliveryTime += step.duration!.value ?? 0;
      }
    }
    var value = (deliveryTime / 60).round();
    var text = '$value mins';
    return MeDistance(value: value.round(), text: text);
  }

  MeDistance get deliveryPrice {
    var value =
        ((totalDistance.value! * priceDeliveryPerKm) / 1000).round() * 1000;
    var text = '₭ ${formatCurrency.format(value)}';
    return MeDistance(value: value.round(), text: text);
  }

  LatLngBounds get bounds {
    var _bounds = routes![0].bounds;
    return LatLngBounds(
      southwest: LatLng(_bounds!.southwest!.lat, _bounds.southwest!.lng),
      northeast: LatLng(_bounds.northeast!.lat, _bounds.northeast!.lng),
    );
  }

  List<Polyline> get polyLine {
    List<LatLng> routeCoords = [];

    var legs = routes![0].legs!;
    var start = legs.first.startLocation;
    routeCoords.add(LatLng(start!.lat, start.lng));

    for (var leg in legs) {
      for (var step in leg.steps!) {
        var latlng = LatLng(step.endLocation!.lat, step.endLocation!.lng);
        routeCoords.add(latlng);
      }
    }
    return [
      Polyline(
        polylineId: PolylineId('MeFood'),
        visible: true,
        points: routeCoords,
        width: 3,
        color: Colors.red,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      )
    ];
  }

  static Future<LocationModel?> fromAddress(
    BuildContext? context, {
    required AddressModel address,
    required List<RestaurantModel> restaurants,
  }) async {
    var url = "https://maps.googleapis.com/maps/api/directions/json";

    var origin = '${address.lat} ${address.lon}';
    var waypoints = 'optimize:true';
    for (var rest in restaurants) {
      waypoints += '|${rest.address!.lat} ${rest.address!.lon}';
    }
    var param = {
      "origin": origin,
      "destination": origin,
      "sensor": "false",
      "mode": "driving",
      "waypoints": waypoints,
      "provideRouteAlternatives": "true",
      "key": kGoogleMapKey,
    };

    var json = await APIService.of(context).get(url, param);
    return LocationModel.fromJson(json!);
  }
}
