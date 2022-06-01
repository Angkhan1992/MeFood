import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _user = Provider.of<DriverProvider>(context, listen: false).user.user ??
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
                      onTap: () async {
                        var result =
                            await ImagePickerService.of(context).picker();
                        if (result != null) {
                          var resp =
                              await APIService.of(context: context).upload(
                            path: 'upload/avatar',
                            filePath: result,
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
                      },
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
              onTap: () async {
                var result = await DialogService.of(context).bottomChoose(
                  title: 'Choose Gender',
                  values: ['MALE', 'FEMALE'],
                );
                if (result != null) {
                  _user.gender = result;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(LineIcons.calendar),
              controller: TextEditingController(
                text: _user.dob == null ? '' : _user.dob!.dobValue,
              ),
              hintText: 'Date of Birth',
              readOnly: true,
              onTap: () async {
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
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: 'Update Profile'.toUpperCase(),
                    onTap: () async {
                      _formKey.currentState!.save();
                      FocusScope.of(context).unfocus();

                      var resp = await _user.update(context);
                      if (resp == null) {
                        if (widget.onNext != null) {
                          widget.onNext!(_user, _user.id!);
                        }
                      } else {
                        DialogService.of(context).showSnackBar(
                          resp,
                          type: SnackBarType.error,
                        );
                      }
                    },
                  )
                : CustomFillButton(
                    title: 'Next'.toUpperCase(),
                    onTap: () async {
                      _formKey.currentState!.save();
                      FocusScope.of(context).unfocus();
                      var resp = await _user.add(context);
                      if (resp == null) {
                        if (widget.onNext != null) {
                          widget.onNext!(_user, _user.id!);
                        }
                      } else {
                        DialogService.of(context).showSnackBar(
                          resp,
                          type: SnackBarType.error,
                        );
                      }
                    },
                  ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
