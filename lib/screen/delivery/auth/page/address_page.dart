import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/util/logger.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/widget/common/common.dart';

class AddAddressPage extends StatefulWidget {
  final Function()? onPrevious;
  final Function(AddressModel)? onNext;
  final bool isLogin;

  AddAddressPage({
    Key? key,
    this.isLogin = false,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  AddressModel _address = AddressModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isUploadAddress = false;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _address =
          Provider.of<DriverProvider>(context, listen: false).user.address ??
              AddressModel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            S.current.usr_address.wText(
              TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            S.current.reg_adr_detail.wText(
              TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              lines: 2,
            ),
            const SizedBox(
              height: 32.0,
            ),
            InkWell(
              onTap: onGetCurrentAddress,
              child: Row(
                children: [
                  Icon(
                    Icons.select_all_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  S.current.from_current_location.wText(
                    TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_on_outlined),
              controller: TextEditingController(text: _address.address1 ?? ''),
              hintText: S.current.address1,
              keyboardType: TextInputType.streetAddress,
              onSaved: (address) => _address.address1 = address,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_on_outlined),
              controller: TextEditingController(text: _address.address2 ?? ''),
              hintText: S.current.address2_optional,
              keyboardType: TextInputType.streetAddress,
              onSaved: (address) => _address.address2 = address,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_city_outlined),
              controller: TextEditingController(text: _address.city ?? ''),
              hintText: S.current.city,
              keyboardType: TextInputType.text,
              onSaved: (city) => _address.city = city,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_city_outlined),
              controller: TextEditingController(text: _address.city ?? ''),
              hintText: S.current.province,
              keyboardType: TextInputType.text,
              onSaved: (province) => _address.province = province,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.code),
              controller: TextEditingController(text: _address.postal ?? ''),
              hintText: S.current.postal_code,
              keyboardType: TextInputType.number,
              onSaved: (postal) => _address.postal = postal,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.language_outlined),
              controller: TextEditingController(
                  text: _address.country ?? S.current.laos),
              hintText: S.current.country,
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: () async {
                var result = await DialogService.of(context).countryPicker();
                setState(() {
                  _address.country = result;
                });
              },
              onSaved: (country) => _address.country = country,
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: S.current.update_address.toUpperCase(),
                    onTap: () async {
                      var resp = await _address.update(context);
                      if (resp == null) {
                        if (widget.onNext != null) {
                          widget.onNext!(_address);
                        }
                      } else {
                        DialogService.of(context).showSnackBar(
                          resp,
                          type: SnackBarType.error,
                        );
                      }
                    },
                  )
                : Column(
                    children: [
                      CustomOutlineButton(
                        title: S.current.previous.toUpperCase(),
                        onTap: widget.onPrevious,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomFillButton(
                        title: S.current.next.toUpperCase(),
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          _formKey.currentState!.save();
                          var resp = await _address.add(context);
                          if (resp == null) {
                            if (widget.onNext != null) {
                              widget.onNext!(_address);
                            }
                          } else {
                            DialogService.of(context).showSnackBar(
                              resp,
                              type: SnackBarType.error,
                            );
                          }
                        },
                        isLoading: isUploadAddress,
                      ),
                    ],
                  ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  void onGetCurrentAddress() async {
    var status = Provider.of<DeliveryProvider>(context, listen: false);
    var addresses = await placemarkFromCoordinates(
      status.getCurrentLcoation()!.latitude!,
      status.getCurrentLcoation()!.longitude!,
    );
    logger.d(addresses.first);
    _address.fromPlacemark(addresses.first);
    setState(() {});
  }
}
