import 'package:flutter/material.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/widget/base/base.dart';

class DeliveryVerifyPage extends StatefulWidget {
  final Function()? onPrevious;
  final Function()? onNext;

  const DeliveryVerifyPage({
    Key? key,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<DeliveryVerifyPage> createState() => _DeliveryVerifyPageState();
}

class _DeliveryVerifyPageState extends State<DeliveryVerifyPage> {
  var _idcard = '';
  var _license = '';
  var _plate = '';

  final _images = ['', '', '', ''];
  var _imageIndex = 0;
  var _isUpload = false;

  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          S.current.verification.wText(
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
          CustomTextField(
            prefix: const Icon(Icons.code),
            controller: _codeController,
            hintText: S.current.verify_code,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ImageUploadWidget(
            height: 200.0,
            header: S.current.idcard_passport,
            placeImageSize: 75.0,
            placeFontSize: 18.0,
            link: _idcard,
            onPicker: () async {
              var imagePath = await ImagePickerService.of(context).picker();
              uploadImage(
                filePath: imagePath!,
                type: VerifyImageType.id_card,
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          ImageUploadWidget(
            height: 120.0,
            header: S.current.car_plate,
            placeImageSize: 60.0,
            placeFontSize: 16.0,
            link: _plate,
            onPicker: () async {
              var imagePath = await ImagePickerService.of(context).picker();
              uploadImage(
                filePath: imagePath!,
                type: VerifyImageType.plate,
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          ImageUploadWidget(
            height: 200.0,
            header: S.current.car_license,
            placeImageSize: 75.0,
            placeFontSize: 18.0,
            link: _license,
            onPicker: () async {
              var imagePath = await ImagePickerService.of(context).picker();
              uploadImage(
                filePath: imagePath!,
                type: VerifyImageType.license,
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          S.current.car_images.wText(
            TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              Expanded(
                child: ImageUploadWidget(
                  height: 100.0,
                  placeImageSize: 40.0,
                  placeFontSize: 10.0,
                  link: _images[0],
                  onPicker: () async {
                    _imageIndex = 0;
                    var imagePath =
                        await ImagePickerService.of(context).picker();
                    uploadImage(
                      filePath: imagePath!,
                      type: VerifyImageType.car,
                    );
                  },
                ),
              ),
              for (var i = 1; i < 4; i++) ...{
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: ImageUploadWidget(
                    height: 100.0,
                    placeImageSize: 40.0,
                    placeFontSize: 10.0,
                    link: _images[i],
                    onPicker: () async {
                      _imageIndex = i;
                      var imagePath =
                          await ImagePickerService.of(context).picker();
                      uploadImage(
                        filePath: imagePath!,
                        type: VerifyImageType.car,
                      );
                    },
                  ),
                ),
              },
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomOutlineButton(
            title: S.current.previous.toUpperCase(),
            onTap: widget.onPrevious,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomFillButton(
            title: S.current.next.toUpperCase(),
            onTap: onNext,
            isLoading: _isUpload,
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }

  void uploadImage({
    required String filePath,
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
    var resp = await APIService.of().upload(
      path: path,
      filePath: filePath,
    );

    if (resp['ret'] == 10000) {
      setImageUrl(resp['result'], type);
    } else {
      DialogService.of(context).showSnackBar(
        S.current.upload_image_failed,
        type: SnackBarType.error,
      );
    }
  }

  void setImageUrl(
    String url,
    VerifyImageType type,
  ) {
    switch (type) {
      case VerifyImageType.id_card:
        _idcard = kUrlIDCard + url;
        break;
      case VerifyImageType.license:
        _license = kUrlDriver + url;
        break;
      case VerifyImageType.plate:
        _plate = kUrlPlate + url;
        break;
      case VerifyImageType.car:
        _images[_imageIndex] = kUrlCar + url;
        break;
    }
    setState(() {});
  }

  void onNext() async {
    // if (_user!.hasFullData != null) {
    //   DialogService.of(context).showSnackBar(
    //     _user!.hasFullData!,
    //     type: SnackBarType.error,
    //   );
    // }
    // if (_car!.hasFullData != null) {
    //   DialogService.of(context).showSnackBar(
    //     _car!.hasFullData!,
    //     type: SnackBarType.error,
    //   );
    // }
    // if (widget.onNext != null) {
    //   widget.onNext!(_user!, _car!);
    // }

    // _isUpload = false;
    // setState(() {});
  }
}

enum VerifyImageType {
  id_card,
  license,
  plate,
  car,
}
