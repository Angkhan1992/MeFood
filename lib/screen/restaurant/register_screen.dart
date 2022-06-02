import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/restaurant/rest_auth_provider.dart';
import 'package:mefood/screen/delivery/auth/page/securit_page.dart';
import 'package:mefood/screen/restaurant/auth/basic_page.dart';
import 'package:mefood/screen/restaurant/auth/owner_page.dart';
import 'package:mefood/screen/restaurant/auth/success_page.dart';
import 'package:mefood/screen/restaurant/auth/users_page.dart';
import 'package:mefood/widget/restraurant/layout_builder.dart';
import 'package:mefood/widget/restraurant/register_widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _stepperEvent = ValueNotifier(1);

  var titles = [
    'Basic',
    'Owner',
    'Users',
    'Secuit',
    'Success',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        return Consumer<RestaurantAuthProvider>(
          builder: (context, provider, child) {
            var pages = [
              BasicPage(
                onNext: (restaurant) => provider.setRestaurant(restaurant),
              ),
              OwnerPage(),
              UsersPage(),
              SecuritPage(),
              SuccessPage(),
            ];
            return Column(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 1000.0),
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  height: 56.0,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 36.0,
                        height: 36.0,
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      S.current.mefood.wToolbar,
                      const Spacer(),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Login'.toUpperCase(),
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
    return Row(
      children: [
        const Spacer(),
        StepperWidget(
          number: 0,
          step: value,
          title: titles[0],
        ),
        for (var i = 1; i < 5; i++) ...{
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
          constraints: BoxConstraints(maxWidth: 1000.0),
          height: 300,
        ),
      ],
    );
  }
}
