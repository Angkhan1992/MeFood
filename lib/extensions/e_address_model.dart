import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:mefood/model/model.dart';

extension EAddressModel on AddressModel {
  String? get isFullData {
    if (address1 == null || address1!.isEmpty) return 'Address Data Empty';
    if (city == null || city!.isEmpty) return 'The city name is Empty';
    if (postal == null || postal!.isEmpty) return 'The postal code is Empty';
    if (province == null || province!.isEmpty) return 'Province Data Empty';
    if (country == null || country!.isEmpty) return 'Country Empty';

    return null;
  }

  void fromPlacemark(Placemark place) {
    address2 = place.name ?? '';
    address1 = place.street ?? '';
    country = place.country ?? '';
    postal = place.postalCode ?? '';
    province = place.administrativeArea ?? '';
    city = place.locality ?? '';
  }

  String get registerParam {
    var result = <String, String>{};
    for (var key in toJson().keys) {
      var value = toJson()[key];
      result[key] = value == null ? '' : value.toString();
    }
    return jsonEncode(result);
  }
}
