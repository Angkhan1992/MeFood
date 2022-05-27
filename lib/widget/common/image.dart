import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';

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
