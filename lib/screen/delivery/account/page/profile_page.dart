import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/dialog_service.dart';
import 'package:mefood/util/config.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/delivery/account.dart';

class ProfilePage extends StatefulWidget {
  final MemberModel user;
  final Function(MemberModel)? updateUser;

  const ProfilePage({
    Key? key,
    required this.user,
    this.updateUser,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MemberModel? user;
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
                title: '${S.current.update} ${S.current.email_address}',
                hintText: S.current.email_address,
                initValue: user!.email,
                keyboardType: TextInputType.emailAddress,
              );
              if (email != null && email.isNotEmpty) {
                if (email.validateEmail == null) {
                  if (email == user!.email) {
                    return;
                  }
                  setState(() {
                    isUpdated = true;
                    user!.email = email;
                  });
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
                title: '${S.current.update} ${S.current.phone_number}',
                hintText: S.current.phone_number,
                initValue: user!.phone,
                keyboardType: TextInputType.phone,
              );
              if (phone != null && phone.isNotEmpty) {
                if (phone == user!.phone) {
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
              user!.gender! == S.current.type_male.toUpperCase()
                  ? Icons.male
                  : Icons.female,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () async {
              var gender = await DialogService.of(context).bottomChoose(
                title: S.current.choose_gender,
                values: genderType,
              );
              if (gender != null) {
                if (gender == user!.gender) {
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
                    // var resp = await user!.update(context);
                    // if (resp != null) {
                    //   DialogService.of(context).showSnackBar(
                    //     resp,
                    //     type: SnackBarType.error,
                    //   );
                    //   return;
                    // }
                    // if (widget.updateUser != null) {
                    //   widget.updateUser!(user!);
                    //   DialogService.of(context).showSnackBar(
                    //     S.current.success_data_updated,
                    //   );
                    // }
                  }
                : null,
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomOutlineButton(
            title: '${S.current.update} ${S.current.password}'.toUpperCase(),
            onTap: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomFillButton(
            title: S.current.remove_account.toUpperCase(),
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
