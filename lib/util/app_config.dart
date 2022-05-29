import 'package:google_maps_flutter/google_maps_flutter.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(42.747932, -71.167889);
const LatLng DEST_LOCATION = LatLng(37.335685, -122.0605916);

const String passUpperPattern = r'^(?=.*[A-Z])$';
const String passLowerPattern = r'^(?=.*[a-z])$';
const String passNumberPattern = r'^(?=.*[0-9])$';
const String passSpecialPattern = r'^(?=.*[!@#$&*])$';
const String passLengthPattern = r'^.{8}$';
