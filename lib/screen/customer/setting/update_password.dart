import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';

class UpdatePassword extends StatefulWidget {
  UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  var newPass = '', confirmPass = '';
  var passController = TextEditingController();
  var isNewSecuit = true, isConfirmSecuit = true;
  var validates = [false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    passController.addListener(() {
      newPass = passController.text;
      validates = newPass.validatePasswords;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(
        context,
        title: 'Update Password',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'After update password, you will go to login screen automatically.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 24.0),
            CustomTextField(
              prefix: Icon(Icons.key),
              controller: passController,
              hintText: 'New Password',
              obscureText: isNewSecuit,
              suffix: InkWell(
                onTap: () => setState(() {
                  isNewSecuit = !isNewSecuit;
                }),
                child: Icon(isNewSecuit ? Icons.lock : Icons.lock_open),
              ),
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              prefix: Icon(Icons.key),
              controller: TextEditingController(text: confirmPass),
              hintText: 'Confirm Password',
              obscureText: isConfirmSecuit,
              textInputAction: TextInputAction.done,
              suffix: InkWell(
                onTap: () => setState(() {
                  isConfirmSecuit = !isConfirmSecuit;
                }),
                child: Icon(isConfirmSecuit ? Icons.lock : Icons.lock_open),
              ),
              onChanged: (pass) => confirmPass = pass,
            ),
            const SizedBox(height: 16.0),
            for (var value in descPassRegx) ...{
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: validates[descPassRegx.indexOf(value)]
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              const SizedBox(height: 4.0),
            },
            const SizedBox(height: 40.0),
            CustomFillButton(
              title: 'Update Password',
              onTap: newPass.validatePassword ? onUpdate : null,
            ),
          ],
        ),
      ),
    );
  }

  void onUpdate() async {
    if (newPass.trim() == confirmPass.trim()) {
      var user = context.read<CustomerProvider>().customer!.user;
      var err = await user!.updatePassword(
        context,
        password: newPass.trim(),
      );
      if (err == null) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        DialogService.of(context).showSnackBar(
          err,
          type: SnackBarType.error,
        );
      }
      return;
    }
    DialogService.of(context).showSnackBar(
      'Not matched Password',
      type: SnackBarType.error,
    );
  }
}
