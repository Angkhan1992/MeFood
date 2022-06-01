import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/screen/delivery/account/manual_membership.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/widget/delivery/account.dart';
import 'package:provider/provider.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  var isProMember = false;
  var expired = '01/01/2022';

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      var provider = Provider.of<DeliveryProvider>(context, listen: false);
      isProMember = provider.isProMember();
      expired = provider.member!.localDate.visiableDate;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership'.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: MemberShipWidget(
                title: 'Free Member',
                price: 'Free',
                conditions: [
                  'Search Range: 5Km',
                  'Max Follow Restraunt: 5 Stores',
                  'Max Follow Customer: 5 Customers',
                  'Max Available Time: 8 Hours',
                ],
                isSelected: !isProMember,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: MemberShipWidget(
                title: 'Premium Member',
                price: '\$5 per a month',
                expired: expired,
                conditions: [
                  'Search Range: 50Km',
                  'Max Follow Restraunt: Unlimited',
                  'Max Follow Customer: Unlimited',
                  'Max Available Time: Unlimited',
                  'Analysis Earn: Enabled',
                ],
                isSelected: isProMember,
                upgrade: () async {
                  var values = ['In App Purchase', 'Contact to Support'];
                  var result = await DialogService.of(context).bottomChoose(
                    values: values,
                  );
                  if (result != null) {
                    for (var i = 0; i < values.length; i++) {
                      if (result == values[i]) {
                        if (i == 0) {
                          // [Future] iap for membership
                        }
                        if (i == 1) {
                          NavigatorService.of(context).push(
                            screen: ManualMembership(),
                          );
                          return;
                        }
                      }
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
