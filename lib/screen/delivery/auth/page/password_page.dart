import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/util/app_config.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/base/base.dart';

class PasswordPage extends StatefulWidget {
  final Function(String pass)? onDone;
  const PasswordPage({
    Key? key,
    this.onDone,
  }) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  List<bool> _hasFormatter = [false, false, false, false, false];
  final _passwordController = TextEditingController();
  final _repassController = TextEditingController();

  var isUpload = false;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        var pass = _passwordController.text;
        _hasFormatter = pass.validatePasswords;
        logger.d(_hasFormatter);
      });
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
          S.current.almost_done.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          S.current.reg_pwd_detail.wText(
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
            controller: _passwordController,
            hintText: S.current.password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffix: const Icon(LineIcons.eye),
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.lock),
            hintText: S.current.confirm_password,
            controller: _repassController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffix: const Icon(LineIcons.eye),
          ),
          const SizedBox(
            height: 16.0,
          ),
          for (var alert in descPassRegx) ...{
            alert.wText(
              TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: _hasFormatter.isEmpty
                    ? null
                    : _hasFormatter[descPassRegx.indexOf(alert)]
                        ? Theme.of(context).colorScheme.secondary
                        : null,
              ),
            ),
          },
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: S.current.done.toUpperCase(),
            onTap: () => onDone(),
            isLoading: isUpload,
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }

  void onDone() async {
    FocusScope.of(context).unfocus();

    var pass = _passwordController.text;
    var repass = _repassController.text;
    if (pass != repass) {
      return;
    }

    if (widget.onDone != null) {
      widget.onDone!(pass);
    }
  }
}
