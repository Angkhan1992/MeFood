import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/service/dialog_service.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/service/router_service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/restraurant/layout_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 48.0,
                    height: 48.0,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  S.current.mefood.wTitle,
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: 600.0,
                  maxWidth: 1000.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [kShadowContainer],
                ),
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Welcome to\nMeFood Restaurant',
                                          style: TextStyle(
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 40.0,
                                        ),
                                        Text(
                                          'This website is one for Restaurant owner.\nThe restrauant owner can add his products and \nselling, tracking via our MeFood service',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'If you have not account yet?',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    InkWell(
                                      onTap: () => NavigatorService.of(context)
                                          .pushByRoute(
                                        routeName: RouterService.routeRegister,
                                      ),
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Privacy and Policy',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w200,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 40.0,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Restaurant Login',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        prefix: Icon(Icons.email_outlined),
                                        hintText: S.current.email_user_id,
                                        onSaved: (value) {
                                          if (value != null) {
                                            email = value;
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      CustomTextField(
                                        prefix: Icon(Icons.lock),
                                        hintText: S.current.password,
                                        suffix: InkWell(
                                          child: Icon(
                                            isObscure
                                                ? Icons.remove_red_eye
                                                : Icons.remove_red_eye_outlined,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              isObscure = !isObscure;
                                            });
                                          },
                                        ),
                                        obscureText: isObscure,
                                        onSaved: (value) {
                                          if (value != null) {
                                            password = value;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          const SizedBox(
                                            width: 16.0,
                                          ),
                                          Text(
                                            'Remember Password',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CustomFillButton(
                                  title: 'Login to MeFood',
                                  onTap: onLogin,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onLogin() async {
    formKey.currentState!.save();
    if (email.isEmpty || password.isEmpty) {
      DialogService.of(context).showSnackBar(
        S.current.input_all_fields,
        type: SnackBarType.error,
      );
      return;
    }
  }
}
