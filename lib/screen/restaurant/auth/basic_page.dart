import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class BasicPage extends StatefulWidget {
  final RestaurantModel? model;
  final Function(RestaurantModel restaurant)? onNext;

  BasicPage({
    Key? key,
    this.model,
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
  final _controller = Completer();

  @override
  void initState() {
    super.initState();

    restaurant =
        widget.model == null ? RestaurantModel() : widget.model!.copyWith();
    restaurant.address ??= AddressModel();
    galleries = restaurant.galleries ?? ['', '', '', ''];

    Timer.run(() async {
      locationService = LocationService.of(context);
      var service = await locationService!.initService();
      if (service != null) {
        if (mounted) {
          Fluttertoast.showToast(msg: service);
        }
      } else {
        setState(() {
          logger.d(locationService!.getCurrentLcoation());
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
                S.current.base_info,
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
                      S.current.name_category.subtitle,
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: TextEditingController(
                                text: restaurant.name,
                              ),
                              prefix: Icon(LineIcons.user),
                              hintText:
                                  '${S.current.restaurants} ${S.current.name}',
                              onChanged: (value) => restaurant.name = value,
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
                              hintText: S.current.category,
                              readOnly: true,
                              onTap: () async {
                                var result = await DialogService.of(context)
                                    .showDesktopChooserDialog(
                                  title: S.current.choose_category,
                                  values: RESTAURANTTYPE.values
                                      .map((e) => e.valueString)
                                      .toList(),
                                );
                                if (result != null) {
                                  setState(() {
                                    restaurant.category = result;
                                  });
                                }
                              },
                              onChanged: (value) {
                                restaurant.category = value;
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
                              controller: TextEditingController(
                                text: restaurant.email,
                              ),
                              hintText: S.current.email_address,
                              onChanged: (value) => restaurant.email = value,
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                              prefix: Icon(Icons.phone_android),
                              controller: TextEditingController(
                                text: restaurant.phone,
                              ),
                              hintText: S.current.phone_number,
                              onChanged: (value) => restaurant.phone = value,
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
                      S.current.address.subtitle,
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: TextEditingController(
                                    text: restaurant.address!.address1,
                                  ),
                                  prefix: Icon(Icons.location_on_rounded),
                                  hintText: S.current.address1,
                                  onChanged: (value) =>
                                      restaurant.address!.address1 = value,
                                ),
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  controller: TextEditingController(
                                    text: restaurant.address!.address2,
                                  ),
                                  prefix: Icon(Icons.location_on_rounded),
                                  hintText: S.current.address2_optional,
                                  onChanged: (value) =>
                                      restaurant.address!.address2 = value,
                                ),
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  controller: TextEditingController(
                                    text: restaurant.address!.city,
                                  ),
                                  prefix: Icon(Icons.location_city),
                                  hintText: S.current.city,
                                  onChanged: (value) =>
                                      restaurant.address!.city = value,
                                ),
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  controller: TextEditingController(
                                    text: restaurant.address!.province,
                                  ),
                                  prefix: Icon(Icons.location_city),
                                  hintText: S.current.province,
                                  onChanged: (value) =>
                                      restaurant.address!.province = value,
                                ),
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  prefix: Icon(Icons.code),
                                  hintText: S.current.postal_code,
                                  controller: TextEditingController(
                                    text: restaurant.address!.postal,
                                  ),
                                  onChanged: (value) =>
                                      restaurant.address!.postal = value,
                                ),
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  prefix: Icon(Icons.language),
                                  controller:
                                      TextEditingController(text: 'Laos'),
                                  hintText: S.current.country,
                                  onChanged: (value) =>
                                      restaurant.address!.country = value,
                                  readOnly: true,
                                  suffix: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: TextEditingController(
                                    text: restaurant.address!.lat,
                                  ),
                                  prefix: Icon(Icons.location_on_rounded),
                                  hintText: S.current.latitude,
                                  onChanged: (value) =>
                                      restaurant.address!.lat = value,
                                ),
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  controller: TextEditingController(
                                    text: restaurant.address!.lon,
                                  ),
                                  prefix: Icon(Icons.location_on_rounded),
                                  hintText: S.current.longitude,
                                  onChanged: (value) =>
                                      restaurant.address!.lon = value,
                                ),
                                const SizedBox(height: 16.0),
                                Container(
                                  height: 240.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7.0),
                                    child: locationEnabled
                                        ? Stack(
                                            children: [
                                              GoogleMap(
                                                mapType: MapType.hybrid,
                                                initialCameraPosition:
                                                    CameraPosition(
                                                  target: LatLng(
                                                    defaultLatitude,
                                                    defaultLongitude,
                                                  ),
                                                  zoom: CAMERA_ZOOM,
                                                ),
                                                onMapCreated:
                                                    (GoogleMapController
                                                        controller) {
                                                  _controller
                                                      .complete(controller);
                                                },
                                                onCameraIdle: onUpdatedMap,
                                              ),
                                              Center(
                                                child: Icon(
                                                  Icons.my_location_outlined,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(0.75),
                                                  size: 32.0,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ),
                                ),
                              ],
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
                      S.current.logo.subtitle,
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: WebCachImage(
                              url: restaurant.logo ?? '',
                              shortDesc: '256 * 256 ${S.current.image}',
                              picker: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  withReadStream: true,
                                );
                                if (result != null) {
                                  var file = result.files.single;
                                  var resp =
                                      await APIService.of(context).upload(
                                    path: 'logo',
                                    webFile: file,
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
                          for (var i = 1; i < 4; i++) ...{
                            const SizedBox(width: 16.0),
                            const Spacer(),
                          },
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
                              shortDesc: '900 * 750 ${S.current.image}',
                              picker: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  withReadStream: true,
                                );
                                if (result != null) {
                                  var file = result.files.single;
                                  var resp =
                                      await APIService.of(context).upload(
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
                                shortDesc: '900 * 750 ${S.current.image}',
                                picker: () async {
                                  var result =
                                      await FilePicker.platform.pickFiles(
                                    withReadStream: true,
                                  );
                                  if (result != null) {
                                    var file = result.files.single;
                                    var resp =
                                        await APIService.of(context).upload(
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

  void onUpdatedMap() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    LatLng latlng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
    logger.d(latlng);
    restaurant.address!.lat = latlng.latitude.toString();
    restaurant.address!.lon = latlng.longitude.toString();
    setState(() {});
  }

  void onNext() {
    for (var gallery in galleries) {
      if (gallery.isEmpty) {
        Fluttertoast.showToast(msg: S.current.input_all_fields);
        return;
      }
    }
    restaurant.galleries = galleries;
    restaurant.address!.country = 'Laos';
    var error = restaurant.hasFullData;
    if (error != null) {
      Fluttertoast.showToast(msg: error);
      return;
    }
    if (widget.onNext != null) {
      widget.onNext!(restaurant);
    }
  }
}
