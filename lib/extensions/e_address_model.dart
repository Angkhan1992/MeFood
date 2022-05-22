import 'package:geocoding/geocoding.dart';
import 'package:mefood/model/address_model.dart';

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
}
