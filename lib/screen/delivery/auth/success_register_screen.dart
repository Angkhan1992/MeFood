import 'package:flutter/material.dart';
import 'package:mefood/extensions/e_string.dart';

import '../../../widget/common/button.dart';

class SuccessRegisterScreen extends StatefulWidget {
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  State<SuccessRegisterScreen> createState() => _SuccessRegisterScreenState();
}

class _SuccessRegisterScreenState extends State<SuccessRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 90.0,
                color: Colors.green,
              ),
              const SizedBox(
                height: 32,
              ),
              'Success'.wTitle,
              const SizedBox(
                height: 32,
              ),
              'You registered by Delivery User'.wText(
                TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              'We will review your information and will be approve or reply using email in 48 hs. After approved, you can use MeFood service.\nThanks, KYGABYTE IT LTD.'
                  .wText(
                TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                lines: 4,
                centerLine: true,
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomFillButton(
                title: 'Confirm'.toUpperCase(),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
