import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/screen/customer/base/restaurant_detail.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/customer/list_item.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;
  final bool showRestaurant;

  ProductDetail({
    Key? key,
    required this.product,
    this.showRestaurant = true,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  SaleModel? sale;
  final _eventAmount = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    sale = SaleModel(
      product: widget.product,
      productAmount: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    var fontSizeTitle = 20.0;
    var fontSizeBody = 16.0;

    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: sale!.product!.title!,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CasualScrollView(
                    galleries: sale!.product!.galleries!,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              sale!.product!.title!,
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                            ),
                            const Spacer(),
                            Text(
                              sale!.product!.currency,
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
                          sale!.product!.desc!,
                          style: TextStyle(
                            fontSize: fontSizeBody,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        DetailOption(
                          iconData: LineIcons.cookie,
                          text: '${sale!.product!.prepareTime} Minutes',
                        ),
                        const SizedBox(height: 16.0),
                        DetailOption(
                          iconData: LineIcons.columns,
                          text:
                              '${sale!.product!.value} ${sale!.product!.unit}',
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        DetailOption(
                          iconData: LineIcons.searchLocation,
                          text: 'Go to Google Map',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        if (sale!.product!.restaurant != null &&
                            widget.showRestaurant)
                          DetailOption(
                            iconData: Icons.dinner_dining,
                            text: sale!.product!.restaurant!.name!,
                            onTap: () => NavigatorService.of(context).push(
                                screen: RestaurantDetail(
                              restaurant: sale!.product!.restaurant!,
                            )),
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
      child: ValueListenableBuilder(
        valueListenable: _eventAmount,
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          if (sale!.productAmount! == 1) {
                            return;
                          }
                          _eventAmount.value = sale!.productAmount! - 1;
                          sale!.productAmount = _eventAmount.value;
                        },
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        '${sale!.productAmount}',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      InkWell(
                        onTap: () {
                          if (sale!.productAmount! == MAX_ORDER_AMOUNT) {
                            return;
                          }
                          _eventAmount.value = sale!.productAmount! + 1;
                          sale!.productAmount = _eventAmount.value;
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
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
                      '${sale!.currency}\nADD CART',
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
          );
        },
      ),
    );
  }
}
