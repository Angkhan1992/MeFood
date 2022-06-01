import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/app_config.dart';
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
            S.current.car_info.wText(
              TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            S.current.reg_car_detail.wText(
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
              hintText: S.current.hint_car_name,
              keyboardType: TextInputType.text,
              onSaved: (name) => _car.name = name,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.code),
              controller: TextEditingController(text: _car.number),
              hintText: S.current.hint_car_number,
              keyboardType: TextInputType.text,
              onSaved: (number) => _car.number = number,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.color_lens_outlined),
              controller: TextEditingController(text: _car.color),
              hintText: S.current.hint_car_color,
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
              hintText: S.current.hint_car_since,
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
              hintText: S.current.hint_delivery_type,
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: () async {
                var result = await DialogService.of(context).bottomChoose(
                  values: deliveryType,
                );
                if (result != null) {
                  setState(() {
                    _car.type = result;
                  });
                }
              },
              onSaved: (type) => _car.type = type,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.social_distance),
              controller: TextEditingController(text: _car.distance.toString()),
              hintText: S.current.hint_delivery_distance,
              keyboardType: TextInputType.number,
              onSaved: (distance) => _car.distance = int.parse(distance!),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.speed_outlined),
              controller: TextEditingController(text: _car.speed.toString()),
              hintText: S.current.hint_delivery_speed,
              keyboardType: TextInputType.number,
              onSaved: (speed) => _car.speed = int.parse(speed!),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.monitor_weight_outlined),
              controller: TextEditingController(text: _car.weight.toString()),
              hintText: S.current.hint_delivery_weight,
              keyboardType: TextInputType.number,
              onSaved: (weight) => _car.weight = int.parse(weight!),
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: S.current.upt_car.toUpperCase(),
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      _formKey.currentState!.save();

                      var resp = await _car.update(context);
                      if (resp == null) {
                        if (widget.onNext != null) {
                          widget.onNext!(_car);
                        }
                      } else {
                        DialogService.of(context).showSnackBar(
                          S.current.sever_error,
                          type: SnackBarType.error,
                        );
                      }
                    },
                    isLoading: isUploadCar,
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

                          var resp = await _car.add(context);
                          if (resp == null) {
                            if (widget.onNext != null) {
                              widget.onNext!(_car);
                            }
                          } else {
                            DialogService.of(context).showSnackBar(
                              S.current.sever_error,
                              type: SnackBarType.error,
                            );
                          }
                        },
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
}
