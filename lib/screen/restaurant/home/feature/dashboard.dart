import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/util/util.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var user = context.read<RestaurantProvider>().user;
    var type = (user == null || user.memberType == null)
        ? MEMBERTYPE.RESTUSER.name
        : user.memberType;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Dashboard'.pageTitle,
        const SizedBox(height: 24.0),
        Row(
          children: [
            MEMBERTYPE.RESTOWNER.equal(typeString: type)
                ? Expanded(
                    child: CardView(
                      iconData: LineIcons.barChartAlt,
                      title: 'My Earn',
                      subtitle1: 'T : ${165000.priceValue}',
                      subtitle2: 'M : ${24560000.priceValue}',
                      percent: '14.28%',
                    ),
                  )
                : Expanded(
                    child: CardView(
                      iconData: LineIcons.productHunt,
                      title: 'Products',
                      subtitle1: 'Monthly : 18 Products',
                      subtitle2: 'All : 413 Products',
                      percent: '4.28\%',
                    ),
                  ),
            Expanded(
              child: CardView(
                iconData: LineIcons.jediOrder,
                title: 'Orders',
                subtitle1: 'T : 5 Orders',
                subtitle2: 'M : 128 Orders',
                percent: '9.34%',
                isEncreased: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        'New Orders'.toUpperCase().pageSubTitle,
        const SizedBox(height: 24.0),
        'Pending Orders'.toUpperCase().pageSubTitle,
        const SizedBox(height: 24.0),
        'Top Products'.toUpperCase().pageSubTitle,
        const SizedBox(height: 24.0),
        'New Products'.toUpperCase().pageSubTitle,
      ],
    );
  }
}
