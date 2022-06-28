import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:mefood/model/base/address_model.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';

class LocationService {
  BuildContext context;

  LocationData? _currentLocation;
  Location? _location;

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  LocationService(this.context);

  factory LocationService.of(BuildContext context) {
    return LocationService(context);
  }

  Future<String?> initService() async {
    _location = Location();

    _serviceEnabled = await _location!.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location!.requestService();
      if (!_serviceEnabled) {
        return 'Disabled Location Service!';
      }
    }

    _permissionGranted = await _location!.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location!.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return 'Location Permission Denied!';
      }
    }

    _location!.onLocationChanged.listen((event) {
      _currentLocation = event;
    });
    return null;
  }

  LocationData? getCurrentLcoation() {
    return _currentLocation;
  }

  Future<dynamic> getOrderRouter(
    BuildContext context,
    AddressModel address, {
    required List<RestaurantModel> restaurants,
  }) async {
    var url = "https://maps.googleapis.com/maps/api/directions/json";
    var json = await APIService.of(context).get(
      url,
      _getRouterParam(address, restaurants: restaurants),
    );
    return json;
  }

  Map<String, String>? _getRouterParam(
    AddressModel address, {
    required List<RestaurantModel> restaurants,
  }) {
    var origin = '${address.lat} ${address.lon}';
    var waypoints = 'optimize:true';
    for (var rest in restaurants) {
      waypoints += '|${rest.address!.lat} ${rest.address!.lon}';
    }
    return {
      "origin": origin,
      "destination": origin,
      "sensor": "false",
      "mode": "driving",
      "waypoints": waypoints,
      "provideRouteAlternatives": "true",
      "key": "AIzaSyD3EAClVhsCCe0brJ5tkUjle_z08-ClA4g",
    };
  }
}
