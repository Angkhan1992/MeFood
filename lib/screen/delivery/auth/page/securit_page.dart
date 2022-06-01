import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/car_model.dart';
import 'package:mefood/model/user_model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/screen/delivery/auth/page/page.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:provider/provider.dart';

class SecuritPage extends StatefulWidget {
  final Function(UserModel, CarModel)? onNext;

  const SecuritPage({
    Key? key,
    this.onNext,
  }) : super(key: key);

  @override
  State<SecuritPage> createState() => _SecuritPageState();
}

class _SecuritPageState extends State<SecuritPage> {
  Color? carColor;

  String? idCard;
  String? license;
  String? plate;
  String? leftImage;
  String? rightImage;
  String? frontImage;
  String? backImage;

  DriverProvider? provider;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      provider = Provider.of<DriverProvider>(context, listen: false);

      var car = provider!.user.car!;
      carColor = car.color!.convert2Color;
      logger.d(car.color);
      logger.d(carColor);
      plate = car.plate;
      leftImage = car.left;
      rightImage = car.right;
      frontImage = car.front;
      backImage = car.back;
      license = car.license;

      idCard = provider!.user.user!.idcard;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          'Driver Identify'.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          'You can update some identify information and will reivew in 48 hrs.'
              .wText(
            TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Column(
            children: [
              Column(
                children: [
                  'ID Card or Passport'.wText(TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ImagePickerWidget(
                    width: double.infinity,
                    height: 200.0,
                    link: idCard,
                    placeholderSize: 44.0,
                    onPicker: (path) async {
                      logger.d(path);
                      if (path != null) {
                        var imageUrl = await uploadImage(
                          filepath: path,
                          type: VerifyImageType.id_card,
                        );
                        if (imageUrl != null) {
                          setState(() {
                            idCard = imageUrl;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                children: [
                  'Car License'.wText(TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ImagePickerWidget(
                    width: double.infinity,
                    height: 200.0,
                    link: license,
                    placeholderSize: 44.0,
                    onPicker: (path) async {
                      logger.d(path);
                      if (path != null) {
                        var imageUrl = await uploadImage(
                          filepath: path,
                          type: VerifyImageType.license,
                        );
                        if (imageUrl != null) {
                          setState(() {
                            license = imageUrl;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                children: [
                  'Car Plate'.wText(TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ImagePickerWidget(
                    width: double.infinity,
                    height: 120.0,
                    link: plate,
                    placeholderSize: 44.0,
                    onPicker: (path) async {
                      logger.d(path);
                      if (path != null) {
                        var imageUrl = await uploadImage(
                          filepath: path,
                          type: VerifyImageType.license,
                        );
                        if (imageUrl != null) {
                          setState(() {
                            plate = imageUrl;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                children: [
                  'Car Images'.wText(TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ImagePickerWidget(
                    width: 150.0,
                    height: 80.0,
                    link: rightImage,
                    placeholderSize: 36.0,
                    onPicker: (path) async {
                      logger.d(path);
                      if (path != null) {
                        var imageUrl = await uploadImage(
                          filepath: path,
                          type: VerifyImageType.car,
                        );
                        if (imageUrl != null) {
                          setState(() {
                            rightImage = imageUrl;
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ImagePickerWidget(
                          height: 80.0,
                          placeholderSize: 36.0,
                          link: frontImage,
                          onPicker: (path) async {
                            logger.d(path);
                            if (path != null) {
                              var imageUrl = await uploadImage(
                                filepath: path,
                                type: VerifyImageType.car,
                              );
                              if (imageUrl != null) {
                                setState(() {
                                  frontImage = imageUrl;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      CarImageWidget(
                        color: carColor,
                        onChangeColor: (color) {
                          logger.d(color);
                          setState(() {
                            carColor = color;
                          });
                        },
                      ),
                      Expanded(
                        child: ImagePickerWidget(
                          height: 80.0,
                          placeholderSize: 36.0,
                          link: backImage,
                          onPicker: (path) async {
                            logger.d(path);
                            if (path != null) {
                              var imageUrl = await uploadImage(
                                filepath: path,
                                type: VerifyImageType.car,
                              );
                              if (imageUrl != null) {
                                setState(() {
                                  backImage = imageUrl;
                                });
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ImagePickerWidget(
                    width: 150.0,
                    height: 80.0,
                    link: leftImage,
                    placeholderSize: 36.0,
                    onPicker: (path) async {
                      logger.d(path);
                      if (path != null) {
                        var imageUrl = await uploadImage(
                          filepath: path,
                          type: VerifyImageType.car,
                        );
                        if (imageUrl != null) {
                          setState(() {
                            leftImage = imageUrl;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              CustomFillButton(
                title: 'Update Securit'.toUpperCase(),
                onTap: submit,
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ],
      ),
    );
  }

  Future<String?> uploadImage({
    required String filepath,
    required VerifyImageType type,
  }) async {
    var path = '';
    switch (type) {
      case VerifyImageType.id_card:
        path = 'upload/idcard';
        break;
      case VerifyImageType.license:
        path = 'upload/driver';
        break;
      case VerifyImageType.plate:
        path = 'upload/plate';
        break;
      case VerifyImageType.car:
        path = 'upload/car';
        break;
    }
    var resp = await APIService.of(context: context).upload(
      path: path,
      filePath: filepath,
    );

    if (resp['ret'] == 10000) {
      return resp['result'];
    } else {
      DialogService.of(context).showSnackBar(
        'Upload image failed',
        type: SnackBarType.error,
      );
    }
    return null;
  }

  Future<void> submit() async {
    if (carColor == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (idCard == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (license == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (plate == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (leftImage == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (rightImage == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (frontImage == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }
    if (backImage == null) {
      DialogService.of(context).showSnackBar(
        'Please fill all fields',
        type: SnackBarType.error,
      );
      return;
    }

    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlAuth}/updateSecurit',
      {
        'usr_id': provider!.user.user!.id,
        'id_card': idCard,
        'car_id': provider!.user.car!.id,
        'color': carColor!.convett2String,
        'license': license,
        'plate': plate,
        'left': leftImage,
        'right': rightImage,
        'front': frontImage,
        'back': backImage,
      },
    );
    if (resp!['ret'] == 10000) {
      var user = provider!.user.user!;
      user.idcard = idCard;

      var car = provider!.user.car!;
      car.license = license;
      car.plate = plate;
      car.left = leftImage;
      car.right = rightImage;
      car.front = frontImage;
      car.back = backImage;
      widget.onNext!(user, car);
    } else {
      DialogService.of(context).showSnackBar(
        'Server Error!',
        type: SnackBarType.error,
      );
    }
  }
}
