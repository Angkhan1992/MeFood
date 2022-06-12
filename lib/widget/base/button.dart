import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/themes/theme.dart';

class CustomFillButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final bool isLoading;
  final Function()? onTap;
  final bool isMenu;

  const CustomFillButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
    this.isMenu = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var opacity = onTap == null ? 0.5 : 1.0;
    return SizedBox(
      width: double.infinity,
      height: isMenu ? 40.0 : 48.0,
      child: TextButton(
        onPressed: onTap,
        child: isLoading
            ? ProgressWidget(
                color: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(opacity),
              )
            : Text(
                title,
                style: CustomText.semiBold(
                  fontSize: fontMd,
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(opacity),
                ),
              ),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(opacity),
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
    var opacity = onTap == null ? 0.5 : 1.0;
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: OutlinedButton(
        onPressed: onTap,
        child: isLoading
            ? ProgressWidget(
                color: borderColor ??
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(opacity),
              )
            : Text(
                title,
                style: CustomText.semiBold(
                  fontSize: fontMd,
                  color: borderColor ??
                      Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(opacity),
                ),
              ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.0,
            color: borderColor ??
                Theme.of(context).colorScheme.secondary.withOpacity(opacity),
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

class MainMenuButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function()? onTap;

  const MainMenuButton({
    Key? key,
    required this.title,
    this.isEnabled = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled) onTap!();
      },
      child: title.wText(
        TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: isEnabled
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).hintColor,
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final double size;
  final IconData iconData;
  final Color? color;
  final Function()? onTap;

  const ActionButton({
    Key? key,
    required this.iconData,
    this.size = 24.0,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = color ?? Theme.of(context).colorScheme.secondary;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: Icon(
            iconData,
            size: size / 3 * 2,
          ),
        ),
      ),
    );
  }
}
