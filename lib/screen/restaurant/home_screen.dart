import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/model/base/base.dart';
import 'package:provider/provider.dart';

import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/screen/restaurant/home/feature/admin_user.dart';
import 'package:mefood/screen/restaurant/home/feature/dashboard.dart';
import 'package:mefood/screen/restaurant/home/feature/delivery_order.dart';
import 'package:mefood/screen/restaurant/home/feature/member_user.dart';
import 'package:mefood/screen/restaurant/home/feature/pending_order.dart';
import 'package:mefood/screen/restaurant/home/feature/product_page.dart';
import 'package:mefood/screen/restaurant/home/feature/request_order.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = {
    '0:0': Dashboard(),
    '1:0': ProductPage(),
    '2:0': RequestOrder(),
    '2:1': PendingOrder(),
    '2:2': DeliveryOrder(),
    '3:0': AdminUser(),
    '3:1': MemberUser(),
  };

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        return Consumer<RestaurantProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                HeaderView(
                  user: provider.user ?? MemberModel(),
                ),
                Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 1000.0),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 24.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: [kShadowContainer],
                                  ),
                                  child: leftMenu(),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                width: 700,
                                constraints: BoxConstraints(minHeight: 735.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 40.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: [kShadowContainer],
                                ),
                                child:
                                    screens[provider.pageIndex] ?? Container(),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          constraints: BoxConstraints(maxWidth: 1000.0),
                          child: FooterView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget leftMenu() {
    var provider = context.read<RestaurantProvider>();
    var leftMenu = [
      {
        'index': 0,
        'icon': Icon(LineIcons.dashcube),
        'title': 'Dashboard',
        'menus': [],
      },
      {
        'index': 1,
        'icon': Icon(LineIcons.productHunt),
        'title': 'Products',
        'menus': [],
      },
      {
        'index': 3,
        'icon': Icon(LineIcons.jediOrder),
        'title': 'Orders',
        'menus': ['Request', 'Pending', 'Delivery'],
      },
      {
        'index': 4,
        'icon': Icon(LineIcons.users),
        'title': 'Members',
        'menus': ['Admins', 'Users'],
      },
      {},
      {
        'index': 5,
        'icon': Icon(LineIcons.sitemap),
        'title': 'Website',
        'menus': ['Home', 'Product'],
      },
      {
        'index': 6,
        'icon': Icon(LineIcons.barChart),
        'title': 'Analysis',
        'menus': ['Order', 'Earn'],
      },
      {
        'index': 7,
        'icon': Icon(LineIcons.history),
        'title': 'History',
        'menus': [],
      },
      {},
      {
        'index': 8,
        'icon': Icon(LineIcons.cardboardVr),
        'title': 'Membership',
        'menus': [],
      },
      {
        'index': 9,
        'icon': Icon(LineIcons.superpowers),
        'title': 'Term & Privacy',
        'menus': ['Privacy & Policy', 'Term & Conditions'],
      },
      {
        'index': 9,
        'icon': Icon(LineIcons.phoneVolume),
        'title': 'Contact Us',
        'menus': ['Bug Report', 'Member Report'],
      },
      {
        'index': 10,
        'icon': Icon(LineIcons.addressCard),
        'title': 'About Us',
        'menus': ['KYGABYTE', 'How to Use'],
      },
    ];
    var superIndex = int.parse(provider.pageIndex.split(':')[0]);
    var subIndex = int.parse(provider.pageIndex.split(':')[1]);
    return Column(
      children: [
        for (var menu in leftMenu) ...{
          menu['title'] == null
              ? Divider()
              : ((menu['menus'] as List).isEmpty)
                  ? ListTile(
                      leading: (menu['icon'] as Widget),
                      title: Text(menu['title'] as String),
                      selected: menu['index'] == superIndex,
                      selectedColor: Theme.of(context).colorScheme.secondary,
                      iconColor: Theme.of(context).hintColor,
                      textColor: Theme.of(context).hintColor,
                      onTap: () {
                        superIndex = menu['index'];
                        provider.setPageIndex('$superIndex:0');
                      },
                    )
                  : ExpandedTitle(
                      icon: (menu['icon'] as Widget),
                      title: menu['title'] as String,
                      subs: (menu['menus'] as List<String>),
                      selected: menu['index'] == superIndex,
                      subIndex: subIndex,
                      onTap: () {
                        superIndex = menu['index'];
                        provider.setPageIndex('$superIndex:0');
                      },
                      onItemTap: (index) {
                        subIndex = index;
                        provider.setPageIndex('$superIndex:$subIndex');
                      },
                    ),
        },
      ],
    );
  }
}
