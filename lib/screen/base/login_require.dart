import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/widget/base/button.dart';

class LoginRequire extends StatelessWidget {
  const LoginRequire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/ic_empty.svg',
            width: 75.0,
            height: 75.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 40.0,
          ),
          'You need to login for this page.'.wText(
            TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Go to Login',
            onTap: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
          ),
        ],
      ),
    );
  }
}
