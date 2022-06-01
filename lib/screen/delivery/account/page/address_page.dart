import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:provider/provider.dart';

import 'package:mefood/model/address_model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/delivery/account.dart';

class AddressPage extends StatefulWidget {
  final AddressModel address;
  final Function(AddressModel)? updateAddress;

  const AddressPage({
    Key? key,
    required this.address,
    this.updateAddress,
  }) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  AddressModel? address;
  var isUpdated = false;

  @override
  void initState() {
    super.initState();
    address = widget.address.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          accountItemWidget(
            context,
            title: address!.address1 ?? '--------',
            leading: Icon(
              Icons.streetview,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                hintText: 'Address1',
                title: 'Update Address1',
                initValue: address!.address1,
                keyboardType: TextInputType.streetAddress,
                prefix: Icon(Icons.streetview),
              );
              if (result != null && result.isNotEmpty) {
                if (result != address!.address1) {
                  setState(() {
                    isUpdated = true;
                    address!.address1 = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: address!.city ?? '--------',
            leading: Icon(
              Icons.location_city_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                hintText: 'City Name',
                title: 'Update City',
                initValue: address!.city,
                keyboardType: TextInputType.streetAddress,
                prefix: Icon(Icons.location_city_rounded),
              );
              if (result != null && result.isNotEmpty) {
                if (result != address!.city) {
                  setState(() {
                    isUpdated = true;
                    address!.city = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: address!.province ?? '--------',
            leading: Icon(
              Icons.location_city_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                hintText: 'Province',
                title: 'Update Province',
                initValue: address!.province,
                keyboardType: TextInputType.streetAddress,
                prefix: Icon(Icons.location_city_rounded),
              );
              if (result != null && result.isNotEmpty) {
                if (result != address!.province) {
                  setState(() {
                    isUpdated = true;
                    address!.province = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: address!.postal ?? '--------',
            leading: Icon(
              Icons.code,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                hintText: 'Postal Code',
                title: 'Update Postal Code',
                initValue: address!.postal,
                keyboardType: TextInputType.number,
                prefix: Icon(Icons.code),
              );
              if (result != null && result.isNotEmpty) {
                if (result != address!.postal) {
                  setState(() {
                    isUpdated = true;
                    address!.postal = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: address!.country ?? '--------',
            leading: Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).countryPicker();
              if (result != null) {
                setState(() {
                  isUpdated = true;
                  address!.country = result;
                });
              }
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          accountItemWidget(
            context,
            title: (address!.address2 == null || address!.address2!.isEmpty)
                ? 'Address2'
                : address!.address2!,
            leading: Icon(
              Icons.streetview,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                hintText: 'Address2',
                title: 'Update Address2',
                initValue: address!.address2,
                keyboardType: TextInputType.streetAddress,
                prefix: Icon(Icons.streetview),
              );
              if (result != null && result.isNotEmpty) {
                if (result != address!.address2) {
                  setState(() {
                    isUpdated = true;
                    address!.address2 = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: (address!.lat == null || address!.lat!.isEmpty)
                ? 'Latitude: --------\nLongitude: --------'
                : '${address!.lat!}\n${address!.lon!}',
            leading: Icon(
              Icons.location_on,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              List<double> initPosition = [];
              if (address!.lat == null || address!.lat!.isEmpty) {
                var provider =
                    Provider.of<DeliveryProvider>(context, listen: false);
                initPosition.add(provider.getCurrentLcoation()!.latitude!);
                initPosition.add(provider.getCurrentLcoation()!.longitude!);
              } else {
                initPosition.add(double.parse(address!.lat!));
                initPosition.add(double.parse(address!.lon!));
              }

              var result = await DialogService.of(context).locationPicker(
                title: 'Choose Location',
                initPosition: initPosition,
              );
              if (result != null) {
                logger.d(result);
                setState(() {
                  isUpdated = true;
                  address!.lat = '${result.latitude}';
                  address!.lon = '${result.longitude}';
                });
              }
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomOutlineButton(
            title: 'Use Current Location'.toUpperCase(),
            onTap: () async {
              var status =
                  Provider.of<DeliveryProvider>(context, listen: false);
              var addresses = await placemarkFromCoordinates(
                status.getCurrentLcoation()!.latitude!,
                status.getCurrentLcoation()!.longitude!,
              );
              logger.d(addresses.first);
              address!.fromPlacemark(addresses.first);
              address!.lat = status.getCurrentLcoation()!.latitude.toString();
              address!.lon = status.getCurrentLcoation()!.longitude.toString();
              setState(() {});
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Update Address'.toUpperCase(),
            onTap: isUpdated
                ? () async {
                    var result = await address!.update(context);
                    if (result == null) {
                      if (widget.updateAddress != null) {
                        widget.updateAddress!(address!);
                        DialogService.of(context).showSnackBar(
                          'Success updated address data',
                        );
                      }
                    } else {
                      DialogService.of(context).showSnackBar(
                        result,
                        type: SnackBarType.error,
                      );
                    }
                  }
                : null,
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
