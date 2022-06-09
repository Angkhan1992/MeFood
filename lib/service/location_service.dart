import 'package:flutter/widgets.dart';
import 'package:location/location.dart';

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
}
