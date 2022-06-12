import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/screen/customer/main/cart_screen.dart';
import 'package:mefood/screen/customer/main/home_screen.dart';
import 'package:mefood/screen/customer/main/order_screen.dart';
import 'package:mefood/screen/customer/main/setting_screen.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/themes/textstyle.dart';
import 'package:mefood/widget/base/base.dart';

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
      const MyCartScreen(),
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
      S.current.home,
      S.current.orders,
      'My Cart',
      S.current.settings,
    ];
    var bottomItemImages = [
      LineIcons.home,
      LineIcons.firstOrder,
      LineIcons.shoppingCart,
      Icons.settings_outlined,
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
