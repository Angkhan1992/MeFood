import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/screen/delivery/auth/page/address_page.dart';
import 'package:mefood/screen/delivery/auth/page/car_page.dart';
import 'package:mefood/screen/delivery/auth/page/user_page.dart';
import 'package:mefood/util/extensions.dart';
import '../../../provider/delivery/user_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _pageIndex = ValueNotifier(0);
  DeliveryUserProvider? _provider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      AddProfilePage(
        onNext: (user) {
          if (_provider != null) {
            _provider!.setUser(user);
            _pageIndex.value = 1;
          }
        },
      ),
      AddAddressPage(
        onNext: () => _pageIndex.value = 2,
      ),
      AddCarPage(
        onNext: () => _pageIndex.value = 3,
      ),
    ];
    return Consumer<DeliveryUserProvider>(
      builder: (context, value, child) {
        _provider = Provider.of<DeliveryUserProvider>(context, listen: false);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Container(
                  height: 60.0,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        LineIcon(
                          LineIcons.arrowLeft,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        'Go To Login'.wText(
                          TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    'Register'.wTitle,
                    const Spacer(),
                  ],
                ),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _pageIndex,
                    builder: (context, value, view) {
                      return Column(
                        children: [
                          _pageIndexWidget(value),
                          Expanded(child: screens[value]),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _pageIndexWidget(int value) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _badgeWidget(0, value),
          _lineWidget(),
          _badgeWidget(1, value),
          _lineWidget(),
          _badgeWidget(2, value),
          _lineWidget(),
          _badgeWidget(3, value),
          _lineWidget(),
          _badgeWidget(4, value),
        ],
      ),
    );
  }

  Widget _badgeWidget(int index, int value) {
    var badgeSize = 28.0;
    return Container(
      width: badgeSize,
      height: badgeSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        color: index == value
            ? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
      ),
      alignment: Alignment.center,
      child: '${index + 1}'.wText(
        TextStyle(
          fontSize: 16.0,
          color: index != value
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  Widget _lineWidget() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        height: 1,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
