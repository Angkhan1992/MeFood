import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/customer/customer.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var customer = CustomerModel();
  var pass = '', repass = '';
  var hidePass = true, hideRepass = true;

  @override
  void initState() {
    super.initState();

    customer.user = MemberModel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: offsetBase),
          child: Stack(
            children: [
              SafeArea(
                child: Opacity(
                  child: SvgPicture.asset('assets/images/background.svg'),
                  opacity: 0.1,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: offsetBase),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            LineIcons.arrowLeft,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(
                          width: offsetXMd,
                        ),
                        S.current.register.wTitle,
                      ],
                    ),
                    const SizedBox(height: offsetLg),
                    Stack(
                      children: [
                        CircleAvatarNetwork(
                          avatar: '$kDomain${customer.user!.linkAvatar}',
                          borderColor: Theme.of(context).colorScheme.secondary,
                          size: 90.0,
                        ),
                        Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: InkWell(
                            onTap: () async {
                              var uri =
                                  await ImagePickerService.of(context).picker();
                              if (uri != null) {
                                var resp = await APIService.of(context).upload(
                                  path: 'avatar',
                                  filePath: uri,
                                );
                                if (resp != null) {
                                  if (resp['ret'] == 10000) {
                                    var imageUrl =
                                        '$kUrlAvatar${resp['result']}';
                                    setState(() {
                                      customer.user!.linkAvatar = imageUrl;
                                    });
                                  }
                                }
                              }
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.edit,
                                  size: 18.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: offsetLg),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
                      hintText: S.current.first_name,
                      onChanged: (name) => customer.user!.firstName = name,
                    ),
                    const SizedBox(height: offsetBase),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
                      hintText: S.current.last_name,
                      onChanged: (name) => customer.user!.lastName = name,
                    ),
                    const SizedBox(height: offsetBase),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
                      hintText: S.current.email_user_id,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => customer.user!.email = value,
                    ),
                    const SizedBox(height: offsetBase),
                    CustomTextField(
                      prefix: const Icon(LineIcons.phone),
                      hintText: S.current.phone_number,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => customer.user!.phone = value,
                    ),
                    const SizedBox(height: offsetBase),
                    CustomTextField(
                      prefix: const Icon(LineIcons.key),
                      hintText: S.current.password,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                        child: Icon(
                          (hidePass
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                        ),
                      ),
                      onChanged: (value) => pass = value,
                    ),
                    const SizedBox(height: offsetBase),
                    CustomTextField(
                      prefix: const Icon(LineIcons.key),
                      hintText: S.current.confirm_password,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            hideRepass = !hideRepass;
                          });
                        },
                        child: Icon(
                          (hideRepass
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                        ),
                      ),
                      onChanged: (value) => repass = value,
                    ),
                    const SizedBox(height: offsetLg),
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
    FocusScope.of(context).unfocus();
    if (pass.isEmpty || pass != repass) {
      DialogService.of(context).showSnackBar(
        'Invalied password!.',
        type: SnackBarType.error,
      );
      return;
    }
    var err = await customer.register(context, pass: pass);
    if (err != null) {
      DialogService.of(context).showSnackBar(
        err,
        type: SnackBarType.error,
      );
    } else {
      Navigator.of(context).pop(true);
    }
  }
}
