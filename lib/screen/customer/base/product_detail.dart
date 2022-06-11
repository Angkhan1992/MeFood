import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var fontSizeTitle = 20.0;
    var fontSizeBody = 16.0;

    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: widget.product.title!,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: width * 5 / 8,
                      aspectRatio: 8 / 5,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: widget.product.galleries!.map((link) {
                      return CachedNetworkImage(
                        imageUrl: '$kDomain$link',
                        width: width,
                        height: width * 5 / 8,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
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
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.product.title!,
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                            ),
                            const Spacer(),
                            Text(
                              widget.product.currency,
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          widget.product.desc!,
                          style: TextStyle(
                            fontSize: fontSizeBody,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              LineIcons.cookie,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '${widget.product.prepareTime} Minutes',
                              style: TextStyle(
                                fontSize: fontSizeBody,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              LineIcons.columns,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '${widget.product.value} ${widget.product.unit}',
                              style: TextStyle(
                                fontSize: fontSizeBody,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              LineIcons.searchLocation,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Go to Google Map',
                              style: TextStyle(
                                fontSize: fontSizeBody,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.secondary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        if (widget.product.restaurant != null)
                          Row(
                            children: [
                              Icon(
                                Icons.dinner_dining,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                widget.product.restaurant!.name!,
                                style: TextStyle(
                                  fontSize: fontSizeBody,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 24.0),
                        reviewWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          cartView(),
        ],
      ),
    );
  }

  Widget reviewWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Reviews',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: offsetBase,
        ),
        for (var i = 0; i < 3; i++) ...{
          EReview.fakeView(context),
          const SizedBox(
            height: offsetBase,
          ),
        }
      ],
    );
  }

  Widget cartView() {
    return Container(
      height: 66.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.remove_circle_outline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child: Text(
                  '${widget.product.currency}\nADD CART',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
