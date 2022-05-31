import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:provider/provider.dart';

class AddCarPage extends StatefulWidget {
  final Function()? onPrevious;
  final Function(CarModel)? onNext;
  final bool isLogin;

  AddCarPage({
    Key? key,
    this.isLogin = false,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  CarModel _car = CarModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var isUploadCar = false;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _car = Provider.of<DriverProvider>(context, listen: false).user.car ??
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
            'Car Information'.wText(
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
              hintText: 'Car Color (ex: 0xff0000)',
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: () async {
                var updateColor = await ColorPickerService.of(
                  context,
                  picker: _car.color!.convert2Color,
                ).picker();
                if (updateColor != null) {
                  _car.color = updateColor.convett2String;
                }
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.signal_cellular_0_bar),
              hintText: 'Car Since (ex: 2022)',
              controller: TextEditingController(text: _car.since.toString()),
              keyboardType: TextInputType.number,
              onSaved: (since) => _car.since = int.parse(since!),
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
              controller: TextEditingController(text: _car.distance.toString()),
              hintText: 'Distance (ex: max distance Km)',
              keyboardType: TextInputType.number,
              onSaved: (distance) => _car.distance = int.parse(distance!),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.speed_outlined),
              controller: TextEditingController(text: _car.speed.toString()),
              hintText: 'Speed (ex: Km/h)',
              keyboardType: TextInputType.number,
              onSaved: (speed) => _car.speed = int.parse(speed!),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.line_weight),
              controller: TextEditingController(text: _car.weight.toString()),
              hintText: 'Weight (ex: max Delivery Kg)',
              keyboardType: TextInputType.number,
              onSaved: (weight) => _car.weight = int.parse(weight!),
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: 'Update Car'.toUpperCase(),
                    onTap: onTapSubmit,
                    isLoading: isUploadCar,
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
                        isLoading: isUploadCar,
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

  void onTapSubmit() async {
    FocusScope.of(context).unfocus();
    if (widget.onNext != null) {
      _formKey.currentState!.save();
      if (_car.isFullData != null) {
        DialogService.of(context).showSnackBar(
          _car.isFullData!,
          type: SnackBarType.error,
        );
        return;
      }
      FocusScope.of(context).unfocus();

      var resp = await APIService.of(context: context).post(
        '${APIService.kUrlAuth}/updateCar',
        _car.toJson(),
      );
      if (resp!['ret'] == 10000) {
        widget.onNext!(_car);
      } else {
        DialogService.of(context).showSnackBar(
          'Server Error!',
          type: SnackBarType.error,
        );
      }
    }
  }

  void onTapNext() async {
    _formKey.currentState!.save();
    if (widget.onNext != null) {
      if (_car.isFullData != null) {
        DialogService.of(context).showSnackBar(
          _car.isFullData!,
          type: SnackBarType.error,
        );
        return;
      }
      FocusScope.of(context).unfocus();

      var provider = Provider.of<DriverProvider>(context, listen: false);
      setState(() {
        isUploadCar = true;
      });
      var resp = await APIService().post(
        APIService.kUrlAuth + '/registerCar',
        {
          'car': _car.registerParam,
          'delivery': provider.user.id,
        },
      );
      if (resp != null) {
        if (resp['ret'] == 10000) {
          var id = resp['result'];
          _car.id = id;
          widget.onNext!(_car);
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
        isUploadCar = false;
      });
    }
  }

  void onDeliveryTypeDialog() {
    var types = ['Car', 'Motocycle', 'Walker'];
    _formKey.currentState!.save();
    DialogService.of(context).showBottomSheet(
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
