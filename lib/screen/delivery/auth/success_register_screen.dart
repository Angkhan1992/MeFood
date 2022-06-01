import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/widget/common/common.dart';

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
              S.current.success.wTitle,
              const SizedBox(
                height: 32,
              ),
              S.current.register_to_delivery.wText(
                TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              S.current.review_48_desc.wText(
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
                title: S.current.confirm.toUpperCase(),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
