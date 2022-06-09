import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/restaurant/restaurant.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/button.dart';
import 'package:mefood/widget/base/textfield.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ProductModel product = ProductModel();
  final _characterEvent = ValueNotifier(0);
  List<String> galleries = ['', '', '', ''];
  var value = '', price = '', prepare = '';

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        var restaurantProvider = context.read<RestaurantProvider>();
        return Column(
          children: [
            HeaderView(
              user: restaurantProvider.user!,
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 1000.0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                onTap: () => Navigator.of(context).pop(),
                              ),
                              const SizedBox(width: 16.0),
                              'Add Product'.pageTitle,
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          Container(
                            constraints: BoxConstraints(minHeight: 600.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 40.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [kShadowContainer],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Information'.toUpperCase().pageSubTitle,
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomTextField(
                                            prefix: Icon(
                                              Icons.grid_goldenratio_outlined,
                                            ),
                                            hintText:
                                                'Product Title (e.g. Italy Pizza)',
                                            onChanged: (value) =>
                                                product.title = value,
                                          ),
                                          const SizedBox(
                                            height: 24.0,
                                          ),
                                          CustomTextField(
                                            prefix: Icon(
                                              Icons.timelapse_outlined,
                                            ),
                                            hintText: 'Prepare Time (e.g. 10)',
                                            onChanged: (value) =>
                                                prepare = value,
                                          ),
                                          const SizedBox(
                                            height: 24.0,
                                          ),
                                          CustomTextField(
                                            prefix: Icon(
                                              Icons.code,
                                            ),
                                            hintText: 'Unit Value (e.g. 4)',
                                            onChanged: (value) =>
                                                this.value = value,
                                          ),
                                          const SizedBox(
                                            height: 24.0,
                                          ),
                                          CustomTextField(
                                            prefix: Icon(
                                              Icons.ac_unit,
                                            ),
                                            hintText: 'Unit (e.g. Kg)',
                                            onChanged: (value) =>
                                                product.unit = value,
                                          ),
                                          const SizedBox(
                                            height: 24.0,
                                          ),
                                          CustomTextField(
                                            prefix: Icon(
                                              Icons.price_check,
                                            ),
                                            suffix: Text(
                                              '₭',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            hintText: 'Price (e.g. 135000)',
                                            onChanged: (value) => price = value,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 24.0,
                                    ),
                                    Expanded(
                                      child: ValueListenableBuilder<int>(
                                        valueListenable: _characterEvent,
                                        builder: (context, value, child) =>
                                            Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomTextMemo(
                                              hintText:
                                                  'You can write product description in here less 300 characters.',
                                              lines: 13,
                                              onChanged: (value) {
                                                _characterEvent.value =
                                                    value.length;
                                                product.desc = value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            Text(
                                              '$value / 300',
                                              style: TextStyle(
                                                color: value == 0
                                                    ? Theme.of(context)
                                                        .hintColor
                                                    : value > 300
                                                        ? Colors.redAccent
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                'Galleries'.toUpperCase().pageSubTitle,
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: WebCachImage(
                                        url: galleries[0],
                                        shortDesc:
                                            '900 * 750 ${S.current.image}',
                                        picker: () async {
                                          var result = await FilePicker.platform
                                              .pickFiles(
                                            withReadStream: true,
                                          );
                                          if (result != null) {
                                            var file = result.files.single;
                                            var resp =
                                                await APIService.of(context)
                                                    .upload(
                                              path: 'gallery',
                                              webFile: file,
                                            );
                                            if (resp['ret'] == 10000) {
                                              var imageUrl =
                                                  '$kUrlGallery${resp['result']}';
                                              setState(() {
                                                galleries[0] = imageUrl;
                                              });
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    for (var i = 1; i < 4; i++) ...{
                                      const SizedBox(width: 16.0),
                                      Expanded(
                                        child: WebCachImage(
                                          url: galleries[i],
                                          shortDesc:
                                              '900 * 750 ${S.current.image}',
                                          picker: () async {
                                            var result = await FilePicker
                                                .platform
                                                .pickFiles(
                                              withReadStream: true,
                                            );
                                            if (result != null) {
                                              var file = result.files.single;
                                              var resp =
                                                  await APIService.of(context)
                                                      .upload(
                                                path: 'gallery',
                                                webFile: file,
                                              );
                                              if (resp['ret'] == 10000) {
                                                var imageUrl =
                                                    '$kUrlGallery${resp['result']}';
                                                setState(() {
                                                  galleries[i] = imageUrl;
                                                });
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    },
                                  ],
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      child: CustomFillButton(
                                        title: 'DONE',
                                        onTap: submit,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      constraints: BoxConstraints(maxWidth: 1000.0),
                      child: FooterView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void submit() async {
    try {
      product.prepareTime = int.parse(prepare);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid product preparing time');
      return;
    }
    try {
      product.value = int.parse(value);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid product value');
      return;
    }
    try {
      product.price = int.parse(price);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid price value');
      return;
    }
    product.galleries = galleries;
    var validErr = product.validate;
    if (validErr != null) {
      Fluttertoast.showToast(msg: validErr);
      return;
    }
    if (mounted) {
      var provider = context.read<RestaurantProvider>();
      var respErr = await product.addProduct(context, provider.restaurant!.id!);
      if (respErr != null) {
        Fluttertoast.showToast(msg: respErr);
        return;
      }
      await provider.addProduct(product);
      Navigator.of(context).pop();
    }
  }
}
