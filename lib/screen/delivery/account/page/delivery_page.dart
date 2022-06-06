import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/config.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/delivery/delivery.dart';

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
            title: car!.name ?? S.current.hint_car_name,
            leading: Icon(
              Icons.car_rental,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.car_rental),
                title: '${S.current.update} ${S.current.name}',
                hintText: S.current.hint_car_name,
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
            title: car!.number ?? S.current.car_plate,
            leading: Icon(
              Icons.numbers,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.numbers),
                title: '${S.current.update} ${S.current.car_plate}',
                hintText: S.current.car_plate,
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
            title: car!.color ?? S.current.hint_car_color,
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
            title: car!.since == null
                ? S.current.hint_car_since
                : '${car!.since} ${S.current.year}',
            leading: Icon(
              Icons.code,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.code),
                title: '${S.current.update} ${S.current.hint_car_since}',
                hintText: S.current.hint_car_since,
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
            title: car!.type ?? S.current.delivery_type,
            leading: Icon(
              Icons.merge_type,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).bottomChoose(
                title: S.current.delivery_type,
                values: deliveryType,
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
                ? S.current.hint_delivery_distance
                : '${car!.distance} Km',
            leading: Icon(
              Icons.social_distance,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.social_distance),
                title:
                    '${S.current.update} ${S.current.hint_delivery_distance}',
                hintText: S.current.hint_delivery_distance,
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
            title: car!.weight == null
                ? S.current.hint_delivery_weight
                : '${car!.weight} Kg',
            leading: Icon(
              Icons.monitor_weight,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.monitor_weight),
                title: '${S.current.update} ${S.current.hint_delivery_weight}',
                hintText: S.current.hint_delivery_weight,
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
            title: car!.speed == null
                ? S.current.hint_delivery_speed
                : '${car!.speed} Km/h',
            leading: Icon(
              Icons.speed,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var result = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.speed),
                title: '${S.current.update} ${S.current.hint_delivery_speed}',
                hintText: S.current.hint_delivery_speed,
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
            title: '${S.current.update} ${S.current.delivery}'.toUpperCase(),
            onTap: isUpdated
                ? () async {
                    var resp = await car!.update(context);
                    if (resp == null) {
                      if (widget.updateCar != null) {
                        widget.updateCar!(car!);
                        DialogService.of(context).showSnackBar(
                          S.current.success_data_updated,
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
