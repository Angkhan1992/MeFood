import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';

extension EAddressModel on AddressModel {
  String? get hasFullData {
    if (address1 == null || address1!.isEmpty) {
      return '${S.current.empty} ${S.current.address1}';
    }
    if (city == null || city!.isEmpty) {
      return '${S.current.empty} ${S.current.city}';
    }
    if (postal == null || postal!.isEmpty) {
      return '${S.current.empty} ${S.current.postal_code}';
    }
    if (province == null || province!.isEmpty) {
      return '${S.current.empty} ${S.current.province}';
    }
    if (country == null || country!.isEmpty) {
      return '${S.current.empty} ${S.current.country}';
    }

    return null;
  }

  String get fullAddress {
    return address1! + ' ' + city! + ' ' + province! + ' $postal';
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

  Future<String?> update(BuildContext? context) async {
    if (hasFullData != null) {
      return hasFullData;
    }
    // var resp = await APIService.of(context).post(
    //   '${APIService.kUrlAuth}/updateAddress',
    //   toJson(),
    // );

    // if (resp != null) {
    //   if (resp['ret'] == 10000) {
    //     return null;
    //   } else {
    //     return resp['msg'];
    //   }
    // } else {
    //   return 'Server Error!';
    // }
    return null;
  }

  // Future<String?> addToRestaurant(BuildContext? context) async {
  //   if (hasFullData != null) {
  //     return hasFullData;
  //   }
  // }

  double? distanceWith(LatLng latlng) {
    try {
      var latlng1 = LatLng(double.parse(lat!), double.parse(lon!));

      final Distance distance = Distance();
      return distance(latlng1, latlng) / 1000.0;
    } catch (e) {
      return null;
    }
  }
}
