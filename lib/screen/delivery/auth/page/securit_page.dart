import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/screen/delivery/auth/page/page.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/base/base.dart';

class SecuritPage extends StatefulWidget {
  final MemberModel? member;
  final CarModel? car;
  final Function(MemberModel member, CarModel car)? onNext;

  const SecuritPage({
    Key? key,
    this.onNext,
    this.member,
    this.car,
  }) : super(key: key);

  @override
  State<SecuritPage> createState() => _SecuritPageState();
}

class _SecuritPageState extends State<SecuritPage> {
  CarModel? _car;
  MemberModel? _user;

  Color? carColor;

  String? idCard;
  String? license;
  String? plate;
  String? leftImage;
  String? rightImage;
  String? frontImage;
  String? backImage;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _car = widget.car == null ? CarModel() : widget.car!.copyWith();
      carColor = _car!.color!.convert2Color;
      logger.d(_car!.color);
      logger.d(carColor);

      plate = _car!.linkPlate;
      license = _car!.linkLicense;

      if (_car!.galleries != null) {
        leftImage = _car!.galleries![0];
        rightImage = _car!.galleries![1];
        frontImage = _car!.galleries![2];
        backImage = _car!.galleries![3];
      }

      _user = widget.member == null ? MemberModel() : widget.member!.copyWith();

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
          S.current.driver_identify.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          S.current.dsc_verify.wText(
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
                  S.current.idcard_passport.wText(TextStyle(
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
                  S.current.car_license.wText(TextStyle(
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
                  S.current.car_plate.wText(TextStyle(
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
                  S.current.car_images.wText(TextStyle(
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
                title: S.current.upt_securit.toUpperCase(),
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
        S.current.upload_image_failed,
        type: SnackBarType.error,
      );
    }
    return null;
  }

  Future<void> submit() async {
    if (_user!.hasFullData != null) {
      DialogService.of(context).showSnackBar(
        _user!.hasFullData!,
        type: SnackBarType.error,
      );
    }
    if (_car!.hasFullData != null) {
      DialogService.of(context).showSnackBar(
        _car!.hasFullData!,
        type: SnackBarType.error,
      );
    }
    if (widget.onNext != null) {
      widget.onNext!(_user!, _car!);
    }
  }
}
