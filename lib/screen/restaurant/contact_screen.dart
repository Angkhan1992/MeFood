import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/member_model.dart';
import 'package:mefood/provider/restaurant/restaurant_provider.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  MemberModel? user;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      var provider = Provider.of<RestaurantProvider>(context, listen: false);
      user = provider.user;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null
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
                            S.current.back.toUpperCase(),
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
                                    Text(
                                      S.current.pending_account,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                      ),
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
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Expanded(
                                            child: CustomFillButton(
                                              title: S.current.submit,
                                              onTap: submit,
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

  void submit() async {}
}
