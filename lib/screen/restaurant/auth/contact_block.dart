import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/provider/restaurant/restaurant_provider.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';
import 'package:provider/provider.dart';

class ContactBlock extends StatefulWidget {
  ContactBlock({Key? key}) : super(key: key);

  @override
  State<ContactBlock> createState() => _ContactBlockState();
}

class _ContactBlockState extends State<ContactBlock> {
  MemberModel? user;
  var content = '';

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
                                      CustomTextField(
                                        prefix: Icon(Icons.email_outlined),
                                        controller: TextEditingController(
                                          text: user!.email,
                                        ),
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      CustomTextField(
                                        prefix: Icon(Icons.category),
                                        controller: TextEditingController(
                                          text: S.current.cat_contact_01,
                                        ),
                                        suffix: Icon(Icons.arrow_drop_down),
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      CustomTextMemo(
                                        hintText: S.current.input_some_messages,
                                        onChanged: (value) => content = value,
                                      ),
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

  void submit() async {
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: S.current.input_all_fields);
      return;
    }
    var support = SupportModel();
    support.email = user!.email;
    support.category = S.current.cat_contact_01;
    support.type = user!.memberType;
    support.content = content;
    var err = await support.submit(
      context,
      userId: user!.id!,
    );
    if (err != null) {
      Fluttertoast.showToast(msg: err);
      return;
    }
    Navigator.of(context).pop();
  }
}
