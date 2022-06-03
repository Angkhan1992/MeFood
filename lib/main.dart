import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mefood/provider/restaurant/rest_auth_provider.dart';
import 'package:mefood/service/router_service.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/constants.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

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

  InjectService().initialise(Injector());
  injector = Injector();
  await AppInitializer().initialise(injector!);

  F.appFlavor = Flavor.delivery;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RestaurantAuthProvider()),
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
      initialRoute: RouterService.routeLogin,
      routes: RouterService.getRoutes(),
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
        iconTheme: IconThemeData(color: kAccentColor),
        backgroundColor: kPrimaryColor,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          color: kSecondaryColor,
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
        iconTheme: IconThemeData(color: kAccentDarkColor),
        backgroundColor: kPrimaryDarkColor,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          color: kSecondaryDarkColor,
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
