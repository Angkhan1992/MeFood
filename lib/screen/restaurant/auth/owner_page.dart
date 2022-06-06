import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class OwnerPage extends StatefulWidget {
  final MemberModel? model;
  final Function()? onPrevious;
  final Function(MemberModel owner)? onNext;

  OwnerPage({
    Key? key,
    this.model,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  var owner = MemberModel();
  String pass = '', repass = '';

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      if (widget.model != null) {
        owner = widget.model!.copyWith();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                S.current.owner_info,
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
                  header: S.current.owner,
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
    var error = owner.hasFullData;
    if (error != null) {
      Fluttertoast.showToast(msg: error);
      return;
    }
    if (pass.isEmpty || pass != repass) {
      Fluttertoast.showToast(msg: S.current.no_match_pass);
      return;
    }
    if (widget.onNext != null) {
      widget.onNext!(owner);
    }
  }
}
