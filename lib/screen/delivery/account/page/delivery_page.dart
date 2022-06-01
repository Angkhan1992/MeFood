import 'package:flutter/material.dart';
import 'package:mefood/model/car_model.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/delivery/account.dart';

class DeliveryPage extends StatelessWidget {
  final CarModel car;
  const DeliveryPage({
    Key? key,
    required this.car,
  }) : super(key: key);

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
            title: car.name ?? 'Car Name',
            leading: Icon(
              Icons.car_rental,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.number ?? 'Car Plate Number',
            leading: Icon(
              Icons.numbers,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.color ?? 'Car Color',
            leading: Icon(
              Icons.palette_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.since == null ? 'Car Since' : '${car.since} year',
            leading: Icon(
              Icons.code,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.type ?? 'Delivery Type',
            leading: Icon(
              Icons.merge_type,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.distance == null
                ? 'Delivery Distance'
                : '${car.distance} Km',
            leading: Icon(
              Icons.social_distance,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.weight == null ? 'Delivery Weight' : '${car.weight} Kg',
            leading: Icon(
              Icons.monitor_weight,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          accountItemWidget(
            context,
            title: car.speed == null ? 'Delivery Speed' : '${car.speed} Km/h',
            leading: Icon(
              Icons.speed,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Update Delivery'.toUpperCase(),
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
