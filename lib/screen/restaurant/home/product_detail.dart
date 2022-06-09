import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/restaurant/restaurant.dart';
import 'package:mefood/service/api_service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/button.dart';
import 'package:mefood/widget/base/textfield.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel model;
  ProductDetail({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var galleries = ['', '', '', ''];
  var _product = ProductModel();

  @override
  void initState() {
    super.initState();
    _product = widget.model.copyWith();
    galleries = _product.galleries!;
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      builder: (context, app) {
        var restaurantProvider = context.read<RestaurantProvider>();
        return Column(
          children: [
            HeaderView(
              key: const Key('header_view'),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          onTap: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                        const SizedBox(width: 16.0),
                                        widget.model.title!.pageTitle,
                                      ],
                                    ),
                                    const SizedBox(height: 24.0),
                                    getInforWidget(),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Customer Preview',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 24.0),
                                  getPreviewWidget(),
                                  const SizedBox(height: 40.0),
                                  SizedBox(
                                    width: 280.0,
                                    child: CustomFillButton(
                                      title: 'Update'.toUpperCase(),
                                      onTap: () async {
                                        var err = await _product
                                            .updateProduct(context);
                                        if (err != null) {
                                          Fluttertoast.showToast(msg: err);
                                        } else {
                                          setState(() {});
                                          Fluttertoast.showToast(
                                              msg: 'Success product updated!');
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 24.0),
                                  SizedBox(
                                    width: 280.0,
                                    child: CustomFillButton(
                                      title: 'Remove'.toUpperCase(),
                                      backgroundColor: Colors.redAccent,
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
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

  Widget getInforWidget() {
    return Container(
      constraints: BoxConstraints(minHeight: 600.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 40.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
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
          CustomTextField(
            prefix: Icon(Icons.grid_goldenratio_outlined),
            controller: TextEditingController(
              text: _product.title,
            ),
            hintText: 'Product Title (e.g. Italy Pizza)',
            onChanged: (value) => _product.title = value,
          ),
          const SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            prefix: Icon(Icons.timelapse_outlined),
            controller: TextEditingController(
              text: _product.prepareTime.toString(),
            ),
            hintText: 'Prepare Time (e.g. 10)',
            onChanged: (value) {
              var val = int.parse(value);
              _product.prepareTime = val;
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            prefix: Icon(Icons.code),
            controller: TextEditingController(
              text: _product.value.toString(),
            ),
            hintText: 'Unit Value (e.g. 4)',
            onChanged: (value) {
              int val = int.parse(value);
              _product.value = val;
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            prefix: Icon(Icons.ac_unit),
            controller: TextEditingController(
              text: _product.unit,
            ),
            hintText: 'Unit (e.g. Kg)',
            onChanged: (value) => _product.unit = value,
          ),
          const SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            prefix: Icon(Icons.price_check),
            controller: TextEditingController(
              text: _product.price.toString(),
            ),
            suffix: Text(
              '₭',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            hintText: 'Price (e.g. 135000)',
            onChanged: (value) {
              var val = int.parse(value);
              _product.price = val;
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          CustomTextMemo(
            hintText:
                'You can write product description in here less 300 characters.',
            controller: TextEditingController(
              text: _product.desc,
            ),
            lines: 5,
            onChanged: (value) => _product.desc = value,
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
                  shortDesc: '900 * 750 ${S.current.image}',
                  picker: () async {
                    var result = await FilePicker.platform.pickFiles(
                      withReadStream: true,
                    );
                    if (result != null) {
                      var file = result.files.single;
                      var resp = await APIService.of(context).upload(
                        path: 'gallery',
                        webFile: file,
                      );
                      if (resp['ret'] == 10000) {
                        var imageUrl = '$kUrlGallery${resp['result']}';
                        setState(() {
                          galleries[0] = imageUrl;
                        });
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: WebCachImage(
                  url: galleries[1],
                  shortDesc: '900 * 750 ${S.current.image}',
                  picker: () async {
                    var result = await FilePicker.platform.pickFiles(
                      withReadStream: true,
                    );
                    if (result != null) {
                      var file = result.files.single;
                      var resp = await APIService.of(context).upload(
                        path: 'gallery',
                        webFile: file,
                      );
                      if (resp['ret'] == 10000) {
                        var imageUrl = '$kUrlGallery${resp['result']}';
                        setState(() {
                          galleries[1] = imageUrl;
                        });
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: WebCachImage(
                  url: galleries[2],
                  shortDesc: '900 * 750 ${S.current.image}',
                  picker: () async {
                    var result = await FilePicker.platform.pickFiles(
                      withReadStream: true,
                    );
                    if (result != null) {
                      var file = result.files.single;
                      var resp = await APIService.of(context).upload(
                        path: 'gallery',
                        webFile: file,
                      );
                      if (resp['ret'] == 10000) {
                        var imageUrl = '$kUrlGallery${resp['result']}';
                        setState(() {
                          galleries[2] = imageUrl;
                        });
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: WebCachImage(
                  url: galleries[3],
                  shortDesc: '900 * 750 ${S.current.image}',
                  picker: () async {
                    var result = await FilePicker.platform.pickFiles(
                      withReadStream: true,
                    );
                    if (result != null) {
                      var file = result.files.single;
                      var resp = await APIService.of(context).upload(
                        path: 'gallery',
                        webFile: file,
                      );
                      if (resp['ret'] == 10000) {
                        var imageUrl = '$kUrlGallery${resp['result']}';
                        setState(() {
                          galleries[3] = imageUrl;
                        });
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getPreviewWidget() {
    return Container(
      width: 300,
      height: 600,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).hintColor,
        ),
      ),
      child: _product.customerPreview(context),
    );
  }
}
