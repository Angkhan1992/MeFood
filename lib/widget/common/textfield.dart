import 'package:flutter/material.dart';
import 'package:mefood/themes/textstyles.dart';

import '../../themes/dimens.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final bool obscureText;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.onSaved,
    this.validator,
    this.onSubmitted,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(offsetXSm),
        border: Border.all(
          width: 1.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(offsetXSm - 1),
                bottomLeft: Radius.circular(offsetXSm - 1),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: prefix,
            ),
          ),
          const SizedBox(
            width: offsetSm,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              obscureText: obscureText,
              readOnly: readOnly,
              cursorColor: Theme.of(context).colorScheme.secondary,
              style: CustomText.medium(fontSize: fontMd),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: CustomText.regular(fontSize: fontMd),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              onSaved: onSaved,
              validator: validator,
              onTap: onTap,
              onFieldSubmitted: onSubmitted,
            ),
          ),
          if (suffix != null) ...{
            const SizedBox(
              width: offsetSm,
            ),
            Container(
              width: 48.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(offsetXSm - 1),
                  bottomRight: Radius.circular(offsetXSm - 1),
                ),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Center(
                child: suffix,
              ),
            ),
          }
        ],
      ),
    );
  }
}
