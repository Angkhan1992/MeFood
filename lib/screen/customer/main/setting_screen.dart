import 'dart:async';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/screen/base/mail_screen.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/screen/customer/setting/about_screen.dart';
import 'package:mefood/screen/customer/setting/account_screen.dart';
import 'package:mefood/screen/customer/setting/contact_screen.dart';
import 'package:mefood/screen/customer/setting/order_history.dart';
import 'package:mefood/service/dialog_service.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/themes/theme.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();

    Timer.run(() => _initProvider());
  }

  void _initProvider() async {}

  @override
  Widget build(BuildContext context) {
    var user = context.read<CustomerProvider>().customer!.user;
    var items = [
      {
        'icon': LineIcons.user,
        'title': 'Account',
        'desc': 'You can change your profile information',
        'action': () => NavigatorService.of(context).push(
              screen: AccountScreen(),
            ),
      },
      {
        'icon': LineIcons.history,
        'title': 'Order History',
        'desc': 'You can check your order histories',
        'action': () {
          if (user == null) {
            DialogService.of(context).showSnackBar(
              'You should use the auth user for this feature',
              type: SnackBarType.info,
            );
            return;
          }
          NavigatorService.of(context).push(
            screen: OrderHistory(),
          );
        },
      },
      {
        'icon': Icons.email_outlined,
        'title': 'Inbox',
        'desc': 'You can check inbox mails of MeFood',
        'action': () {
          if (user == null) {
            DialogService.of(context).showSnackBar(
              'You should use the auth user for this feature',
              type: SnackBarType.info,
            );
            return;
          }
          NavigatorService.of(context).push(
            screen: MailScreen(user: user),
          );
        },
      },
      {
        'icon': LineIcons.bug,
        'title': 'Contact Us',
        'desc': 'You can report your issues in here',
        'action': () {
          if (user == null) {
            DialogService.of(context).showSnackBar(
              'You should use the auth user for this feature',
              type: SnackBarType.info,
            );
            return;
          }
          NavigatorService.of(context).push(
            screen: ContactScreen(),
          );
        },
      },
      {
        'icon': LineIcons.delicious,
        'title': 'About MeFood',
        'desc': 'You can check how to use MeFood',
        'action': () {
          if (user == null) {
            DialogService.of(context).showSnackBar(
              'You should use the auth user for this feature',
              type: SnackBarType.info,
            );
            return;
          }
          NavigatorService.of(context).push(
            screen: AboutScreen(),
          );
        },
      },
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: kToolbarHeight,
              bottom: offsetXMd,
              left: offsetXMd,
            ),
            alignment: Alignment.centerLeft,
            child: S.current.settings
                .colorTitle(Theme.of(context).colorScheme.onSecondary),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(offsetXLg),
                topRight: Radius.circular(offsetXLg),
              ),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: offsetBase,
                          vertical: offsetXMd,
                        ),
                        itemBuilder: (context, index) => Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: offsetSm),
                          child: InkWell(
                            onTap: (items[index]['action'] as Function()),
                            child: Row(
                              children: [
                                Icon(
                                  (items[index]['icon'] as IconData),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 28.0,
                                ),
                                const SizedBox(width: offsetBase),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (items[index]['title'] as String),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        (items[index]['desc'] as String),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: offsetSm),
                                Icon(
                                  Icons.arrow_right,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 36.0),
                          child: Divider(),
                        ),
                        itemCount: items.length,
                      ),
                    ),
                    '© 2020 - 2022   KYGABYTE IT SOLUTION Inc.'.wText(
                      TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(height: offsetBase),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
