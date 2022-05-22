import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extensions/e_export.dart';
import 'package:mefood/provider/dialog_provider.dart';
import 'package:provider/provider.dart';

import '../../../../model/m_export.dart';
import '../../../../provider/delivery/user_provider.dart';
import '../../../../themes/dimens.dart';
import '../../../../util/extensions.dart';
import '../../../../widget/common/button.dart';
import '../../../../widget/common/textfield.dart';

class AddCarPage extends StatefulWidget {
  final Function()? onPrevious;
  final Function(CarModel)? onNext;
  AddCarPage({
    Key? key,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  CarModel _car = CarModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _car =
          Provider.of<DeliveryUserProvider>(context, listen: false).user.car ??
              CarModel();
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
            'Add Car'.wText(
              TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            'You can add your car(moto, walker) information on the current page.'
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
            CustomTextField(
              prefix: const Icon(Icons.car_rental_outlined),
              controller: TextEditingController(text: _car.name),
              hintText: 'Car Name (ex: Nisan)',
              keyboardType: TextInputType.text,
              onSaved: (name) => _car.name = name,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.code),
              controller: TextEditingController(text: _car.number),
              hintText: 'Car Number (ex: ວຽ 13-14)',
              keyboardType: TextInputType.text,
              onSaved: (number) => _car.number = number,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.color_lens_outlined),
              controller: TextEditingController(text: _car.color),
              hintText: 'Car Color (ex: Red)',
              keyboardType: TextInputType.text,
              onSaved: (color) => _car.color = color,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.signal_cellular_0_bar),
              hintText: 'Car Since (ex: 2022)',
              controller: TextEditingController(text: _car.since),
              keyboardType: TextInputType.text,
              onSaved: (since) => _car.since = since,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.type_specimen),
              controller: TextEditingController(text: _car.type),
              hintText: 'Car Type (ex: Car, Moto, Walker)',
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: onDeliveryTypeDialog,
              onSaved: (type) => _car.type = type,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.social_distance),
              controller: TextEditingController(text: _car.distance),
              hintText: 'Distance (ex: max distance Km)',
              keyboardType: TextInputType.number,
              onSaved: (distance) => _car.distance = distance,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.speed_outlined),
              controller: TextEditingController(text: _car.speed),
              hintText: 'Speed (ex: Km/h)',
              keyboardType: TextInputType.number,
              onSaved: (speed) => _car.speed = speed,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.line_weight),
              controller: TextEditingController(text: _car.weight),
              hintText: 'Weight (ex: max Delivery Kg)',
              keyboardType: TextInputType.number,
              onSaved: (weight) => _car.weight = weight,
            ),
            const SizedBox(
              height: 40.0,
            ),
            CustomOutlineButton(
              title: 'Previous'.toUpperCase(),
              onTap: widget.onPrevious,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomFillButton(
              title: 'Next'.toUpperCase(),
              onTap: () => onTapNext(),
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
      if (_car.isFullData != null) {
        DialogProvider.of(context).showSnackBar(
          _car.isFullData!,
          type: SnackBarType.error,
        );
        return;
      }
      widget.onNext!(_car);
    }
  }

  void onDeliveryTypeDialog() {
    var types = ['Car', 'Motocycle', 'Walker'];
    _formKey.currentState!.save();
    DialogProvider.of(context).showBottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Delivery Type'.wText(
            TextStyle(
              fontSize: 14.0,
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          for (var type in types) ...{
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                _car.type = type;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: offsetSm),
                child: type.wText(
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
    );
  }
}
