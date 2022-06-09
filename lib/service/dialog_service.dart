import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/colors.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/themes/textstyle.dart';
import 'package:mefood/util/config.dart';
import 'package:mefood/widget/base/base.dart';

class DialogService {
  final BuildContext context;

  DialogService(this.context);

  factory DialogService.of(BuildContext context) {
    return DialogService(context);
  }

  Future<dynamic> bubbleDialog({
    required Widget child,
    required List<Widget> actions,
    String iconUrl = 'assets/images/svg.png',
    double iconBorderWidth = 2.0,
    EdgeInsets childPadding = const EdgeInsets.all(offsetXMd),
    Color background = Colors.white,
    double borderRadius = offsetBase,
    Color borderColor = kAccentColor,
    double borderWidth = 2.0,
    double bubbleSize = 80.0,
    double sigmaSize = 5.0,
    bool isCancelable = false,
  }) async {
    return await showDialog<dynamic>(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () {
          if (isCancelable) Navigator.of(context).pop();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigmaSize, sigmaY: sigmaSize),
            child: Padding(
              padding: const EdgeInsets.all(offsetBase),
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: bubbleSize / 2),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(borderRadius)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: background,
                            borderRadius:
                                BorderRadius.all(Radius.circular(borderRadius)),
                            border: Border.all(
                              color: borderColor,
                              width: borderWidth,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: offsetLg),
                              Padding(
                                padding: childPadding,
                                child: child,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: offsetBase),
                                child: Row(
                                  children: [
                                    for (var action in actions)
                                      Expanded(child: action),
                                  ],
                                ),
                              ),
                              const SizedBox(height: offsetSm),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          width: bubbleSize,
                          height: bubbleSize,
                          decoration: BoxDecoration(
                            color: background,
                            border: Border.all(
                              color: borderColor,
                              width: iconBorderWidth,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(bubbleSize / 2.0),
                            child: SvgPicture.asset(iconUrl),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(
    String content, {
    SnackBarType type = SnackBarType.success,
  }) async {
    var backgroundColor = Colors.white;
    var icons = LineIcons.check;
    var title = S.current.success;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        icons = Icons.check_circle_outline;
        title = S.current.success;
        break;
      case SnackBarType.waring:
        backgroundColor = Colors.orange;
        icons = Icons.warning_amber_outlined;
        title = S.current.waring;
        break;
      case SnackBarType.info:
        backgroundColor = Colors.blueGrey;
        icons = Icons.info_outline;
        title = S.current.information;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red;
        icons = Icons.cancel_outlined;
        title = S.current.error;
        break;
    }
    if (Platform.isIOS || Platform.isAndroid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Stack(
            children: [
              Positioned(
                top: 3,
                left: 3,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [kPrimaryColor, backgroundColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    icons,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
              CustomPaint(
                painter: DialogBackPainter(),
                child: ClipPath(
                  clipper: DialogBackClipper(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(offsetBase),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [backgroundColor, kHintColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: offsetXLg),
                          child: Text(
                            title,
                            style: CustomText.bold(
                              fontSize: fontXMd,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: offsetSm),
                        Text(
                          content,
                          style: CustomText.medium(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: const Duration(milliseconds: 3000),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Spacer(),
              Container(
                width: 400,
                padding: const EdgeInsets.all(offsetBase),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: backgroundColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomText.bold(
                        fontSize: fontXMd,
                      ),
                    ),
                    const SizedBox(height: offsetSm),
                    Text(
                      content,
                      style: CustomText.medium(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: const Duration(milliseconds: 3000),
        ),
      );
    }
  }

  void showBottomSheet(Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(offsetBase),
          topLeft: Radius.circular(offsetBase),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXSm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NorchWidget(
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              height: 16.0,
            ),
            child,
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  void kShowProcessingDialog() {
    showSnackBar(
      S.current.processing_now,
      type: SnackBarType.waring,
    );
  }

  Future<void> showSuccessGif() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: GifView.asset(
            'assets/gifs/success.gif',
            width: 150.0,
            height: 150.0,
            fit: BoxFit.cover,
            onFinish: () => Navigator.of(context).pop(),
            frameRate: 24,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
      ),
    );
  }

  Future<void> showProgressLoading() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: Theme.of(context).colorScheme.secondary,
            size: 48.0,
          ),
        ),
      ),
    );
  }

  Future<String?> oneValueField({
    String? title,
    String? hintText,
    required Widget prefix,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    String? initValue,
    String cancalText = 'Cancel',
    String okText = 'Done',
  }) async {
    var controller = TextEditingController(text: initValue);

    return showDialog<String?>(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...{
                      title.wText(TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      )),
                      const SizedBox(
                        height: 24.0,
                      ),
                    },
                    CustomTextField(
                      prefix: prefix,
                      hintText: hintText,
                      controller: controller,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomOutlineButton(
                            title: cancalText,
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomFillButton(
                            title: okText,
                            onTap: () => Navigator.of(context).pop(
                              controller.text,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<List<String>?> twoValueField({
    String? title,
    List<String>? hintText,
    required Widget prefix,
    TextInputType keyboardType = TextInputType.text,
    List<String>? initValue,
    String cancalText = 'Cancel',
    String okText = 'Done',
  }) async {
    var controller1 = TextEditingController(text: initValue![0]);
    var controller2 = TextEditingController(text: initValue[1]);
    return showDialog<List<String>?>(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...{
                      title.wText(TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      )),
                      const SizedBox(
                        height: 24.0,
                      ),
                    },
                    CustomTextField(
                      prefix: prefix,
                      hintText: hintText![0],
                      controller: controller1,
                      keyboardType: keyboardType,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomTextField(
                      prefix: prefix,
                      hintText: hintText[1],
                      controller: controller2,
                      keyboardType: keyboardType,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomOutlineButton(
                            title: cancalText,
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomFillButton(
                            title: okText,
                            onTap: () => Navigator.of(context).pop([
                              controller1.text,
                              controller2.text,
                            ]),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<LatLng?> locationPicker({
    String? title,
    List<double>? initPosition,
    String cancalText = 'Cancel',
    String okText = 'Done',
  }) async {
    final _controller = Completer();
    return showDialog<LatLng?>(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...{
                      title.wText(TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      )),
                      const SizedBox(
                        height: 24.0,
                      ),
                    },
                    AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                initPosition![0],
                                initPosition[1],
                              ),
                              zoom: CAMERA_ZOOM,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                          Center(
                            child: Icon(
                              Icons.my_location_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.75),
                              size: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomOutlineButton(
                            title: cancalText,
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: CustomFillButton(
                            title: okText,
                            onTap: () async {
                              final GoogleMapController controller =
                                  await _controller.future;
                              LatLngBounds visibleRegion =
                                  await controller.getVisibleRegion();
                              LatLng latlng = LatLng(
                                (visibleRegion.northeast.latitude +
                                        visibleRegion.southwest.latitude) /
                                    2,
                                (visibleRegion.northeast.longitude +
                                        visibleRegion.southwest.longitude) /
                                    2,
                              );
                              Navigator.of(context).pop(latlng);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String?> bottomChoose({
    String? title,
    String? initValue,
    required List<String> values,
  }) {
    return showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(offsetBase),
          topLeft: Radius.circular(offsetBase),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXSm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NorchWidget(
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              height: 16.0,
            ),
            if (title != null) ...{
              title.wText(
                TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
            },
            for (var value in values) ...{
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(value),
                  child: value.wText(TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
            },
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> countryPicker() async {
    var countries = await JsonService.readCountryFromJson();

    return showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(offsetBase),
          topLeft: Radius.circular(offsetBase),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXSm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NorchWidget(
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    'Choose Country'.wText(
                      TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    for (var country in countries) ...{
                      InkWell(
                        onTap: () => Navigator.of(context).pop(country.name),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: offsetSm),
                          child: '${country.name} (${country.code})'.wText(
                            TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    },
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> showDesktopChooserDialog({
    required String title,
    List<String>? values,
    bool isExpand = false,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 400.0,
              ),
              width: 500.0,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  title.wText(TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 8.0,
                  ),
                  for (var value in values!) ...{
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(value),
                        child: value.wText(TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> showDesktopConfirmDialog({
    required String title,
    required String desc,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 500.0,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Divider(),
                  const SizedBox(height: 8.0),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: CustomOutlineButton(
                          title: 'Cancel'.toUpperCase(),
                          onTap: () => Navigator.of(context).pop(false),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CustomFillButton(
                          title: 'Confirm'.toUpperCase(),
                          onTap: () => Navigator.of(context).pop(true),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

enum SnackBarType {
  success,
  waring,
  info,
  error,
}

Path snakeBarPath({
  required Size size,
}) {
  var radius = 16.0;
  var tapRadius = 24.0;

  var path = Path();
  path.moveTo(tapRadius, 0);
  path.lineTo(size.width - radius, 0);
  path.quadraticBezierTo(size.width, 0, size.width, radius);
  path.lineTo(size.width, size.height - radius);
  path.quadraticBezierTo(
      size.width, size.height, size.width - radius, size.height);
  path.lineTo(radius, size.height);
  path.quadraticBezierTo(0, size.height, 0, size.height - radius);
  path.lineTo(0, tapRadius);
  path.arcToPoint(
    Offset(
      tapRadius,
      0,
    ),
    radius: Radius.circular(tapRadius - 2),
    clockwise: false,
    rotation: pi * 3 / 2,
    largeArc: true,
  );
  path.close();

  return path;
}

class DialogBackClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = snakeBarPath(size: size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class DialogBackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = snakeBarPath(size: size);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
