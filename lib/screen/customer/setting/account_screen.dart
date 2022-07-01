import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/screen/base/login_require.dart';
import 'package:mefood/screen/customer/setting/add_address.dart';
import 'package:mefood/screen/customer/setting/update_password.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/dimens.dart';
import 'package:mefood/widget/base/base.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var customer = context.read<CustomerProvider>().customer;
    var address = customer!.address;
    return Scaffold(
      appBar: CustomAppbar(context, title: 'My Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXMd,
        ),
        child: (customer.user == null)
            ? SafeArea(child: LoginRequire())
            : Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatarNetwork(
                        avatar: '$kDomain${customer.user!.linkAvatar}',
                        borderColor: Theme.of(context).colorScheme.secondary,
                        size: 90.0,
                      ),
                      Positioned(
                        right: 0.0,
                        bottom: 0.0,
                        child: InkWell(
                          onTap: () async {
                            var uri =
                                await ImagePickerService.of(context).picker();
                            if (uri != null) {
                              var resp = await APIService.of(context).upload(
                                path: 'avatar',
                                filePath: uri,
                              );
                              if (resp != null) {
                                if (resp['ret'] == 10000) {
                                  var imageUrl = '$kUrlAvatar${resp['result']}';
                                  setState(() {
                                    customer.user!.linkAvatar = imageUrl;
                                  });
                                }
                              }
                            }
                          },
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                size: 18.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: offsetLg),
                  CustomTextField(
                    prefix: const Icon(LineIcons.user),
                    controller:
                        TextEditingController(text: customer.user!.firstName),
                    hintText: S.current.first_name,
                    onChanged: (name) => customer.user!.firstName = name,
                  ),
                  const SizedBox(height: offsetBase),
                  CustomTextField(
                    prefix: const Icon(LineIcons.user),
                    controller:
                        TextEditingController(text: customer.user!.lastName),
                    hintText: S.current.last_name,
                    onChanged: (name) => customer.user!.lastName = name,
                  ),
                  const SizedBox(height: offsetBase),
                  CustomTextField(
                    prefix: const Icon(Icons.email_outlined),
                    controller:
                        TextEditingController(text: customer.user!.email),
                    hintText: S.current.email_user_id,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => customer.user!.email = value,
                  ),
                  const SizedBox(height: offsetBase),
                  CustomTextField(
                    prefix: const Icon(LineIcons.phone),
                    controller:
                        TextEditingController(text: customer.user!.phone),
                    hintText: S.current.phone_number,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => customer.user!.phone = value,
                  ),
                  const SizedBox(height: offsetBase),
                  InkWell(
                    onTap: () => NavigatorService.of(context).push(
                      screen: AddAddress(
                        address: address,
                      ),
                      pop: (value) {
                        if (value != null && mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    child: address == null
                        ? Row(
                            children: [
                              const SizedBox(width: 8.0),
                              Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Add Address',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              const Spacer(),
                            ],
                          )
                        : Row(
                            children: [
                              const SizedBox(width: 8.0),
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Update Address',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                  ),
                  const SizedBox(height: offsetLg),
                  CustomOutlineButton(
                    title: 'Change Password'.toUpperCase(),
                    onTap: () => NavigatorService.of(context).push(
                      screen: UpdatePassword(),
                    ),
                  ),
                  const SizedBox(height: offsetBase),
                  CustomFillButton(
                    title: S.current.update.toUpperCase(),
                    onTap: () {},
                  ),
                  const SizedBox(height: offsetLg * 2),
                  CustomOutlineButton(
                    title: S.current.logout.toUpperCase(),
                    borderColor: Colors.red,
                    onTap: () {},
                  ),
                  const SizedBox(height: offsetBase),
                  CustomFillButton(
                    title: 'Delete Account'.toUpperCase(),
                    backgroundColor: Colors.red,
                    onTap: () {},
                  ),
                ],
              ),
      ),
    );
  }
}
