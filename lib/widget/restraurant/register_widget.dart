import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class StepperWidget extends StatelessWidget {
  final int number;
  final int step;
  final String title;

  const StepperWidget({
    Key? key,
    required this.number,
    required this.step,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color:
                step > number ? Theme.of(context).colorScheme.secondary : null,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2.0,
            ),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${number + 1}',
            style: TextStyle(
              fontSize: 15.0,
              color: step > number
                  ? Theme.of(context).scaffoldBackgroundColor
                  : null,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class WebCachImage extends StatelessWidget {
  final Function()? picker;
  final String url;
  final String shortDesc;
  final double radius;
  final double aspectRatio;
  final double previewIconSize;

  const WebCachImage({
    Key? key,
    required this.url,
    required this.shortDesc,
    this.picker,
    this.radius = 16.0,
    this.aspectRatio = 1.0,
    this.previewIconSize = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).hintColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: InkWell(
          onTap: picker,
          child: url.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LineIcons.imageAlt,
                        size: previewIconSize,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        shortDesc,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius - 1),
                    child: Image.network(
                      url,
                      loadingBuilder: (context, child, loadingProgress) {
                        return Container();
                      },
                      errorBuilder: (context, child, loadingProgress) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: previewIconSize,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'Failed Image Loaded!',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
