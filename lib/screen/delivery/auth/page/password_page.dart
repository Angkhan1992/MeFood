import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/util/extensions.dart';

import '../../../../widget/common/button.dart';
import '../../../../widget/common/textfield.dart';

class PasswordPage extends StatelessWidget {
  final Function()? onDone;
  const PasswordPage({
    Key? key,
    this.onDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          'Almost Done'.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          'You can add your account password on the curretn page.'.wText(
            TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.lock),
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffix: const Icon(LineIcons.eye),
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.lock),
            hintText: 'Confirm Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffix: const Icon(LineIcons.eye),
          ),
          const SizedBox(
            height: 16.0,
          ),
          '· At least one uppercase character'.wText(
            TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          '· At least one lowercase character'.wText(
            TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          '· At least one number character'.wText(
            TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          '· At least one special character'.wText(
            TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          '· Should be over 8 characters'.wText(
            TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Done'.toUpperCase(),
            onTap: onDone,
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
