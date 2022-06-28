import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';

class AddAddress extends StatefulWidget {
  final AddressModel? address;
  AddAddress({
    Key? key,
    this.address,
  }) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  AddressModel? model;

  var _lat = 0.0, _lon = 0.0;

  @override
  void initState() {
    super.initState();
    model = widget.address ?? AddressModel();
    try {
      model!.country = 'Laos';
      _lat = double.parse(model!.lat!);
      _lon = double.parse(model!.lon!);
    } catch (_) {
      _lat = defaultLatitude;
      _lon = defaultLongitude;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: widget.address == null ? 'Add Address' : 'Update Address',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  'From the Current Location',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: offsetXLg),
            Row(
              children: [
                Text(
                  'Location Detail',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onUpdatedMap,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        'From Map',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: offsetXMd),
            CustomTextField(
              prefix: Icon(LineIcons.locationArrow),
              controller: TextEditingController(text: model!.address1),
              keyboardType: TextInputType.streetAddress,
              hintText: 'Address1',
              onChanged: (value) => model!.address1 = value,
            ),
            const SizedBox(height: offsetSm),
            CustomTextField(
              prefix: Icon(LineIcons.locationArrow),
              controller: TextEditingController(text: model!.address2),
              keyboardType: TextInputType.streetAddress,
              hintText: 'Address2',
              onChanged: (value) => model!.address2 = value,
            ),
            const SizedBox(height: offsetSm),
            CustomTextField(
              prefix: Icon(Icons.location_city),
              controller: TextEditingController(text: model!.city),
              keyboardType: TextInputType.streetAddress,
              hintText: 'City',
              onChanged: (value) => model!.city = value,
            ),
            const SizedBox(height: offsetSm),
            CustomTextField(
              prefix: Icon(Icons.location_city),
              controller: TextEditingController(text: model!.province),
              keyboardType: TextInputType.streetAddress,
              hintText: 'Province',
              onChanged: (value) => model!.province = value,
            ),
            const SizedBox(height: offsetSm),
            CustomTextField(
              prefix: Icon(Icons.code),
              controller: TextEditingController(text: model!.postal),
              keyboardType: TextInputType.number,
              hintText: 'Postal Code',
              onChanged: (value) => model!.postal = value,
            ),
            const SizedBox(height: offsetSm),
            CustomTextField(
              prefix: Icon(Icons.language),
              controller: TextEditingController(text: 'Laos'),
              hintText: 'Country',
              readOnly: true,
            ),
            const SizedBox(height: offsetBase),
            CustomTextField(
              prefix: Icon(Icons.location_searching),
              controller: TextEditingController(text: model!.lat),
              keyboardType: TextInputType.number,
              hintText: 'Latitude',
            ),
            const SizedBox(height: offsetBase),
            CustomTextField(
              prefix: Icon(Icons.location_searching),
              controller: TextEditingController(text: model!.lon),
              keyboardType: TextInputType.number,
              hintText: 'Longitude',
            ),
            const SizedBox(height: offsetLg),
            CustomFillButton(
              title: widget.address == null ? 'Add Address' : 'Update Address',
              onTap: action,
            ),
          ],
        ),
      ),
    );
  }

  void onUpdatedMap() async {
    var latlng = await DialogService.of(context).locationPicker(
      title: widget.address == null ? 'Add Address' : 'Update Address',
      initPosition: [_lat, _lon],
    );
    logger.d(latlng);
    model!.lat = latlng!.latitude.toString();
    model!.lon = latlng.longitude.toString();

    var addresses = await placemarkFromCoordinates(
      latlng.latitude,
      latlng.longitude,
    );
    logger.d(addresses.first);
    model!.fromPlacemark(addresses.first);

    if (mounted) {
      setState(() {});
    }
  }

  void action() async {
    var err = model!.hasFullData;
    if (err != null) {
      DialogService.of(context).showSnackBar(err, type: SnackBarType.error);
      return;
    }
    if (widget.address == null) {
      var resp = await model!.add(context);
      if (resp == null) {
        var customerProvider = context.read<CustomerProvider>();
        var err = await customerProvider.addAddress(
          context,
          address: model!,
        );
        if (err == null) {
          Navigator.of(context).pop(true);
          return;
        }
      }
      DialogService.of(context).showSnackBar(
        S.current.sever_error,
        type: SnackBarType.error,
      );
    } else {
      var resp = await model!.update(context);
      if (resp == null) {
        Navigator.of(context).pop(true);
        return;
      }
      DialogService.of(context).showSnackBar(
        S.current.sever_error,
        type: SnackBarType.error,
      );
    }
  }
}
