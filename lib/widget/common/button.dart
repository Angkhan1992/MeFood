import 'package:flutter/material.dart';
import 'package:mefood/themes/theme.dart';

class CustomFillButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final bool isLoading;
  final Function()? onTap;

  const CustomFillButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: TextButton(
        onPressed: onTap,
        child: isLoading
            ? ProgressWidget(
                color: Theme.of(context).colorScheme.onSecondary,
              )
            : Text(
                title,
                style: CustomText.semiBold(
                  fontSize: fontMd,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
        style: TextButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

class ProgressWidget extends SizedBox {
  ProgressWidget({
    Key? key,
    double size = 18.0,
    double strokeWidth = 2.0,
    Color color = kPrimaryColor,
  }) : super(
          key: key,
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        );
}

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Color? borderColor;
  final bool isLoading;
  final Function()? onTap;

  const CustomOutlineButton({
    Key? key,
    required this.title,
    this.borderColor,
    this.isLoading = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: OutlinedButton(
        onPressed: onTap,
        child: isLoading
            ? ProgressWidget(
                color: Theme.of(context).colorScheme.secondary,
              )
            : Text(
                title,
                style: CustomText.semiBold(
                  fontSize: fontMd,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class LoginSocialButton extends StatelessWidget {
  final bool isLoading;
  final Icon icon;
  final Function()? onTap;

  const LoginSocialButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        width: 44.0,
        height: 44.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        alignment: Alignment.center,
        child: isLoading
            ? ProgressWidget(
                color: Theme.of(context).colorScheme.onSecondary,
              )
            : icon,
      ),
    );
  }
}
