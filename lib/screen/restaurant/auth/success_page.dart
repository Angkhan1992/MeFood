import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';

class SuccessPage extends StatefulWidget {
  final Function()? onConfirm;
  SuccessPage({
    Key? key,
    this.onConfirm,
  }) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Row(
            children: [
              const SizedBox(width: 24.0),
              Text(
                'Successfully Register',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 16.0),
            ],
          ),
          const SizedBox(height: 24.0),
          Container(
            padding: const EdgeInsets.all(80.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [kShadowContainer],
            ),
            child: Column(
              children: [
                Icon(
                  LineIcons.checkCircle,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 90.0,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                'Thanks for your register to MeFood Restaurant'.wText(
                  TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Thanks for your register to MeFood Restaurant.\nWe will review your account information in 48 hours. After reviewing,\nwe will notice that to you through email.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: CustomFillButton(
                        title: S.current.confirm.toUpperCase(),
                        onTap: widget.onConfirm,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
