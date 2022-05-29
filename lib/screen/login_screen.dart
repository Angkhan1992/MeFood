import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/screen/delivery/auth/pending_screen.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:provider/provider.dart';

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

  var _passVisible = true;
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
                          obscureText: _passVisible,
                          textInputAction: TextInputAction.done,
                          suffix: InkWell(
                            onTap: () => setState(() {
                              _passVisible = !_passVisible;
                            }),
                            child: Icon(
                              _passVisible
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                            ),
                          ),
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
                            LoginSocialButton(
                              icon: Icon(_socialIcons[0]),
                              isLoading: _event!.value == LoginEvent.google,
                              onTap: () => _googleLogin(),
                            ),
                            LoginSocialButton(
                              icon: Icon(_socialIcons[1]),
                              isLoading: _event!.value == LoginEvent.apple,
                              onTap: () => _appleLogin(),
                            ),
                            LoginSocialButton(
                              icon: Icon(_socialIcons[2]),
                              isLoading: _event!.value == LoginEvent.facebook,
                              onTap: () => _facebookLogin(),
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

    _formKey.currentState!.save();
    // if (_email!.validateEmail != null) {
    //   DialogService.of(context).showSnackBar(
    //     _email!.validateEmail!,
    //     type: SnackBarType.error,
    //   );
    //   return;
    // }
    // if (!_password!.validatePassword) {
    //   DialogService.of(context).showSnackBar(
    //     'Invalid Password Format',
    //     type: SnackBarType.error,
    //   );
    //   return;
    // }

    if (F.isDelivery) {
      _event!.value = LoginEvent.login;
      var resp = await APIService().post(
        APIService.kUrlAuth + '/loginDelivery',
        {
          'email': _email,
          'password': _password!.generateMD5,
        },
      );
      _event!.value = LoginEvent.none;

      if (resp != null) {
        if (resp['ret'] == 10000) {
          var provider = Provider.of<DeliveryUserProvider>(
            context,
            listen: false,
          );
          provider.setDeliveryUser(DriverModel.fromJson(resp['result']));
          if (provider.isEnabled()) {
            NavigatorService.of(context).push(screen: const LandingScreen());
          } else {
            NavigatorService.of(context).push(screen: const PendingScreen());
          }
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
    } else {}
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
