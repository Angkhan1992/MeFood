import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/provider/delivery/delivery_provider.dart';
import 'package:mefood/screen/delivery/account/account_screen.dart';
import 'package:mefood/screen/delivery/account/mail_screen.dart';
import 'package:mefood/screen/delivery/account/membership_screen.dart';
import 'package:mefood/screen/delivery/main/chat_page.dart';
import 'package:mefood/screen/delivery/main/history_page.dart';
import 'package:mefood/screen/delivery/main/order_page.dart';
import 'package:mefood/screen/delivery/main/status_page.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/delivery/delivery.dart';
import 'package:mefood/widget/page/network_error.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _event = ValueNotifier(0);
  final _titles = [
    'STATUS MAP',
    'ORDERS',
    'HISTORY',
    'CHAT',
  ];

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data == null ||
              snapshot.data == ConnectivityResult.none) {
            return NetworkErrorPage();
          }
          return ValueListenableBuilder(
            valueListenable: _event,
            builder: (context, value, child) => Consumer<DeliveryProvider>(
              builder: (context, provider, child) {
                var screens = [
                  StatusPage(provider: provider),
                  const OrderPage(),
                  HistoryPage(
                    initDate: DateTime.now(),
                  ),
                  const ChatPage(),
                ];
                return Scaffold(
                  appBar: AppBar(
                    title: Text(_titles[_event.value]),
                    actions: [
                      _actionWidget(),
                    ],
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Stack(
                          children: [
                            DrawerHeader(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AvatarImageWidget(
                                      avatar: provider.user!.avatar,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    Text(
                                      provider.user!.fullName,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: DrawMailIcon(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  NavigatorService.of(context).push(
                                    screen: MailScreen(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_profile.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text('My Profile'.toUpperCase()),
                          onTap: () {
                            Navigator.of(context).pop();
                            NavigatorService.of(context).push(
                              screen: AccountScreen(
                                provider: provider,
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/ic_coin.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text('Membership'.toUpperCase()),
                          onTap: () {
                            Navigator.of(context).pop();
                            NavigatorService.of(context).push(
                              screen: MembershipScreen(),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            LineIcons.userFriends,
                            size: 18.0,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          title: Text('Follows'.toUpperCase()),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        if (!provider.isExpired())
                          ListTile(
                            leading: SvgPicture.asset(
                              'assets/icons/menu/ic_chart.svg',
                              color: Theme.of(context).secondaryHeaderColor,
                              width: 18.0,
                              height: 18.0,
                            ),
                            title: Text('My Earn'.toUpperCase()),
                            trailing: ListItemTag(tag: 'NEW'),
                            onTap: () {},
                          ),
                        Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_email.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text('Report'.toUpperCase()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/ic_book.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text('Privacy & Policy'.toUpperCase()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_mobile.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text('Contact Us'.toUpperCase()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_setting.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text('Settings'.toUpperCase()),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_sign.svg',
                            color: Colors.red,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text(
                            'Logout'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: _buildBottomNavigationBar(),
                  body: screens[_event.value],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _actionWidget() {
    switch (_event.value) {
      case 0:
        return DriverStatus(
          onTap: () {},
        );
      case 1:
        return DriverStatus(
          onTap: () {},
        );
      case 2:
        return DriverCalendar(
          onTapBack: () {},
          onTapForward: () {},
          onTapCalendar: () async {},
        );
      case 3:
        return TextActionButton(title: 'Support');
    }
    return Container();
  }

  Widget _buildBottomNavigationBar() {
    var bottomBarTitles = [
      'Status',
      'Order',
      'History',
      'Chat',
    ];
    var bottomItemImages = [
      'assets/icons/menu/ic_monitor.svg',
      'assets/icons/menu/ic_order.svg',
      'assets/icons/menu/ic_history.svg',
      'assets/icons/menu/ic_chat.svg',
    ];
    return CustomBottomBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _event.value,
      onChange: (index) {
        _event.value = index;
      },
      children: [
        for (var i = 0; i < bottomItemImages.length; i++)
          CustomBottomNavigationItem(
            icon: SvgPicture.asset(
              bottomItemImages[i],
              color: _event.value == i
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSecondary,
              width: offsetXMd,
              height: offsetXMd,
            ),
            label: bottomBarTitles[i].wText(
              CustomText.semiBold(
                fontSize: fontXSm,
                color: _event.value == i
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
      ],
    );
  }
}
