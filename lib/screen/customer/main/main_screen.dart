import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/customer.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/screen/customer/main/main.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final _event = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    Timer.run(() async {
      try {
        var user = context.read<CustomerProvider>().customer!.user;
        if (user != null) {
          InjectService().initialise(Injector(), user);
          injector = Injector();
          await AppInitializer().initialise(injector!);
          socketService = SocketService.of(owner: user);

          socketService!.onCustomerReceiver(
            onCreateOrder: onCreateOrder,
          );
        } else {
          logger.e('Running with tour mode');
        }
      } catch (e) {
        logger.e(e);
      }
    });
  }

  void onCreateOrder(data) async {
    if (mounted) {
      DialogService.of(context).showSnackBar('Success create order');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      const HomeScreen(),
      const OrderScreen(),
      MyCartScreen(
        onCreateOrder: () => _event.value = 1,
      ),
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
    return Consumer<OrderProvider>(
      builder: (context, value, child) {
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
                badge: i == 1
                    ? value.orders!.length
                    : i == 2
                        ? value.products!.length
                        : 0,
              ),
          ],
        );
      },
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
