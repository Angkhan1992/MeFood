import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mefood/provider/flavor_provider.dart';
import 'package:mefood/provider/navigator_provider.dart';
import 'package:mefood/screen/login_screen.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/themes/textstyles.dart';

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
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            const SizedBox(
              height: offsetXMd,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'MeFood',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
                F.isDelivery
                    ? ColorizeAnimatedText(
                        'DELIVERY MAN',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                        speed: const Duration(milliseconds: 500),
                      )
                    : ColorizeAnimatedText(
                        'FOR CUSTOMERS',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                        speed: const Duration(milliseconds: 500),
                      ),
              ],
              totalRepeatCount: 1,
              onFinished: () {
                if (kDebugMode) {
                  print('[Animation] onFinished event');
                }
                NavigatorProvider.of(context).push(screen: const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
