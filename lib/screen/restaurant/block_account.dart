import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/service/router_service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class BlockAccount extends StatefulWidget {
  BlockAccount({Key? key}) : super(key: key);

  @override
  State<BlockAccount> createState() => _BlockAccountState();
}

class _BlockAccountState extends State<BlockAccount> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
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
                              Text(
                                S.current.blocked_account,
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
                                Icon(
                                  Icons.no_accounts_outlined,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 90.0,
                                ),
                                const SizedBox(
                                  width: double.infinity,
                                  height: 40.0,
                                ),
                                'Your account was blocked'.wText(
                                  TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Text(
                                  S.current.blc_reason_01,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  S.current.blc_reason_02,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  S.current.blc_reason_03,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 80.0,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      child: CustomFillButton(
                                        title:
                                            S.current.contact_us.toUpperCase(),
                                        onTap: () =>
                                            NavigatorService.of(context)
                                                .pushByRoute(
                                          routeName:
                                              RouterService.routeContactBlock,
                                          replace: true,
                                        ),
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
}
