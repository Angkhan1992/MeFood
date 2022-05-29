import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mefood/provider/provider.dart';

import 'package:mefood/service/service.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:provider/provider.dart';

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
  final ImagePicker _picker = ImagePicker();

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
          'Verification'.wText(
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          'You can verify your email, car and id on the curretn page.'.wText(
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
            hintText: 'Email Verification Code',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ImageUploadWidget(
            height: 200.0,
            header: 'Add Idcard or Passport',
            placeImageSize: 75.0,
            placeFontSize: 18.0,
            link: _idcard,
            onPicker: () => _onPickerAvatar(type: VerifyImageType.id_card),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ImageUploadWidget(
            height: 120.0,
            header: 'Car Plate',
            placeImageSize: 60.0,
            placeFontSize: 16.0,
            link: _plate,
            onPicker: () => _onPickerAvatar(type: VerifyImageType.plate),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ImageUploadWidget(
            height: 200.0,
            header: 'Car Licenese',
            placeImageSize: 75.0,
            placeFontSize: 18.0,
            link: _license,
            onPicker: () => _onPickerAvatar(type: VerifyImageType.license),
          ),
          const SizedBox(
            height: 16.0,
          ),
          'Car Images (Front, Back, Left and Right)'.wText(
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
                  onPicker: () {
                    _imageIndex = 0;
                    _onPickerAvatar(type: VerifyImageType.car);
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
                    onPicker: () {
                      _imageIndex = i;
                      _onPickerAvatar(type: VerifyImageType.car);
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
            title: 'Previous'.toUpperCase(),
            onTap: widget.onPrevious,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomFillButton(
            title: 'Next'.toUpperCase(),
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

  void _onPickerAvatar({
    required VerifyImageType type,
  }) {
    DialogService.of(context).showBottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Choose Method'.wText(
            TextStyle(
              fontSize: 14.0,
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          InkWell(
            onTap: () => _imagePicker(
              context,
              ImageSource.gallery,
              type,
            ),
            child: 'From Gallery'.wText(
              TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          InkWell(
            onTap: () => _imagePicker(
              context,
              ImageSource.camera,
              type,
            ),
            child: 'From Camera'.wText(
              TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _imagePicker(
    BuildContext context,
    ImageSource source,
    VerifyImageType type,
  ) async {
    Navigator.of(context).pop();

    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      var filePath = pickedFile.path;

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
          'Upload image failed',
          type: SnackBarType.error,
        );
      }
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
    if (_idcard.isEmpty) {
      DialogService.of(context).showSnackBar(
        'Empty IDCard Image.',
        type: SnackBarType.error,
      );
      return;
    }
    if (_plate.isEmpty) {
      DialogService.of(context).showSnackBar(
        'Empty Car Plate Image.',
        type: SnackBarType.error,
      );
      return;
    }
    if (_license.isEmpty) {
      DialogService.of(context).showSnackBar(
        'Empty Car License Image.',
        type: SnackBarType.error,
      );
      return;
    }
    var faces = ['Front', 'Back', 'Left', 'Right'];
    for (var image in _images) {
      if (image.isEmpty) {
        DialogService.of(context).showSnackBar(
          'Empty ${faces[_images.indexOf(image)]} Car Image.',
          type: SnackBarType.error,
        );
        return;
      }
    }

    var code = _codeController.text;
    if (code.isEmpty) {
      DialogService.of(context).showSnackBar(
        'Empty Verification Code.',
        type: SnackBarType.error,
      );
      return;
    }

    _isUpload = true;
    setState(() {});

    var provider = Provider.of<DeliveryUserProvider>(context, listen: false);
    var params = {
      'code': code,
      'idcard': _idcard,
      'plate': _plate,
      'license': _license,
      'front': _images[0],
      'back': _images[1],
      'left': _images[2],
      'right': _images[3],
      'id': provider.user.id,
    };
    var resp = await APIService().post(
      APIService.kUrlAuth + '/regDeliveryVerify',
      params,
    );

    if (resp != null) {
      if (resp['ret'] == 10000) {
        provider.setVerifyInfor(params);
        widget.onNext!();
      } else {
        DialogService.of(context).showSnackBar(
          resp['msg'],
          type: SnackBarType.error,
        );
      }
    } else {
      DialogService.of(context).showSnackBar(
        'Failed Server Error',
        type: SnackBarType.error,
      );
    }

    _isUpload = false;
    setState(() {});
  }
}

enum VerifyImageType {
  id_card,
  license,
  plate,
  car,
}
