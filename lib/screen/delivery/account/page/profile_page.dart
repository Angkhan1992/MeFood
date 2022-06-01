import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/user_model.dart';
import 'package:mefood/service/dialog_service.dart';
import 'package:mefood/widget/common/button.dart';
import 'package:mefood/widget/delivery/account.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;
  final Function(UserModel)? updateUser;

  const ProfilePage({
    Key? key,
    required this.user,
    this.updateUser,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? user;
  var isUpdated = false;

  @override
  void initState() {
    super.initState();
    user = widget.user.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          accountItemWidget(
            context,
            title: user!.email!,
            leading: Icon(
              Icons.email,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var email = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.email_outlined),
                title: 'Update Email',
                hintText: 'Email Address',
                initValue: user!.email,
                keyboardType: TextInputType.emailAddress,
              );
              if (email != null && email.isNotEmpty) {
                if (email.validateEmail == null) {
                  if (email == user!.email) {
                    DialogService.of(context).showSnackBar(
                      'Not Changed Email!',
                      type: SnackBarType.waring,
                    );
                    return;
                  }
                  setState(() {
                    isUpdated = true;
                    user!.email = email;
                  });
                } else {
                  DialogService.of(context).showSnackBar(
                    'Invalid Email Type',
                    type: SnackBarType.error,
                  );
                }
              }
            },
          ),
          accountItemWidget(
            context,
            title: user!.phone!,
            leading: Icon(
              Icons.phone_android,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var phone = await DialogService.of(context).oneValueField(
                prefix: Icon(Icons.phone_android),
                title: 'Update Phone Number',
                hintText: 'Phone Number',
                initValue: user!.phone,
                keyboardType: TextInputType.phone,
              );
              if (phone != null && phone.isNotEmpty) {
                if (phone == user!.phone) {
                  DialogService.of(context).showSnackBar(
                    'Not Changed Phone Number!',
                    type: SnackBarType.waring,
                  );
                  return;
                }
                setState(() {
                  isUpdated = true;
                  user!.phone = phone;
                });
              }
            },
          ),
          accountItemWidget(
            context,
            title: user!.dob!.dobValue,
            leading: Icon(
              Icons.calendar_month,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var dateFormatter = DateFormat('yyyy/MM/dd');
              var initDate = dateFormatter.parse(user!.dob ?? '1990/01/01');
              var chooseDate = await showDatePicker(
                context: context,
                initialDate: initDate,
                firstDate: dateFormatter.parse('1900/01/01'),
                lastDate: dateFormatter.parse('2010/12/31'),
              );
              if (chooseDate != null) {
                var dateString = dateFormatter.format(chooseDate);
                if (dateString == user!.dob) {
                  DialogService.of(context).showSnackBar(
                    'Not Changed Birthday!',
                    type: SnackBarType.waring,
                  );
                  return;
                }
                setState(() {
                  isUpdated = true;
                  user!.dob = dateFormatter.format(chooseDate);
                });
              }
            },
          ),
          accountItemWidget(
            context,
            title: user!.gender!,
            leading: Icon(
              user!.gender! == 'MALE' ? Icons.male : Icons.female,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var gender = await DialogService.of(context).bottomChoose(
                title: 'Choose Gender',
                values: [
                  'MALE',
                  'FEMALE',
                ],
              );
              if (gender != null) {
                if (gender == user!.gender) {
                  DialogService.of(context).showSnackBar(
                    'Not Changed Gender!',
                    type: SnackBarType.waring,
                  );
                  return;
                }
                setState(() {
                  isUpdated = true;
                  user!.gender = gender;
                });
              }
            },
          ),
          accountItemWidget(
            context,
            title: user!.regdate!.regdateValue,
            leading: Icon(
              Icons.join_full,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Update Profile'.toUpperCase(),
            onTap: isUpdated
                ? () async {
                    var resp = await user!.update(context);
                    if (resp != null) {
                      DialogService.of(context).showSnackBar(
                        resp,
                        type: SnackBarType.error,
                      );
                      return;
                    }
                    if (widget.updateUser != null) {
                      widget.updateUser!(user!);
                    }
                  }
                : null,
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomOutlineButton(
            title: 'Update Password'.toUpperCase(),
            onTap: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomFillButton(
            title: 'Delete Account'.toUpperCase(),
            backgroundColor: Colors.red,
            onTap: () {},
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
