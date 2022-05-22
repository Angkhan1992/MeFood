import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mefood/util/extensions.dart';

import '../../../../provider/dialog_provider.dart';
import '../../../../widget/common/button.dart';
import '../../../../widget/common/textfield.dart';

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
  var _licensePlate = '';
  var _images = [];

  var _type = VerifyImageType.id_card;

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
            hintText: 'Email Verification Code',
            keyboardType: TextInputType.number,
            // onSaved: (email) => _user.email = email,
          ),
          const SizedBox(
            height: 16.0,
          ),
          'Add Idcard or Passport'.wText(
            TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          'Car Licenese Plate'.wText(
            TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
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
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
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
            onTap: widget.onNext,
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
    DialogProvider.of(context).showBottomSheet(
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
      // isUploadAvatar = true;
      // setState(() {});
      // var resp = await APIService.of().uploadAvatar(filePath: filePath);
      // if (resp['ret'] == 10000) {
      //   var avatarUrl = '$kUrlAvatar${resp['result']}';
      //   logger.d(avatarUrl);
      //   _user.avatar = avatarUrl;
      // } else {
      //   DialogProvider.of(context).showSnackBar(
      //     'Upload image failed',
      //     type: SnackBarType.error,
      //   );
      // }
      // isUploadAvatar = false;
      setState(() {});
    }
  }
}

enum VerifyImageType {
  id_card,
  license,
  car,
}
