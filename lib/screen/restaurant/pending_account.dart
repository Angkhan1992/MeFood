import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class PendingAccount extends StatefulWidget {
  PendingAccount({Key? key}) : super(key: key);

  @override
  State<PendingAccount> createState() => _PendingAccountState();
}

class _PendingAccountState extends State<PendingAccount> {
  RestaurantProvider? provider;
  String pass = '', repass = '';

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      provider = Provider.of<RestaurantProvider>(context, listen: false);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return provider == null
        ? Container()
        : CustomLayout(
            builder: (context, app) {
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
                            S.current.login_to_others.toUpperCase(),
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
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 1000.0),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 24.0),
                                Row(
                                  children: [
                                    const SizedBox(width: 24.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.current.pending_account,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          S.current.pending_48_desc,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const SizedBox(width: 16.0),
                                  ],
                                ),
                                const SizedBox(height: 24.0),
                                Container(
                                  padding: const EdgeInsets.all(40.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: [kShadowContainer],
                                  ),
                                  child: Column(
                                    children: [
                                      MemberWidget(
                                        model: provider!.user,
                                        header: provider!.user!.memberType!
                                            .replaceAll('REST', '')
                                            .firstUppercase,
                                        onChangePass: (pass, repass) {
                                          this.pass = pass;
                                          this.repass = repass;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Expanded(
                                            child: CustomFillButton(
                                              title: S.current.update,
                                              onTap: update,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            constraints: BoxConstraints(maxWidth: 1000.0),
                            child: FooterView(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
  }

  void update() async {
    if (provider!.user!.hasFullData != null) {
      Fluttertoast.showToast(msg: provider!.user!.hasFullData!);
      return;
    }
    if (pass.isNotEmpty || repass.isNotEmpty) {
      if (pass != repass) {
        Fluttertoast.showToast(msg: S.current.no_match_pass);
        return;
      }
    }
    var err = await provider!.user!.update(
      context,
      password: pass.isEmpty ? null : pass,
    );
    if (err != null) {
      Fluttertoast.showToast(msg: err);
      return;
    }
    Fluttertoast.showToast(msg: S.current.success_user_updated);
  }
}
