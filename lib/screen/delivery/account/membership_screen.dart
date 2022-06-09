import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/delivery/delivery.dart';
import 'package:provider/provider.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  var isExpired = false;
  var expired = '01/01/2022';

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      var provider = Provider.of<DeliveryProvider>(context, listen: false);
      isExpired = provider.isExpired();
      // expired = provider.user!.localDate.visiableDate;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.membership.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            // Expanded(
            //   child: MemberShipWidget(
            //     title: S.current.free_member,
            //     price: S.current.free,
            //     conditions: condFreeDelivery,
            //     isSelected: !isExpired,
            //   ),
            // ),
            // const SizedBox(
            //   height: 24.0,
            // ),
            // Expanded(
            //   child: MemberShipWidget(
            //     title: S.current.premium_member,
            //     price: S.current.monthly_5,
            //     expired: expired,
            //     conditions: condProDelivery,
            //     isSelected: isExpired,
            //     upgrade: () async {
            //       var result = await DialogService.of(context).bottomChoose(
            //         values: paymentType,
            //       );
            //       if (result != null) {
            //         for (var i = 0; i < paymentType.length; i++) {
            //           if (result == paymentType[i]) {
            //             if (i == 0) {
            //               // [Future] iap for membership
            //             }
            //             if (i == 1) {
            //               NavigatorService.of(context).push(
            //                 screen: ManualMembership(),
            //               );
            //               return;
            //             }
            //           }
            //         }
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
