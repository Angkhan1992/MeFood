import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/restaurant/restaurant_provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';
import 'package:provider/provider.dart';

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
  var type = '';

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
                  Image.asset(
                    'assets/images/web/logo.png',
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
                                        controller: TextEditingController(
                                          text: email,
                                        ),
                                        prefix: Icon(Icons.email_outlined),
                                        hintText: S.current.email_user_id,
                                        onChanged: (value) => email = value,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      CustomTextField(
                                        controller: TextEditingController(
                                          text: password,
                                        ),
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
                                        onChanged: (value) => password = value,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      CustomTextField(
                                        controller: TextEditingController(
                                          text: type,
                                        ),
                                        prefix: Icon(Icons.category_sharp),
                                        suffix: Icon(Icons.arrow_drop_down),
                                        hintText: S.current.category,
                                        readOnly: true,
                                        onTap: () async {
                                          var result =
                                              await DialogService.of(context)
                                                  .showDesktopChooserDialog(
                                            title: S.current.choose_category,
                                            values: RESTTYPE.values
                                                .map((e) => e.valueString)
                                                .toList(),
                                          );
                                          if (result != null) {
                                            setState(() {
                                              type = result;
                                            });
                                          }
                                        },
                                        onChanged: (value) => type = value,
                                      ),
                                    ],
                                  ),
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
    if (email.isEmpty || password.isEmpty || type.isEmpty) {
      DialogService.of(context).showSnackBar(
        S.current.input_all_fields,
        type: SnackBarType.error,
      );
      return;
    }
    var provider = Provider.of<RestaurantProvider>(context, listen: false);
    var error = await provider.login(
      context,
      email: email,
      pass: password,
      type: type,
    );
    if (error != null) {
      Fluttertoast.showToast(msg: error);
      return;
    }
    if (provider.user != null) {
      if (provider.user!.deleted == 1) {
        NavigatorService.of(context).pushByRoute(
          routeName: RouterService.routeBlock,
        );
      } else if (provider.user!.enabled == 0) {
        NavigatorService.of(context).pushByRoute(
          routeName: RouterService.routePending,
        );
      } else {
        NavigatorService.of(context).pushByRoute(
          routeName: RouterService.routeHome,
        );
      }
    } else {
      Fluttertoast.showToast(msg: S.current.sever_error);
    }
  }
}
