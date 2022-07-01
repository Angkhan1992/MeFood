import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
}

class MeMarker extends StatelessWidget {
  final Uint8List bytes;
  final double iconSize;
  final Color borderColor;

  const MeMarker({
    Key? key,
    required this.bytes,
    this.iconSize = 48.0,
    this.borderColor = Colors.red,
  }) : super(key: key);

  Future<BitmapDescriptor?> getMarkerIcon() async {
    try {
      RenderRepaintBoundary boundary = (key! as GlobalKey)
          .currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      var byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      return BitmapDescriptor.fromBytes(pngBytes);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: key,
      child: Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(iconSize / 2.0 - 1),
          child: Image.memory(
            bytes,
            width: iconSize - 2,
            height: iconSize - 2,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
