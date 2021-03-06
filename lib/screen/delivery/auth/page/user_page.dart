import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/config.dart';
import 'package:mefood/widget/base/base.dart';

class AddProfilePage extends StatefulWidget {
  final bool isLogin;
  final MemberModel? member;
  final Function(MemberModel)? onNext;

  AddProfilePage({
    Key? key,
    this.isLogin = false,
    this.member,
    this.onNext,
  }) : super(key: key);

  @override
  State<AddProfilePage> createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  MemberModel? _user;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _user = widget.member == null ? MemberModel() : widget.member!.copyWith();
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
            S.current.my_profile.wText(
              TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            S.current.reg_usr_detail.wText(
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
                    CircleAvatarNetwork(
                      avatar: _user!.linkAvatar,
                      size: 80.0,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    InkWell(
                      onTap: () async {
                        // var result =
                        //     await ImagePickerService.of(context).picker();
                        // if (result != null) {
                        //   var resp =
                        //       await APIService.of(context: context).upload(
                        //     path: 'upload/avatar',
                        //     filePath: result,
                        //   );
                        //   if (resp['ret'] == 10000) {
                        //     var avatarUrl = '$kUrlAvatar${resp['result']}';
                        //     logger.d(avatarUrl);
                        //     _user.avatar = avatarUrl;
                        //   } else {
                        //     DialogService.of(context).showSnackBar(
                        //       S.current.upload_image_failed,
                        //       type: SnackBarType.error,
                        //     );
                        //   }
                        // }
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
                        child: S.current.edit_photo.wText(
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
                          text: _user!.firstName ?? '',
                        ),
                        hintText: S.current.first_name,
                        keyboardType: TextInputType.name,
                        // onChanged: (name) => _user!.fullName = name,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomTextField(
                        prefix: const Icon(LineIcons.user),
                        controller: TextEditingController(
                          text: _user!.lastName ?? '',
                        ),
                        hintText: S.current.last_name,
                        keyboardType: TextInputType.name,
                        // onSaved: (name) => _user.last = name,
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
                text: _user!.email ?? '',
              ),
              hintText: S.current.email_address,
              keyboardType: TextInputType.emailAddress,
              onSaved: (email) => _user!.email = email,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(Icons.phone_android_outlined),
              controller: TextEditingController(
                text: _user!.phone ?? '',
              ),
              hintText: S.current.phone_number,
              keyboardType: TextInputType.phone,
              onSaved: (phone) => _user!.phone = phone,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              prefix: const Icon(LineIcons.genderless),
              controller: TextEditingController(
                text: _user!.gender ?? '',
              ),
              hintText: S.current.gender,
              readOnly: true,
              onTap: () async {
                var result = await DialogService.of(context).bottomChoose(
                  title: S.current.choose_gender,
                  values: genderType,
                );
                if (result != null) {
                  _user!.gender = result;
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
                text: _user!.dob == null ? '' : _user!.dob!.dobValue,
              ),
              hintText: S.current.date_of_birth,
              readOnly: true,
              onTap: () async {
                _formKey.currentState!.save();
                var dateFormatter = DateFormat('yyyy/MM/dd');
                var initDate = dateFormatter.parse(_user!.dob ?? '1990/01/01');
                var chooseDate = await showDatePicker(
                  context: context,
                  initialDate: initDate,
                  firstDate: dateFormatter.parse('1900/01/01'),
                  lastDate: dateFormatter.parse('2010/12/31'),
                );
                if (chooseDate != null) {
                  _user!.dob = dateFormatter.format(chooseDate);
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            widget.isLogin
                ? CustomFillButton(
                    title: S.current.upt_profile.toUpperCase(),
                    onTap: () async {
                      _formKey.currentState!.save();
                      FocusScope.of(context).unfocus();

                      // var resp = await _user.update(context);
                      // if (resp == null) {
                      //   if (widget.onNext != null) {
                      //     widget.onNext!(_user, _user.id!);
                      //   }
                      // } else {
                      //   DialogService.of(context).showSnackBar(
                      //     resp,
                      //     type: SnackBarType.error,
                      //   );
                      // }
                    },
                  )
                : CustomFillButton(
                    title: S.current.next.toUpperCase(),
                    onTap: () async {
                      _formKey.currentState!.save();
                      FocusScope.of(context).unfocus();
                      // var resp = await _user.add(context);
                      // if (resp == null) {
                      //   if (widget.onNext != null) {
                      //     widget.onNext!(_user, _user.id!);
                      //   }
                      // } else {
                      //   DialogService.of(context).showSnackBar(
                      //     resp,
                      //     type: SnackBarType.error,
                      //   );
                      // }
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
