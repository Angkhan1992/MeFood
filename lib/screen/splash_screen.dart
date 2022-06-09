import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  var colorizeTextStyle = CustomText.bold(fontSize: 40.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 150,
            ),
            const SizedBox(
              height: offsetXMd,
            ),
            AnimatedTextKit(
              animatedTexts: [
                F.isDelivery
                    ? ColorizeAnimatedText(
                        S.current.delivery_man,
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                        speed: const Duration(milliseconds: 500),
                      )
                    : F.isCustomer
                        ? ColorizeAnimatedText(
                            S.current.for_customer,
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                            speed: const Duration(milliseconds: 500),
                          )
                        : ColorizeAnimatedText(
                            'MeFood Restaurant',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                            speed: const Duration(milliseconds: 500),
                          ),
              ],
              totalRepeatCount: 1,
              onFinished: () async {
                if (F.isRestaurant) {
                  var provider =
                      Provider.of<RestaurantProvider>(context, listen: false);
                  var err = await provider.loginToken();
                  if (err == null) {
                    NavigatorService.of(context).pushByRoute(
                      routeName: RouterService.routeHome,
                    );
                  } else {
                    NavigatorService.of(context).pushByRoute(
                      routeName: RouterService.routeLogin,
                    );
                  }
                } else {
                  NavigatorService.of(context)
                      .push(screen: const LoginScreen());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
