import 'package:flutter/material.dart';
import 'package:mefood/provider/navigator_provider.dart';
import 'package:mefood/screen/customer/main/main_screen.dart' as cs;
import 'package:mefood/screen/delivery/main/main_screen.dart' as dl;
import 'package:mefood/widget/common/landing_widget.dart';

import '../provider/flavor_provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _titles = [
    'MeFood',
    'Delivery',
    'Analysis',
  ];
  final _descs = [
    'Welcome to Customer of MeFood. You can get a good food and delivery service from MeFood.',
    'Fast and All Time Delivery. You can get your time in time. 24/7 Service.',
    'Good Analysis System, You can check your order analysis result though chart.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return LandingWidget(
            title: _titles[index],
            desc: _descs[index],
            selected: index,
            onTap: () => NavigatorProvider.of(context).push(
              screen:
                  F.isDelivery ? const dl.MainScreen() : const cs.MainScreen(),
              replace: true,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
