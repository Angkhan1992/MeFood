import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/address_model.dart';
import 'package:mefood/model/car_model.dart';
import 'package:mefood/model/driver_model.dart';
import 'package:mefood/model/user_model.dart';

class DeliveryProvider extends ChangeNotifier {
  UserModel? user;
  CarModel? car;
  AddressModel? address;
  String? member;

  void setUser(UserModel userModel) {
    user = userModel;
    notifyListeners();
  }

  void setAddress(AddressModel addressModel) {
    address = addressModel;
    notifyListeners();
  }

  void setCar(CarModel carModel) {
    car = carModel;
    notifyListeners();
  }

  void setMember(String membership) {
    member = membership;
    notifyListeners();
  }

  void setDeliveryUser(DriverModel driver) {
    user = driver.user;
    address = driver.address;
    car = driver.car;
    member = driver.member;
    notifyListeners();
  }

  bool isEnabled() {
    return user == null ? false : (user!.isEnabled! == 1);
  }

  bool isProMember() {
    if (user == null || user!.isEnabled! != 1) return false;
    var memberDate = member!.localDate;
    return !memberDate.expired;
  }

  bool isExpired() {
    return member!.localDate.expired;
  }

  LocationData? _currentLocation;
  Location? _location;

  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  BitmapDescriptor? _driverMarker;

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> initProvider() async {
    _location = Location();

    _driverMarker =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);

    _serviceEnabled = await _location!.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location!.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location!.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location!.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location!.onLocationChanged.listen((event) {
      _currentLocation = event;
      notifyListeners();
    });
  }

  LocationData? getCurrentLcoation() {
    return _currentLocation;
  }

  bool isEnabledLocationService() {
    return _serviceEnabled;
  }

  bool isGrantedLocationPermission() {
    return _permissionGranted == PermissionStatus.granted ||
        _permissionGranted == PermissionStatus.grantedLimited;
  }

  Map<MarkerId, Marker> getMarkers() {
    final MarkerId driverID = MarkerId('driver');
    final Marker markerDriver = Marker(
      markerId: driverID,
      position: LatLng(
        _currentLocation!.latitude!,
        _currentLocation!.longitude!,
      ),
      infoWindow: InfoWindow(title: 'Driver', snippet: '*'),
      onTap: () {
        // _onMarkerTapped(markerId);
      },
      icon: _driverMarker ?? BitmapDescriptor.defaultMarker,
    );
    _markers[driverID] = markerDriver;
    return _markers;
  }
}
