import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/delivery/delivery.dart';
import 'package:mefood/screen/base/mail_screen.dart';
import 'package:mefood/screen/delivery/account/account_screen.dart';
import 'package:mefood/screen/delivery/account/membership_screen.dart';
import 'package:mefood/screen/delivery/main/chat_page.dart';
import 'package:mefood/screen/delivery/main/history_page.dart';
import 'package:mefood/screen/delivery/main/order_page.dart';
import 'package:mefood/screen/delivery/main/status_page.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/customer/customer.dart';
import 'package:mefood/widget/page/network_error.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _event = ValueNotifier(0);
  final _titles = [
    S.current.status.toUpperCase(),
    S.current.orders.toUpperCase(),
    S.current.history.toUpperCase(),
    S.current.chat.toUpperCase(),
  ];

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      // AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
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
                                    CircleAvatarNetwork(
                                      avatar: provider.user!.linkAvatar,
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
                                    screen: MailScreen(
                                      user: provider.user!,
                                    ),
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
                          title: Text(S.current.my_profile.toUpperCase()),
                          onTap: () {
                            Navigator.of(context).pop();
                            NavigatorService.of(context).push(
                              screen: AccountScreen(
                                member: provider.user,
                                address: provider.address,
                                car: provider.car,
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
                          title: Text(S.current.membership.toUpperCase()),
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
                          title: Text(S.current.follows.toUpperCase()),
                          onTap: () {
                            Navigator.of(context).pop();
                            // [Future] new feature
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
                            title: Text(S.current.my_earn.toUpperCase()),
                            trailing: ListItemTag(tag: 'NEW'),
                            onTap: () {
                              Navigator.of(context).pop();
                              // [Future] new feature
                            },
                          ),
                        Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_email.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text(S.current.report.toUpperCase()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/ic_book.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text(S.current.privacy_policy.toUpperCase()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_mobile.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text(S.current.contact_us.toUpperCase()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/menu/ic_setting.svg',
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 18.0,
                            height: 18.0,
                          ),
                          title: Text(S.current.settings.toUpperCase()),
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
                            S.current.logout.toUpperCase(),
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
          onPrevious: () {},
          onNext: () {},
          onDatePicker: () async {},
        );
      case 3:
        return TextActionButton(title: 'Support');
    }
    return Container();
  }

  Widget _buildBottomNavigationBar() {
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
            label: _titles[i].wText(
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
