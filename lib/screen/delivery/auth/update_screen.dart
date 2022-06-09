import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/provider/delivery/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:mefood/screen/delivery/auth/page/page.dart';
import 'package:mefood/screen/delivery/auth/page/securit_page.dart';
import 'package:mefood/screen/delivery/auth/page/support_page.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  const UpdateScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: offsetBase,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(offsetBase),
                child: [
                  AddProfilePage(
                    isLogin: true,
                    onNext: (user) {
                      value.setUser(user);
                      onUpdateSuccess();
                    },
                  ),
                  AddAddressPage(
                    isLogin: true,
                    onNext: (address) {
                      value.setAddress(address);
                      onUpdateSuccess();
                    },
                  ),
                  AddCarPage(
                    isLogin: true,
                    onNext: (car) {
                      value.setCar(car);
                      onUpdateSuccess();
                    },
                  ),
                  SecuritPage(
                    onNext: (p0, p1) {
                      value.setCar(p1);
                      value.setUser(p0);
                      onUpdateSuccess();
                    },
                  ),
                  AuthSupportPage(),
                ][widget.index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onUpdateSuccess() async {
    await Future.delayed(Duration(milliseconds: 500));
    await DialogService.of(context).showSuccessGif();
    Navigator.of(context).pop();
  }
}
