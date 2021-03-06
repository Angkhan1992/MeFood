import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/screen/splash_screen.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';

Injector? injector;

class AppInitializer {
  initialise(Injector? injector) async {}
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  F.appFlavor = Flavor.customer;

  var customerProvider = CustomerProvider();
  var categoryProvider = CategoryProvider();
  var newProductProvider = NewProductProvider();
  var hotProductProvider = HotProductProvider();
  var restaurantProvider = RestaurantProvider();
  var orderProvider = OrderProvider();
  var mailProvider = MailProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => customerProvider),
        ChangeNotifierProvider(create: (context) => categoryProvider),
        ChangeNotifierProvider(create: (context) => orderProvider),
        ChangeNotifierProvider(create: (context) => newProductProvider),
        ChangeNotifierProvider(create: (context) => hotProductProvider),
        ChangeNotifierProvider(create: (context) => restaurantProvider),
        ChangeNotifierProvider(create: (context) => mailProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeFood',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      darkTheme: getDarkThemeData(),
      home: const SplashScreen(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }

  getThemeData() {
    return ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      shadowColor: kSecondaryColor,
      secondaryHeaderColor: kSecondaryColor,
      scaffoldBackgroundColor: kScaffoldColor,
      backgroundColor: kScaffoldColor,
      hintColor: kHintColor,
      focusColor: kAccentColor,
      textTheme: TextTheme(
        headline6: kTextBold,
        headline5: CustomText.bold(fontSize: fontMd),
        headline4: CustomText.bold(fontSize: fontXMd),
        headline3: CustomText.bold(fontSize: 20.0),
        headline2: CustomText.bold(fontSize: fontLg),
        headline1: CustomText.bold(fontSize: fontXLg),
        subtitle1: CustomText.semiBold(fontSize: fontMd),
        bodyText2: kTextMedium,
        bodyText1: CustomText.medium(fontSize: fontMd),
        caption: kTextRegular,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryColor),
        backgroundColor: kAccentColor,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: kHintColor,
        thickness: 0.5,
      ),
      iconTheme: const IconThemeData(
        color: kPrimaryColor,
        size: 24.0,
      ),
    );
  }

  getDarkThemeData() {
    return ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.dark,
      primaryColor: kPrimaryDarkColor,
      secondaryHeaderColor: kSecondaryDarkColor,
      scaffoldBackgroundColor: kScaffoldDarkColor,
      backgroundColor: kScaffoldDarkColor,
      shadowColor: kSecondaryDarkColor,
      hintColor: kHintDarkColor,
      focusColor: kAccentDarkColor,
      textTheme: TextTheme(
        headline6: kTextBold,
        headline5: CustomText.bold(fontSize: fontMd),
        headline4: CustomText.bold(fontSize: fontXMd),
        headline3: CustomText.bold(fontSize: 20.0),
        headline2: CustomText.bold(fontSize: fontLg),
        headline1: CustomText.bold(fontSize: fontXLg),
        subtitle1: CustomText.semiBold(fontSize: fontMd),
        bodyText2: kTextMedium,
        bodyText1: CustomText.medium(fontSize: fontMd),
        caption: kTextRegular,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryDarkColor),
        backgroundColor: kAccentDarkColor,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: kHintDarkColor,
        thickness: 0.5,
      ),
      iconTheme: const IconThemeData(
        color: kPrimaryDarkColor,
        size: 24.0,
      ),
    );
  }
}
