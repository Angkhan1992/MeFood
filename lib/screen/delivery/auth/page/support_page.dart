import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/service/service.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/widget/common/common.dart';

class AuthSupportPage extends StatefulWidget {
  const AuthSupportPage({Key? key}) : super(key: key);

  @override
  State<AuthSupportPage> createState() => _AuthSupportPageState();
}

class _AuthSupportPageState extends State<AuthSupportPage> {
  var _user = UserModel();

  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _user = Provider.of<DriverProvider>(context, listen: false).user.user ??
          UserModel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          S.current.contact_us.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          S.current.dsc_contact_us.wText(
            TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            lines: 2,
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.email_outlined),
            controller: TextEditingController(
              text: _user.email ?? '',
            ),
            hintText: S.current.email_user_id,
            keyboardType: TextInputType.emailAddress,
            readOnly: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.category),
            controller: TextEditingController(
              text: S.current.pending_account,
            ),
            hintText: S.current.category,
            readOnly: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextMemo(
            controller: _contentController,
            hintText: S.current.hint_report_desc,
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: S.current.submit,
            onTap: onSubmit,
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }

  void onSubmit() async {
    FocusScope.of(context).unfocus();

    var content = _contentController.text;
    if (content.isEmpty) {
      DialogService.of(context).showSnackBar(
        S.current.input_all_fields,
        type: SnackBarType.error,
      );
      return;
    }

    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlSupport}/pendingDelivery',
      {
        'usr_id': _user.id!,
        'email': _user.email!,
        'content': content,
      },
    );
    if (resp!['ret'] == 10000) {
      await Future.delayed(Duration(milliseconds: 500));
      await DialogService.of(context).showSuccessGif();
      Navigator.of(context).pop();
    }
  }
}
