import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/screen/customer/main/main_screen.dart' as cs;
import 'package:mefood/screen/delivery/main/main_screen.dart' as dl;
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _titles = [
    S.current.mefood,
    S.current.delivery,
    S.current.analysis,
  ];
  final _descs = [
    S.current.landing_desc_01,
    S.current.landing_desc_02,
    S.current.landing_desc_03,
  ];

  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return LandingWidget(
                title: _titles[index],
                desc: _descs[index],
                selected: index,
              );
            },
            onPageChanged: (page) {
              setState(() {
                selected = page;
              });
            },
            itemCount: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 200.0,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    await PrefService.of().passLanding();
                    NavigatorService.of(context).push(
                      screen: F.isDelivery
                          ? const dl.MainScreen()
                          : const cs.MainScreen(),
                      replace: true,
                    );
                  },
                  child: Container(
                    width: 90.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    alignment: Alignment.center,
                    child: '>>>'.wText(CustomText.semiBold(
                      fontSize: fontMd,
                      color: Theme.of(context).colorScheme.onSecondary,
                    )),
                  ),
                ),
                const Spacer(),
                for (var i = 0; i < 3; i++) ...{
                  Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: i == selected
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: i == selected
                            ? Colors.transparent
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: offsetSm,
                  ),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}
