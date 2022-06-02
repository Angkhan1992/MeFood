import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/restaurant_model.dart';
import 'package:mefood/service/service.dart';
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
            ),
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
                            prefix: Icon(Icons.category_sharp),
                            suffix: Icon(Icons.arrow_drop_down),
                            hintText: 'Category',
                            readOnly: true,
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
                    'Restaurant Address'.subtitle,
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
                              formKey.currentState!.save();
                              var imagePath =
                                  await ImagePickerService.of(context).picker();
                              if (imagePath != null) {
                                await Future.delayed(
                                    Duration(seconds: 2)); // Upload Processing
                                setState(() {
                                  restaurant.logo = imagePath;
                                });
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
                            url: '',
                            shortDesc: '900 * 750 Pixels',
                            picker: () async {
                              formKey.currentState!.save();
                              var imagePath =
                                  await ImagePickerService.of(context).picker();
                              if (imagePath != null) {
                                await Future.delayed(
                                  Duration(seconds: 2),
                                ); // Upload Processing
                                setState(() {
                                  galleries[0] = imagePath;
                                });
                              }
                            },
                          ),
                        ),
                        for (var i = 1; i < 4; i++) ...{
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: WebCachImage(
                              url: '',
                              shortDesc: '900 * 750 Pixels',
                              picker: () async {
                                formKey.currentState!.save();
                                var imagePath =
                                    await ImagePickerService.of(context)
                                        .picker();
                                if (imagePath != null) {
                                  await Future.delayed(
                                    Duration(seconds: 2),
                                  ); // Upload Processing
                                  setState(() {
                                    galleries[i] = imagePath;
                                  });
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
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 40.0),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
