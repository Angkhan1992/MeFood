import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/base/base.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _password;
  String? _repass;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: offsetBase),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  child: SvgPicture.asset('assets/images/background.svg'),
                  opacity: 0.1,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: offsetSm),
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(offsetXSm),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          LineIcons.arrowLeft,
                        ),
                      ),
                    ),
                    S.current.register.wTitle,
                    const SizedBox(
                      height: offsetLg,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
                      hintText: S.current.first_name,
                      onSaved: (name) {
                        _firstName = name;
                      },
                    ),
                    const SizedBox(
                      height: offsetBase,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
                      hintText: S.current.last_name,
                      onSaved: (name) {
                        _lastName = name;
                      },
                    ),
                    const SizedBox(
                      height: offsetBase,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
                      hintText: S.current.email_user_id,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) {
                        _email = email;
                      },
                    ),
                    const SizedBox(
                      height: offsetBase,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.phone),
                      hintText: S.current.phone_number,
                      keyboardType: TextInputType.phone,
                      onSaved: (phone) {
                        _phone = phone;
                      },
                    ),
                    const SizedBox(
                      height: offsetBase,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.key),
                      hintText: S.current.password,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      suffix: const Icon(LineIcons.eye),
                      onSaved: (pass) {
                        _password = pass;
                      },
                    ),
                    const SizedBox(
                      height: offsetBase,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.key),
                      hintText: S.current.confirm_password,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      suffix: const Icon(LineIcons.eye),
                      onSaved: (pass) {
                        _repass = pass;
                      },
                    ),
                    const Spacer(),
                    CustomFillButton(
                      title: S.current.register.toUpperCase(),
                      onTap: () => _register(),
                    ),
                    const SizedBox(
                      height: offsetXMd,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    var resp = {
      'first': _firstName,
      'last': _lastName,
      'email': _email,
      'phone': _phone,
      'pass': _password,
      'repass': _repass,
    };
    logger.d(resp);
  }
}
