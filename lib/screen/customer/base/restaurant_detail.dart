import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/screen/customer/home/restaurant_product.dart';
import 'package:mefood/service/api_service.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/customer/list_item.dart';

class RestaurantDetail extends StatefulWidget {
  final RestaurantModel restaurant;
  final bool showProducts;
  RestaurantDetail({
    Key? key,
    required this.restaurant,
    this.showProducts = true,
  }) : super(key: key);

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  List<ProductModel>? newProducts;

  @override
  Widget build(BuildContext context) {
    var fontSizeBody = 16.0;
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: widget.restaurant.name!,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CasualScrollView(
              galleries: widget.restaurant.galleries!,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatarNetwork(
                        avatar: '$kDomain${widget.restaurant.logo}',
                        size: 60.0,
                      ),
                      const SizedBox(
                        width: offsetBase,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurant.name!,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            widget.restaurant.category!,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          Row(
                            children: [
                              for (var i = 0; i < 5; i++) ...{
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18.0,
                                ),
                              },
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                '4.7 of 20 Reviews',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.restaurant.description!,
                    style: TextStyle(
                      fontSize: fontSizeBody,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  DetailOption(
                    iconData: LineIcons.mailchimp,
                    text: widget.restaurant.email!,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16.0),
                  DetailOption(
                    iconData: LineIcons.phone,
                    text: widget.restaurant.phone!,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16.0),
                  DetailOption(
                    iconData: LineIcons.searchLocation,
                    text: 'Go to Google Map',
                    onTap: () {},
                  ),
                  const SizedBox(height: 24.0),
                  if (widget.showProducts)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExtendSubTitle(
                          subtitle: 'Restaurant Products',
                          extendTitle: 'View all',
                          onTap: () => NavigatorService.of(context).push(
                            screen: RestaurantProduct(
                              restaurant: widget.restaurant,
                            ),
                          ),
                        ),
                        productWidget(),
                        const SizedBox(height: 24.0),
                      ],
                    ),
                  reviewWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reviewWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtendSubTitle(
          subtitle: 'Recent Reviews',
          extendTitle: 'View all',
          onTap: () {},
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

  Widget productWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: offsetBase,
      ),
      child: (newProducts == null || newProducts!.isEmpty)
          ? FutureBuilder<List<ProductModel>>(
              future: EProduct.getNewProductsByRest(widget.restaurant.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return snapLoadingWidget();
                }
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return snapErrorWidget();
                }
                newProducts = snapshot.data!;
                return Container(
                  height: 200.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: newProducts!
                          .map((e) => e.productSquare(
                                context,
                                type: 'new',
                                showRestaurant: false,
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            )
          : Container(
              height: 200.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: newProducts!
                      .map((e) => e.productSquare(
                            context,
                            type: 'new',
                            showRestaurant: false,
                          ))
                      .toList(),
                ),
              ),
            ),
    );
  }

  Widget snapErrorWidget() {
    return Container(
      height: 200.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/ic_empty.svg',
            color: Theme.of(context).hintColor,
            width: 40.0,
            height: 40.0,
          ),
          const SizedBox(height: offsetBase),
          Text(
            'Empty List',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }

  Widget snapLoadingWidget() {
    return Container(
      height: 200.0,
      alignment: Alignment.center,
      child: ProgressWidget(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
