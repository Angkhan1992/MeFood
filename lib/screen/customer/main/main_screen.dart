import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/screen/customer/main/offer_screen.dart';
import 'package:mefood/screen/customer/main/order_screen.dart';
import 'package:mefood/themes/textstyles.dart';
import 'package:mefood/extensions/e_string.dart';

import '../../../themes/dimens.dart';
import '../../../widget/common/appbar.dart';
import 'home_screen.dart';
import 'setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final _event = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    var screens = [
      const HomeScreen(),
      const OrderScreen(),
      const OfferScreen(),
      const SettingScreen(),
    ];
    return WillPopScope(
      child: ValueListenableBuilder(
        builder: (context, value, child) {
          return Scaffold(
            bottomNavigationBar: _buildBottomNavigationBar(),
            body: screens[_event.value],
          );
        },
        valueListenable: _event,
      ),
      onWillPop: () async => false,
    );
  }

  Widget _buildBottomNavigationBar() {
    var bottomBarTitles = [
      'Home',
      'Order',
      'Offer',
      'Profile',
    ];
    var bottomItemImages = [
      LineIcons.home,
      LineIcons.jediOrder,
      LineIcons.gift,
      LineIcons.user,
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
            icon: Icon(
              bottomItemImages[i],
              color: _event.value == i
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSecondary,
              size: offsetXMd,
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (kDebugMode) {
          print("-----\napp in resumed-------");
        }
        _enterApp();
        break;
      case AppLifecycleState.inactive:
        if (kDebugMode) {
          print("-----\napp in inactive-----");
        }
        _leaveApp();
        break;
      case AppLifecycleState.paused:
        if (kDebugMode) {
          print("-----\napp in paused-----");
        }
        _pauseApp();
        break;
      case AppLifecycleState.detached:
        if (kDebugMode) {
          print("-----\napp in detached-----");
        }
        break;
    }
  }

  void _enterApp() async {
    // initBadge();
  }

  void _leaveApp() async {
    // socketService!.leaveRoom(_currentUser);
  }

  void _pauseApp() async {
    // socketService!.leaveRoom(_currentUser);
  }
}
