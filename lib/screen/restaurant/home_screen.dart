import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageEvent = ValueNotifier('0:0');

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        return Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 1000.0),
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              height: 56.0,
              child: Row(
                children: [
                  WebLogo(),
                  const Spacer(),
                ],
              ),
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
                      child: ValueListenableBuilder<String>(
                        valueListenable: _pageEvent,
                        builder: (context, value, child) {
                          return Row(
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
                                  child: leftMenu(value),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                width: 700,
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
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ],
                          );
                        },
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
  }

  Widget leftMenu(String value) {
    var leftMenu = [
      {
        'icon': Icon(LineIcons.dashcube),
        'title': 'Dashboard',
        'menus': [],
      },
      {
        'icon': Icon(LineIcons.productHunt),
        'title': 'Products',
        'menus': [],
      },
      {
        'icon': Icon(LineIcons.jediOrder),
        'title': 'Orders',
        'menus': ['Pending', 'Delivery'],
      },
      {
        'icon': Icon(LineIcons.users),
        'title': 'Members',
        'menus': ['Admins', 'Users'],
      },
      {},
      {
        'icon': Icon(LineIcons.sitemap),
        'title': 'Website',
        'menus': ['Home', 'Product'],
      },
      {
        'icon': Icon(LineIcons.barChart),
        'title': 'Analysis',
        'menus': ['Order', 'Earn'],
      },
      {
        'icon': Icon(LineIcons.history),
        'title': 'History',
        'menus': [],
      },
      {},
      {
        'icon': Icon(LineIcons.cardboardVr),
        'title': 'Membership',
        'menus': [],
      },
      {
        'icon': Icon(LineIcons.superpowers),
        'title': 'Term & Privacy',
        'menus': ['Privacy & Policy', 'Term & Conditions'],
      },
      {
        'icon': Icon(LineIcons.phoneVolume),
        'title': 'Contact Us',
        'menus': ['Bug Report', 'Member Report'],
      },
      {
        'icon': Icon(LineIcons.addressCard),
        'title': 'About Us',
        'menus': ['KYGABYTE', 'How to Use'],
      },
    ];
    var superIndex = int.parse(value.split(':')[0]);
    var subIndex = int.parse(value.split(':')[1]);
    return Column(
      children: [
        for (var menu in leftMenu) ...{
          menu['title'] == null
              ? Divider()
              : ((menu['menus'] as List).isEmpty)
                  ? ListTile(
                      leading: (menu['icon'] as Widget),
                      title: Text(menu['title'] as String),
                      selected: leftMenu.indexOf(menu) == superIndex,
                      selectedColor: Theme.of(context).colorScheme.secondary,
                      iconColor: Theme.of(context).hintColor,
                      textColor: Theme.of(context).hintColor,
                      onTap: () {
                        superIndex = leftMenu.indexOf(menu);
                        _pageEvent.value = '$superIndex:0';
                      },
                    )
                  : ExpandedTitle(
                      icon: (menu['icon'] as Widget),
                      title: menu['title'] as String,
                      subs: (menu['menus'] as List<String>),
                      selected: leftMenu.indexOf(menu) == superIndex,
                      subIndex: subIndex,
                      onTap: () {
                        superIndex = leftMenu.indexOf(menu);
                        _pageEvent.value = '$superIndex:0';
                      },
                      onItemTap: (index) {
                        subIndex = index;
                        _pageEvent.value = '$superIndex:$subIndex';
                      },
                    ),
        },
      ],
    );
  }
}
