import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/screen/restaurant/auth/basic_page.dart';
import 'package:mefood/screen/restaurant/auth/owner_page.dart';
import 'package:mefood/screen/restaurant/auth/success_page.dart';
import 'package:mefood/screen/restaurant/auth/users_page.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _stepperEvent = ValueNotifier(1);
  String ownerPass = '';

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        return Consumer<AuthProvider>(
          builder: (context, provider, child) {
            var pages = [
              BasicPage(
                model: provider.restaurant,
                onNext: (restaurant) {
                  logger.d(restaurant);
                  provider.setRestaurant(restaurant);
                  _stepperEvent.value = 2;
                },
              ),
              OwnerPage(
                model: provider.owner,
                onNext: (owner, pass) {
                  logger.d(owner);
                  provider.setOwner(owner);
                  ownerPass = pass;
                  _stepperEvent.value = 3;
                },
                onPrevious: () => _stepperEvent.value = 1,
              ),
              UsersPage(
                onNext: (admin, user, adminPass, userPass) async {
                  provider.addUsers(admin);
                  provider.addUsers(user);

                  var error = await provider.register(
                    context,
                    ownerPass: ownerPass,
                    adminPass: adminPass,
                    userPass: userPass,
                  );
                  if (error != null) {
                    Fluttertoast.showToast(msg: error);
                    return;
                  }
                  _stepperEvent.value = 4;
                },
                onPrevious: () => _stepperEvent.value = 2,
              ),
              SuccessPage(
                onConfirm: () => Navigator.pop(context),
              ),
            ];
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
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          S.current.login.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: ValueListenableBuilder<int>(
                      valueListenable: _stepperEvent,
                      builder: (context, v, w) {
                        return Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 1000.0),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 40.0),
                                  stepperView(v),
                                  pages[v - 1],
                                ],
                              ),
                            ),
                            footerView(),
                          ],
                        );
                      },
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

  Widget stepperView(int value) {
    var titles = [
      'Basic',
      S.current.owner,
      'Users',
      'Success',
    ];
    return Row(
      children: [
        const Spacer(),
        StepperWidget(
          number: 0,
          step: value,
          title: titles[0],
        ),
        for (var i = 1; i < 4; i++) ...{
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Divider(),
            ),
          ),
          StepperWidget(
            number: i,
            step: value,
            title: titles[i],
          ),
        },
        const Spacer(),
      ],
    );
  }

  Widget footerView() {
    return Column(
      children: [
        Divider(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          constraints: BoxConstraints(maxWidth: 1000.0),
          child: FooterView(),
        ),
      ],
    );
  }
}
