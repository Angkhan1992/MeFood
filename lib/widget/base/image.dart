import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/service/service.dart';
import 'package:widget_mask/widget_mask.dart';

class ExtendImageView extends StatelessWidget {
  final String source;

  const ExtendImageView({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlaceholderView extends StatelessWidget {
  final double imageSize;
  final double fontSize;
  final String desc;

  const PlaceholderView({
    Key? key,
    this.imageSize = 60.0,
    this.fontSize = 14.0,
    this.desc = 'Upload Image',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.image_outlined,
          color: Theme.of(context).colorScheme.secondary,
          size: imageSize,
        ),
        const SizedBox(
          height: 8.0,
        ),
        desc.wText(
          TextStyle(
            fontSize: fontSize,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

class ImageUploadWidget extends StatelessWidget {
  final Function()? onPicker;
  final double height;
  final String? header;
  final String? link;
  final double placeImageSize;
  final double placeFontSize;

  const ImageUploadWidget({
    Key? key,
    required this.height,
    required this.placeImageSize,
    required this.placeFontSize,
    this.header,
    this.link,
    this.onPicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null) ...{
          header!.wText(
            TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
        },
        InkWell(
          onTap: onPicker,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            alignment: Alignment.center,
            child: (link == null || link!.isEmpty)
                ? PlaceholderView(
                    imageSize: placeImageSize,
                    fontSize: placeFontSize,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: link!,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String? link;
  final double radius;
  final double placeholderSize;
  final Function(String?)? onPicker;

  const ImagePickerWidget({
    Key? key,
    this.width,
    this.height,
    this.link,
    this.radius = 4.0,
    this.placeholderSize = 24.0,
    this.onPicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: InkWell(
        onTap: () async {
          var path = await ImagePickerService.of(context).picker();
          onPicker!(path);
        },
        child: (link == null || link!.isEmpty)
            ? LineIcon(
                LineIcons.image,
                size: placeholderSize,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: CachedNetworkImage(
                  imageUrl: link!,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: placeholderSize,
                      height: placeholderSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: placeholderSize,
                  ),
                ),
              ),
      ),
    );
  }
}

class CarImageWidget extends StatelessWidget {
  final Color? color;
  final Function(Color?)? onChangeColor;

  const CarImageWidget({
    Key? key,
    this.color,
    this.onChangeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _color = color ?? Theme.of(context).colorScheme.secondary;
    return Stack(
      children: [
        Image.asset(
          'assets/images/car_above.png',
          width: 150.0,
        ),
        SizedBox(
          width: 150.0,
          height: 80.0,
          child: InkWell(
            onTap: () async {
              var color = await ColorPickerService.of(
                context,
                picker: _color,
              ).picker();
              if (onChangeColor != null) {
                onChangeColor!(color);
              }
            },
            child: WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Container(
                color: _color,
              ),
              child: Image.asset('assets/images/car_mask.png'),
            ),
          ),
        ),
      ],
    );
  }
}

class CircleAvatarNetwork extends StatelessWidget {
  final String? avatar;
  final double size;
  final Color? borderColor;

  const CircleAvatarNetwork({
    Key? key,
    this.avatar,
    this.size = 60.0,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primary = borderColor ?? Theme.of(context).primaryColor;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: primary,
        ),
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2 - 1),
        child: CachedNetworkImage(
          imageUrl: avatar ?? 'http',
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: size / 3 * 2,
              height: size / 3 * 2,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(
              LineIcons.user,
              size: size / 3 * 2,
              color: primary,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CasualScrollView extends StatelessWidget {
  final List<String> galleries;

  const CasualScrollView({
    Key? key,
    required this.galleries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        height: width * 5 / 8,
        aspectRatio: 8 / 5,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: galleries.map((link) {
        return CachedNetworkImage(
          imageUrl: '$kDomain$link',
          width: width,
          height: width * 5 / 8,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: SizedBox(
              width: 75.0,
              height: 75.0,
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 2.0,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Image.asset(
              'assets/images/web/logo.png',
              width: 75.0,
              height: 75.0,
              color: Theme.of(context).hintColor,
            ),
          ),
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }
}
