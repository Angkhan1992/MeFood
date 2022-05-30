import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/common/common.dart';

class AddProfilePage extends StatefulWidget {
  final bool isLogin;
  final Function(UserModel, int)? onNext;
  AddProfilePage({
    Key? key,
    this.isLogin = false,
    this.onNext,
  }) : super(key: key);

  @override
  State<AddProfilePage> createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  UserModel _user = UserModel();
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _user =
          Provider.of<DeliveryUserProvider>(context, listen: false).user.user ??
              UserModel();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            'User Profile'.wText(
              TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            'You can add some profile information on the current step.'.wText(
              TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: (_user.avatar == null ||
                              _user.avatar!.isEmpty)
                          ? null
                          : BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: (_user.avatar == null || _user.avatar!.isEmpty)
                            ? SvgPicture.asset(
                                'assets/icons/menu/ic_profile.svg',
                                color: Theme.of(context).colorScheme.secondary,
                              )
                            : CachedNetworkImage(
                                imageUrl: _user.avatar!,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    InkWell(
                      onTap: _onPickerAvatar,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: 'Edit Photo'.wText(
                          TextStyle(
                            fontSize: 10.0,
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomTextField(
                        prefix: const Icon(LineIcons.user),
                        controller: TextEditingController(
                          text: _user.first ?? '',
                        ),
                        hintText: 'First Name',
                        keyboardType: TextInputType.name,
                        onSaved: (name) => _user.first = name,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomTextField(
                        prefix: const Icon(LineIcons.user),
                        controller: TextEditingController(
                          text: _user.last ?? '',
                        ),
                        hintText: 'Last Name',
                        keyboardType: TextInputType.name,
                        onSaved: (name) => _user.last = name,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.email_outlined),
              controller: TextEditingController(
                text: _user.email ?? '',
              ),
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              onSaved: (email) => _user.email = email,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.phone_android_outlined),
              controller: TextEditingController(
                text: _user.phone ?? '',
              ),
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
              onSaved: (phone) => _user.phone = phone,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(LineIcons.genderless),
              controller: TextEditingController(
                text: _user.gender ?? '',
              ),
              hintText: 'Male / Female',
              readOnly: true,
              onTap: _onGenderDialog,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(LineIcons.calendar),
              controller: TextEditingController(
                text: _user.dob ?? '',
              ),
              hintText: 'Date of Birth',
              readOnly: true,
              onTap: _onCalendarDialog,
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: 'Update Profile'.toUpperCase(),
                    onTap: onTapSubmit,
                  )
                : CustomFillButton(
                    title: 'Next'.toUpperCase(),
                    onTap: onTapRegister,
                  ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  void onTapRegister() async {
    if (widget.onNext != null) {
      _formKey.currentState!.save();
      if (!_user.isFullData) return;
      FocusScope.of(context).unfocus();
      var resp = await APIService.of(context: context).post(
        APIService.kUrlAuth + '/registerUser',
        _user.toJson(),
      );

      if (resp != null) {
        if (resp['ret'] == 10000) {
          _user.id = resp['result']['user_id'] as int;
          widget.onNext!(_user, resp['result']['delivery_id']);
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
    }
  }

  void onTapSubmit() async {
    if (widget.onNext != null) {
      _formKey.currentState!.save();
      if (!_user.isFullData) return;
      FocusScope.of(context).unfocus();
      var resp = await APIService.of(context: context).post(
        '${APIService.kUrlAuth}/updateUser',
        _user.toJson(),
      );
      if (resp != null) {
        if (resp['ret'] == 10000) {
          widget.onNext!(_user, _user.id!);
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
    }
  }

  void _onPickerAvatar() {
    _formKey.currentState!.save();
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
            onTap: () => _imagePicker(ImageSource.gallery),
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
            onTap: () => _imagePicker(ImageSource.camera),
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

  void _onGenderDialog() {
    _formKey.currentState!.save();
    DialogService.of(context).showBottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Choose Gender'.wText(
            TextStyle(
              fontSize: 14.0,
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              _user.gender = 'Male';
              setState(() {});
            },
            child: 'Male'.wText(
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
            onTap: () {
              Navigator.of(context).pop();
              _user.gender = 'Female';
              setState(() {});
            },
            child: 'Female'.wText(
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

  void _onCalendarDialog() async {
    _formKey.currentState!.save();
    var dateFormatter = DateFormat('yyyy/MM/dd');
    var initDate = dateFormatter.parse(_user.dob ?? '1990/01/01');
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: dateFormatter.parse('1900/01/01'),
      lastDate: dateFormatter.parse('2010/12/31'),
    );
    if (chooseDate != null) {
      _user.dob = dateFormatter.format(chooseDate);
      setState(() {});
    }
  }

  void _imagePicker(ImageSource source) async {
    Navigator.of(context).pop();

    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      var filePath = pickedFile.path;
      var resp = await APIService.of().upload(
        path: 'upload/avatar',
        filePath: filePath,
      );
      if (resp['ret'] == 10000) {
        var avatarUrl = '$kUrlAvatar${resp['result']}';
        logger.d(avatarUrl);
        _user.avatar = avatarUrl;
      } else {
        DialogService.of(context).showSnackBar(
          'Upload image failed',
          type: SnackBarType.error,
        );
      }
    }
  }
}
