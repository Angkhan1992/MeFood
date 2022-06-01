import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
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
                hintText: S.current.address1,
                title: '${S.current.update} ${S.current.address1}',
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
                hintText: S.current.city,
                title: '${S.current.update} ${S.current.city}',
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
                hintText: S.current.province,
                title: '${S.current.update} ${S.current.province}',
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
                hintText: S.current.postal_code,
                title: '${S.current.update} ${S.current.postal_code}',
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
                ? S.current.address2_optional
                : address!.address2!,
            leading: Icon(
              Icons.streetview,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                hintText: S.current.address2_optional,
                title: '${S.current.update} ${S.current.address2_optional}',
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
                ? '${S.current.latitude}: --------\n${S.current.longitude}: --------'
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
                title: S.current.choose_location,
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
            title: S.current.from_current_location.toUpperCase(),
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
            title: S.current.update_address.toUpperCase(),
            onTap: isUpdated
                ? () async {
                    var result = await address!.update(context);
                    if (result == null) {
                      if (widget.updateAddress != null) {
                        widget.updateAddress!(address!);
                        DialogService.of(context).showSnackBar(
                          S.current.success_data_updated,
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
