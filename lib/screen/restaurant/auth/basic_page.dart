import 'dart:async';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/restaurant_model.dart';
import 'package:mefood/service/location_service.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/restraurant/register_widget.dart';

class BasicPage extends StatefulWidget {
  final Function(RestaurantModel restaurant)? onNext;

  BasicPage({
    Key? key,
    this.onNext,
  }) : super(key: key);

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  final formKey = GlobalKey<FormState>();

  var restaurant = RestaurantModel();
  var galleries = ['', '', '', ''];

  LocationService? locationService;
  var locationEnabled = false;

  @override
  void initState() {
    super.initState();

    Timer.run(() async {
      locationService = LocationService.of(context);
      var service = await locationService!.initService();
      if (service != null) {
        if (mounted) {
          DialogService.of(context).showSnackBar(
            service,
            type: SnackBarType.error,
          );
        }
      } else {
        setState(() {
          locationEnabled = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Row(
            children: [
              const SizedBox(width: 24.0),
              Text(
                'Basic Information',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 24.0),
            ],
          ),
          const SizedBox(height: 24.0),
          Container(
            padding: const EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [kShadowContainer],
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Name & Category'.subtitle,
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(LineIcons.user),
                              hintText: 'Restaurant Name',
                              onSaved: (value) {
                                if (value != null) {
                                  restaurant.name = value;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: TextEditingController(
                                text: restaurant.category,
                              ),
                              prefix: Icon(Icons.category_sharp),
                              suffix: Icon(Icons.arrow_drop_down),
                              hintText: 'Category',
                              readOnly: true,
                              onTap: () async {
                                var result = await DialogService.of(context)
                                    .showDescktopChooserDialog(
                                  title: 'Choose Category',
                                  values: [
                                    'Restaurant',
                                    'Coffee & Bar',
                                    'Market',
                                  ],
                                );
                                if (result != null) {
                                  setState(() {
                                    restaurant.category = result;
                                  });
                                }
                              },
                              onSaved: (value) {
                                if (value != null) {
                                  restaurant.category = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.email_outlined),
                              hintText: S.current.email_address,
                              onSaved: (value) {
                                if (value != null) {
                                  restaurant.email = value;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.phone_android),
                              hintText: S.current.phone_number,
                              onSaved: (value) {
                                if (value != null) {
                                  restaurant.phone = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          'Restaurant Address'.subtitle,
                          const Spacer(),
                          InkWell(
                            onTap: () async {
                              if (locationEnabled) {}
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: locationEnabled
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).hintColor,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                S.current.from_current_location.wText(
                                  TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: locationEnabled
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context).hintColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.location_on_rounded),
                              hintText: S.current.address1,
                              onSaved: (value) =>
                                  restaurant.address!.address1 = value,
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.location_on_rounded),
                              hintText: S.current.address2_optional,
                              onSaved: (value) =>
                                  restaurant.address!.address2 = value,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.location_city),
                              hintText: S.current.city,
                              onSaved: (value) =>
                                  restaurant.address!.city = value,
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.location_city),
                              hintText: S.current.province,
                              onSaved: (value) =>
                                  restaurant.address!.province = value,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.code),
                              hintText: S.current.postal_code,
                              onSaved: (value) =>
                                  restaurant.address!.postal = value,
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.language),
                              controller: TextEditingController(text: 'Laos'),
                              hintText: S.current.country,
                              onSaved: (value) =>
                                  restaurant.address!.country = value,
                              readOnly: true,
                              suffix: Icon(Icons.arrow_drop_down),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Restaurant Logo'.subtitle,
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: WebCachImage(
                              url: restaurant.logo ?? '',
                              shortDesc: '256 * 256 Pixels',
                              picker: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  withReadStream: true,
                                );
                                if (result != null) {
                                  var file = result.files.single;
                                  var resp =
                                      await APIService.of(context: context)
                                          .upload(
                                    path: 'upload/logo',
                                    filePath: file.path,
                                  );
                                  if (resp['ret'] == 10000) {
                                    var imageUrl = '$kUrlLogo${resp['result']}';
                                    setState(() {
                                      restaurant.logo = imageUrl;
                                      logger.d(restaurant.logo);
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          const Spacer(),
                          const SizedBox(width: 16.0),
                          const Spacer(),
                          const SizedBox(width: 16.0),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Restaurant Pictures'.subtitle,
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: WebCachImage(
                              url: galleries[0],
                              shortDesc: '900 * 750 Pixels',
                              picker: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  withReadStream: true,
                                );
                                if (result != null) {
                                  var file = result.files.single;
                                  var resp =
                                      await APIService.of(context: context)
                                          .upload(
                                    path: 'upload/gallery',
                                    filePath: file.path,
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
                                shortDesc: '900 * 750 Pixels',
                                picker: () async {
                                  var result =
                                      await FilePicker.platform.pickFiles(
                                    withReadStream: true,
                                  );
                                  if (result != null) {
                                    var file = result.files.single;
                                    var resp =
                                        await APIService.of(context: context)
                                            .upload(
                                      path: 'upload/gallery',
                                      filePath: file.path,
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
                    ],
                  ),
                  const SizedBox(height: 80.0),
                  Row(
                    children: [
                      const Spacer(),
                      const SizedBox(width: 40.0),
                      Expanded(
                        flex: 2,
                        child: CustomFillButton(
                          title: S.current.next,
                          onTap: onNext,
                        ),
                      ),
                      const SizedBox(width: 40.0),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onNext() {
    for (var gallery in galleries) {
      if (gallery.isEmpty) {
        DialogService.of(context).showSnackBar(
          S.current.input_all_fields,
          type: SnackBarType.error,
        );
        return;
      }
    }
    var galleryData = jsonEncode(galleries);
    restaurant.galleries = galleryData;
    var error = restaurant.hasFullData;
    if (error != null) {
      DialogService.of(context).showSnackBar(
        error,
        type: SnackBarType.error,
      );
      return;
    }
    if (widget.onNext != null) {
      widget.onNext!(restaurant);
    }
  }
}
