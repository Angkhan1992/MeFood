import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';

import 'customer/auth/register_screen.dart' as cs;
import 'delivery/auth/register_screen.dart' as dl;
import 'landing_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<LoginEvent>? _event;

  String? _email;
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _socialIcons = [
    LineIcons.googleLogo,
    LineIcons.apple,
    LineIcons.facebookF,
  ];

  @override
  void initState() {
    super.initState();

    _event = ValueNotifier(LoginEvent.none);
  }

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
        body: ValueListenableBuilder(
          valueListenable: _event!,
          builder: (context, value, widget) {
            return Padding(
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
                        const SizedBox(
                          height: 60.0,
                        ),
                        'Log in'.wTitle,
                        const SizedBox(
                          height: offsetLg,
                        ),
                        CustomTextField(
                          prefix: const Icon(LineIcons.user),
                          hintText: 'Email or User ID',
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (email) {
                            _email = email;
                          },
                        ),
                        const SizedBox(
                          height: offsetBase,
                        ),
                        CustomTextField(
                          prefix: const Icon(LineIcons.key),
                          hintText: 'Password',
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          suffix: const Icon(LineIcons.eye),
                          onSaved: (pass) {
                            _password = pass;
                          },
                          onSubmitted: (_) => _login(),
                        ),
                        const SizedBox(
                          height: offsetMd,
                        ),
                        CustomFillButton(
                          title: 'Log in'.toUpperCase(),
                          onTap: () => _login(),
                          isLoading: _event!.value == LoginEvent.login,
                        ),
                        const SizedBox(
                          height: offsetXLg,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () => _googleLogin(),
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                alignment: Alignment.center,
                                child: _event!.value == LoginEvent.google
                                    ? ProgressWidget(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      )
                                    : Icon(_socialIcons[0]),
                              ),
                            ),
                            InkWell(
                              onTap: () => _appleLogin(),
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                alignment: Alignment.center,
                                child: _event!.value == LoginEvent.apple
                                    ? ProgressWidget(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      )
                                    : Icon(_socialIcons[1]),
                              ),
                            ),
                            InkWell(
                              onTap: () => _facebookLogin(),
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                alignment: Alignment.center,
                                child: _event!.value == LoginEvent.facebook
                                    ? ProgressWidget(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      )
                                    : Icon(_socialIcons[2]),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: offsetXLg,
                        ),
                        if (!F.isDelivery)
                          CustomOutlineButton(
                            title: 'Login By Tour'.toUpperCase(),
                            onTap: () {},
                          ),
                        const Spacer(),
                        Row(
                          children: [
                            const Spacer(),
                            'If you have not account yet?'.wText(
                              CustomText.regular(fontSize: fontBase),
                            ),
                            const SizedBox(
                              width: offsetBase,
                            ),
                            InkWell(
                              onTap: () => _gotoRegister(),
                              child: 'Register'.wText(
                                CustomText.regular(fontSize: fontBase),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: offsetXMd,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _googleLogin() async {
    if (_event!.value != LoginEvent.none) {
      DialogService.of(context).kShowProcessingDialog();
      return;
    }
    _event!.value = LoginEvent.google;
    await Future.delayed(const Duration(seconds: 3));
    _event!.value = LoginEvent.none;
  }

  void _appleLogin() async {
    if (_event!.value != LoginEvent.none) {
      DialogService.of(context).kShowProcessingDialog();
      return;
    }
    _event!.value = LoginEvent.apple;
    await Future.delayed(const Duration(seconds: 3));
    _event!.value = LoginEvent.none;
  }

  void _facebookLogin() async {
    if (_event!.value != LoginEvent.none) {
      DialogService.of(context).kShowProcessingDialog();
      return;
    }
    _event!.value = LoginEvent.facebook;
    await Future.delayed(const Duration(seconds: 3));
    _event!.value = LoginEvent.none;
  }

  void _login() async {
    if (_event!.value != LoginEvent.none) {
      DialogService.of(context).kShowProcessingDialog();
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    _event!.value = LoginEvent.login;
    await Future.delayed(const Duration(seconds: 3));
    _event!.value = LoginEvent.none;

    NavigatorService.of(context).push(screen: const LandingScreen());
  }

  void _gotoRegister() {
    if (_event!.value != LoginEvent.none) {
      DialogService.of(context).kShowProcessingDialog();
      return;
    }
    NavigatorService.of(context).push(
      screen:
          F.isDelivery ? const dl.RegisterScreen() : const cs.RegisterScreen(),
    );
  }
}

enum LoginEvent {
  none,
  login,
  google,
  apple,
  facebook,
}
