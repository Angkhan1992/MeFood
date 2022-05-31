import 'dart:async';

import 'package:flutter/material.dart';
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
          'Contact Us'.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          'You can send some information to MEFOOD. We will reply in 48hrs. Thanks for your contact.'
              .wText(
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
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            readOnly: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.category),
            controller: TextEditingController(
              text: 'Pending Account',
            ),
            hintText: 'Category',
            readOnly: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextMemo(
            controller: _contentController,
            hintText: 'Submit your problems',
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Submit',
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
    var content = _contentController.text;
    if (content.isEmpty) {
      DialogService.of(context).showSnackBar(
        'Please input some messages',
        type: SnackBarType.error,
      );
      return;
    }
    FocusScope.of(context).unfocus();
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
