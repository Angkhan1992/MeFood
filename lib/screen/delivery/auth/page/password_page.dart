import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:provider/provider.dart';

class PasswordPage extends StatefulWidget {
  final Function()? onDone;
  const PasswordPage({
    Key? key,
    this.onDone,
  }) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _passwordFormatters = [
    '· At least one uppercase character',
    '· At least one lowercase character',
    '· At least one number character',
    '· At least one special character',
    '· Should be over 8 characters',
  ];

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
            controller: _passwordController,
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
            controller: _repassController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffix: const Icon(LineIcons.eye),
          ),
          const SizedBox(
            height: 16.0,
          ),
          for (var alert in _passwordFormatters) ...{
            alert.wText(
              TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: _hasFormatter.isEmpty
                    ? null
                    : _hasFormatter[_passwordFormatters.indexOf(alert)]
                        ? Theme.of(context).colorScheme.secondary
                        : null,
              ),
            ),
          },
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Done'.toUpperCase(),
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
    var pass = _passwordController.text;
    var repass = _repassController.text;
    // if (!pass.validatePassword) {
    //   return;
    // }
    if (pass != repass) {
      return;
    }
    var provider = Provider.of<DeliveryUserProvider>(context, listen: false);

    isUpload = true;
    setState(() {});
    var resp = await APIService().post(
      APIService.kUrlAuth + '/regDeliveryPassword',
      {
        'usr_id': provider.user.user!.id,
        'password': pass.generateMD5,
      },
    );

    if (resp != null) {
      if (resp['ret'] == 10000) {
        widget.onDone!();
      } else {
        DialogService.of(context).showSnackBar(
          resp['msg'],
          type: SnackBarType.error,
        );
      }
    } else {
      DialogService.of(context).showSnackBar(
        'Failed Server Error',
        type: SnackBarType.error,
      );
    }

    isUpload = false;
    setState(() {});
  }
}
