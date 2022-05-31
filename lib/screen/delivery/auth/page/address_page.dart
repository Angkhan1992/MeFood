import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mefood/util/logger.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
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
            'User Address'.wText(
              TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            'You can add your home address information on the current page.'
                .wText(
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
                  'From the Current Location'.wText(
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
              hintText: 'Address1',
              keyboardType: TextInputType.streetAddress,
              onSaved: (address) => _address.address1 = address,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_on_outlined),
              controller: TextEditingController(text: _address.address2 ?? ''),
              hintText: 'Address2 (Optional)',
              keyboardType: TextInputType.streetAddress,
              onSaved: (address) => _address.address2 = address,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_city_outlined),
              controller: TextEditingController(text: _address.city ?? ''),
              hintText: 'City',
              keyboardType: TextInputType.text,
              onSaved: (city) => _address.city = city,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.location_city_outlined),
              controller: TextEditingController(text: _address.city ?? ''),
              hintText: 'Province',
              keyboardType: TextInputType.text,
              onSaved: (province) => _address.province = province,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.code),
              controller: TextEditingController(text: _address.postal ?? ''),
              hintText: 'Postal Code',
              keyboardType: TextInputType.number,
              onSaved: (postal) => _address.postal = postal,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.language_outlined),
              controller: TextEditingController(text: _address.country ?? ''),
              hintText: 'Country',
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: onCountryDialog,
              onSaved: (country) => _address.country = country,
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: 'Update Address'.toUpperCase(),
                    onTap: onTapSubmit,
                  )
                : Column(
                    children: [
                      CustomOutlineButton(
                        title: 'Previous'.toUpperCase(),
                        onTap: widget.onPrevious,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomFillButton(
                        title: 'Next'.toUpperCase(),
                        onTap: onTapNext,
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

  void onTapNext() async {
    _formKey.currentState!.save();
    if (widget.onNext != null) {
      if (_address.isFullData != null) {
        DialogService.of(context).showSnackBar(
          _address.isFullData!,
          type: SnackBarType.error,
        );
      } else {
        FocusScope.of(context).unfocus();
        var provider = Provider.of<DriverProvider>(context, listen: false);

        setState(() {
          isUploadAddress = true;
        });
        var resp = await APIService().post(
          APIService.kUrlAuth + '/registerAddress',
          {
            'address': _address.registerParam,
            'delivery': provider.user.id,
          },
        );
        if (resp != null) {
          if (resp['ret'] == 10000) {
            _address.id = resp['result'] as int;
            widget.onNext!(_address);
          } else {
            DialogService.of(context).showSnackBar(
              resp['msg'],
              type: SnackBarType.error,
            );
          }
        } else {
          DialogService.of(context).showSnackBar(
            'Server Error!',
            type: SnackBarType.error,
          );
        }
        setState(() {
          isUploadAddress = false;
        });
      }
    }
  }

  void onTapSubmit() async {
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();
    if (_address.isFullData != null) {
      DialogService.of(context).showSnackBar(
        'Please fill fields',
        type: SnackBarType.error,
      );
      return;
    }
    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlAuth}/updateAddress',
      _address.toJson(),
    );
    if (resp!['ret'] == 10000) {
      widget.onNext!(_address);
    } else {
      DialogService.of(context).showSnackBar(
        'Server Error!',
        type: SnackBarType.error,
      );
    }
  }

  void onCountryDialog() async {
    _formKey.currentState!.save();
    var countries = await JsonService.readCountryFromJson();
    DialogService.of(context).showBottomSheet(
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              'Choose Country'.wText(
                TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              for (var country in countries) ...{
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    _address.country = country.name;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: offsetSm),
                    child: '${country.name} (${country.code})'.wText(
                      TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              },
            ],
          ),
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
