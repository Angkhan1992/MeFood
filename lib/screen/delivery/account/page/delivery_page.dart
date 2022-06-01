import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/car_model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/delivery/account.dart';

class DeliveryPage extends StatefulWidget {
  final CarModel car;
  final Function(CarModel)? updateCar;

  const DeliveryPage({
    Key? key,
    required this.car,
    this.updateCar,
  }) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  CarModel? car;
  var isUpdated = false;

  @override
  void initState() {
    super.initState();
    car = widget.car;
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
            title: car!.name ?? 'Car Name',
            leading: Icon(
              Icons.car_rental,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.car_rental),
                title: 'Update Name',
                hintText: 'Car Name',
                initValue: car!.name,
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.name) {
                  setState(() {
                    isUpdated = true;
                    car!.name = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: car!.number ?? 'Car Plate Number',
            leading: Icon(
              Icons.numbers,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.numbers),
                title: 'Update Plate Number',
                hintText: 'Car Plate Number',
                initValue: car!.number,
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.number) {
                  setState(() {
                    isUpdated = true;
                    car!.number = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: car!.color ?? 'Car Color',
            leading: Icon(
              Icons.palette_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var updateColor = await ColorPickerService.of(
                context,
                picker: car!.color!.convert2Color,
              ).picker();
              if (updateColor != null) {
                isUpdated = true;
                car!.color = updateColor.convett2String;
              }
            },
          ),
          accountItemWidget(
            context,
            title: car!.since == null ? 'Car Since' : '${car!.since} year',
            leading: Icon(
              Icons.code,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.code),
                title: 'Update Since',
                hintText: 'Car Since',
                keyboardType: TextInputType.number,
                initValue: car!.since.toString(),
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.since.toString()) {
                  setState(() {
                    isUpdated = true;
                    car!.since = int.parse(result);
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: car!.type ?? 'Delivery Type',
            leading: Icon(
              Icons.merge_type,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).bottomChoose(
                title: 'Delivery Type',
                values: [
                  'Car',
                  'Motocycle',
                  'Walker',
                ],
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.type) {
                  setState(() {
                    isUpdated = true;
                    car!.type = result;
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: car!.distance == null
                ? 'Delivery Distance'
                : '${car!.distance} Km',
            leading: Icon(
              Icons.social_distance,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.social_distance),
                title: 'Update Distance',
                hintText: 'Delivery Distance',
                keyboardType: TextInputType.number,
                initValue: car!.distance.toString(),
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.distance.toString()) {
                  setState(() {
                    isUpdated = true;
                    car!.distance = int.parse(result);
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title:
                car!.weight == null ? 'Delivery Weight' : '${car!.weight} Kg',
            leading: Icon(
              Icons.monitor_weight,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.monitor_weight),
                title: 'Update Weight',
                hintText: 'Delivery Weight',
                keyboardType: TextInputType.number,
                initValue: car!.weight.toString(),
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.weight.toString()) {
                  setState(() {
                    isUpdated = true;
                    car!.weight = int.parse(result);
                  });
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: car!.speed == null ? 'Delivery Speed' : '${car!.speed} Km/h',
            leading: Icon(
              Icons.speed,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.speed),
                title: 'Update Speed',
                hintText: 'Delivery Speed',
                keyboardType: TextInputType.number,
                initValue: car!.speed.toString(),
              );
              if (result != null && result.isNotEmpty) {
                if (result != car!.speed.toString()) {
                  setState(() {
                    isUpdated = true;
                    car!.speed = int.parse(result);
                  });
                }
              }
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Update Delivery'.toUpperCase(),
            onTap: isUpdated
                ? () async {
                    var resp = await car!.update(context);
                    if (resp == null) {
                      if (widget.updateCar != null) {
                        widget.updateCar!(car!);
                        DialogService.of(context).showSnackBar(
                          'Success updated car data',
                        );
                      }
                    } else {
                      DialogService.of(context).showSnackBar(
                        resp,
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
