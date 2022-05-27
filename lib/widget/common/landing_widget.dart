import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/themes/theme.dart';

class LandingWidget extends StatelessWidget {
  final String title;
  final String desc;
  final int selected;
  final Function()? onTap;

  const LandingWidget({
    Key? key,
    required this.title,
    required this.desc,
    this.selected = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: offsetBase),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title.wTitle,
              const SizedBox(
                height: offsetBase,
              ),
              desc.wText(
                CustomText.regular(
                  fontSize: fontMd,
                ),
              ),
              const SizedBox(
                height: offsetLg,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      width: 90.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      alignment: Alignment.center,
                      child: '>>>'.wText(CustomText.semiBold(
                        fontSize: fontMd,
                        color: Theme.of(context).colorScheme.onSecondary,
                      )),
                    ),
                  ),
                  const Spacer(),
                  for (var i = 0; i < 3; i++) ...{
                    Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: i == selected
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: i == selected
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: offsetSm,
                    ),
                  }
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: offsetLg,
        ),
        Expanded(
          child: ClipPath(
            clipper: LandingClipper(),
            child: Container(
              padding: const EdgeInsets.only(
                left: offsetXMd,
                right: offsetXMd,
                bottom: offsetXMd,
              ),
              color: Theme.of(context).colorScheme.secondary,
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/images/landing_0${selected + 1}.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Path landingPath({
  required Size size,
}) {
  var path = Path();
  path.moveTo(0, size.height * 0.15);
  path.lineTo(0, size.height);
  path.lineTo(size.width, size.height);
  path.lineTo(size.width, size.height * 0.3);
  path.quadraticBezierTo(size.width * 0.3, 0, 0, size.height * 0.15);

  path.close();

  return path;
}

class LandingClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = landingPath(size: size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
