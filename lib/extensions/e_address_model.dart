import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:provider/provider.dart';

extension EAddressModel on AddressModel {
  String? get isFullData {
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
    if (isFullData != null) {
      return isFullData;
    }
    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlAuth}/updateAddress',
      toJson(),
    );

    if (resp != null) {
      if (resp['ret'] == 10000) {
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return 'Server Error!';
    }
  }

  Future<String?> add(BuildContext? context) async {
    if (isFullData != null) {
      return isFullData;
    }
    var provider = Provider.of<DriverProvider>(context!, listen: false);
    var resp = await APIService().post(
      APIService.kUrlAuth + '/registerAddress',
      {
        'address': registerParam,
        'delivery': provider.user.id,
      },
    );

    if (resp != null) {
      if (resp['ret'] == 10000) {
        id = resp['result']['user_id'] as int;
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

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
