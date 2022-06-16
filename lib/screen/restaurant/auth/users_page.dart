import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class UsersPage extends StatefulWidget {
  final Function(
    MemberModel admin,
    MemberModel user,
    String adminPass,
    String userPass,
  )? onNext;
  final Function()? onPrevious;

  UsersPage({
    Key? key,
    this.onNext,
    this.onPrevious,
  }) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var admin = MemberModel();
  String adminPass = '', adminRepass = '';

  var user = MemberModel();
  String userPass = '', userRepass = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read<AuthProvider>();
    admin = provider.members.isNotEmpty ? provider.members[0] : MemberModel();
    user = provider.members.isNotEmpty ? provider.members[1] : MemberModel();
    return Padding(
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
                S.current.add_users,
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
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [kShadowContainer],
            ),
            child: Column(
              children: [
                MemberWidget(
                  model: admin,
                  header: S.current.admin,
                  onChangePass: (pass, repass) {
                    adminPass = pass;
                    adminRepass = repass;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                MemberWidget(
                  model: user,
                  header: S.current.user,
                  onChangePass: (pass, repass) {
                    userPass = pass;
                    userRepass = repass;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlineButton(
                        title: S.current.previous,
                        onTap: widget.onPrevious,
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      child: CustomFillButton(
                        title: S.current.next,
                        onTap: onNext,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onNext() {
    var errorAdmin = admin.hasFullData;
    if (errorAdmin != null) {
      Fluttertoast.showToast(msg: errorAdmin);
      return;
    }
    if (adminPass != adminRepass) {
      Fluttertoast.showToast(msg: S.current.no_match_pass);
      return;
    }
    var errorUser = user.hasFullData;
    if (errorUser != null) {
      Fluttertoast.showToast(msg: errorUser);
      return;
    }
    if (userPass != userRepass) {
      Fluttertoast.showToast(msg: S.current.no_match_pass);
      return;
    }
    if (widget.onNext != null) {
      widget.onNext!(admin, user, adminPass, userPass);
    }
  }
}
