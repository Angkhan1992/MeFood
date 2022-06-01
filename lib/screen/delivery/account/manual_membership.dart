import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/util/constants.dart';
import 'package:mefood/util/logger.dart';

class ManualMembership extends StatefulWidget {
  ManualMembership({Key? key}) : super(key: key);

  @override
  State<ManualMembership> createState() => _ManualMembershipState();
}

class _ManualMembershipState extends State<ManualMembership> {
  List<CenterModel> models = [];
  DeliveryProvider? provider;

  final chooseListener = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    Timer.run(initDate);
  }

  void initDate() async {
    provider = Provider.of<DeliveryProvider>(context, listen: false);
    var currentLocation = LatLng(
      provider!.getCurrentLcoation()!.latitude!,
      provider!.getCurrentLcoation()!.longitude!,
    );

    models.clear();
    models = await ECenterModel.getAllCenterData(context);
    logger.d(models);

    models.sort((a, b) {
      var d1 = a.address!.distanceWith(currentLocation);
      var d2 = b.address!.distanceWith(currentLocation);
      return d1!.compareTo(d2!);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.manual_membership.toUpperCase()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            Text(
              S.current.dsc_pay_manual_01,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (models.isNotEmpty)
              ValueListenableBuilder(
                valueListenable: chooseListener,
                builder: (context, v, w) => Column(
                  children: [
                    for (var model in models) ...{
                      supportItem(
                        model,
                        isSelected: models.indexOf(model) == v,
                        onTap: () =>
                            chooseListener.value = models.indexOf(model),
                      ),
                    },
                  ],
                ),
              ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              S.current.dsc_pay_manual_02,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (provider != null)
              QrImage(
                padding: const EdgeInsets.all(24.0),
                data: jsonEncode({
                  'usr_id': provider!.user!.id!,
                  'content': S.current.manual_membership,
                  'type': S.current.delivery,
                  'price': '5\$',
                  'createAt': DateTime.now().convert2ServerTime,
                }),
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width - 64.0,
                foregroundColor: Theme.of(context).textTheme.bodyText1!.color,
              ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              S.current.dsc_pay_manual_03,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget supportItem(
    CenterModel model, {
    bool isSelected = false,
    Function()? onTap,
  }) {
    var accentColor = isSelected
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).hintColor;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: accentColor,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 18.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                InkWell(
                  onTap: () => urlEmailLaunch(
                    model.email!,
                    subject: S.current.manual_membership,
                  ),
                  child: Text(
                    model.email!,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 18.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                InkWell(
                  onTap: () => urlPhoneCallLaunch(model.phone!),
                  child: Text(
                    '+856 ${model.phone!}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                InkWell(
                  onTap: () => urlGoogleMapLaunch(
                    model.address!.lat!,
                    model.address!.lon!,
                  ),
                  child: Text(
                    '${model.address!.lat} ${model.address!.lon}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.social_distance,
                  size: 18.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Text(
                  '${model.address!.distanceWith(
                    LatLng(
                      provider!.getCurrentLcoation()!.latitude!,
                      provider!.getCurrentLcoation()!.longitude!,
                    ),
                  )} Km',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
