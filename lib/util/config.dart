import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mefood/generated/l10n.dart';

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

List<String> deliveryType = [
  S.current.type_car,
  S.current.type_motocycle,
  S.current.type_walker,
];

List<String> genderType = [
  S.current.type_male,
  S.current.type_female,
];

List<String> paymentType = [
  S.current.type_iap,
  S.current.type_support,
];

List<String> descPassRegx = [
  S.current.dsc_rex_pass_upper,
  S.current.dsc_rex_pass_lower,
  S.current.dsc_rex_pass_number,
  S.current.dsc_rex_pass_special,
  S.current.dsc_rex_pass_length,
];

List<String> condFreeDelivery = [
  S.current.cnd_delivery_free_01,
  S.current.cnd_delivery_free_02,
  S.current.cnd_delivery_free_03,
  S.current.cnd_delivery_free_04,
];

List<String> condProDelivery = [
  S.current.cnd_delivery_pro_01,
  S.current.cnd_delivery_pro_02,
  S.current.cnd_delivery_pro_03,
  S.current.cnd_delivery_pro_04,
  S.current.cnd_delivery_pro_05,
];
