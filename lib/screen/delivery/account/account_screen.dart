import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/screen/delivery/account/page/address_page.dart';
import 'package:mefood/screen/delivery/account/page/delivery_page.dart';
import 'package:mefood/screen/delivery/account/page/profile_page.dart';
import 'package:mefood/widget/base/base.dart';

class AccountScreen extends StatefulWidget {
  final MemberModel? member;
  final AddressModel? address;
  final CarModel? car;

  const AccountScreen({
    Key? key,
    this.member,
    this.address,
    this.car,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var selectedTap = 0;
  final selectedEvent = ValueNotifier(0);

  MemberModel? user;

  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.my_profile.toUpperCase()),
        actions: [TextActionButton(title: S.current.verify.toUpperCase())],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: 90.0,
              height: 90.0,
              child: Stack(
                children: [
                  CircleAvatarNetwork(
                    avatar: user!.linkAvatar,
                    borderColor: Theme.of(context).colorScheme.secondary,
                    size: 90.0,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async {
                        // var filePath =
                        //     await ImagePickerService.of(context).picker();
                        // if (filePath != null) {
                        //   var respAvatar = await APIService.of().upload(
                        //     path: 'upload/avatar',
                        //     filePath: filePath,
                        //   );
                        //   if (respAvatar['ret'] == 10000) {
                        //     var avatarUrl =
                        //         '$kUrlAvatar${respAvatar['result']}';
                        //     logger.d(avatarUrl);
                        //     user!.avatar = avatarUrl;
                        //     var respUser = await user!.update(context);
                        //     if (respUser == null) {
                        //       widget.provider.setUser(user!);
                        //     } else {
                        //       user!.avatar = widget.provider.user!.avatar;
                        //     }
                        //     setState(() {});
                        //   } else {
                        //     DialogService.of(context).showSnackBar(
                        //       S.current.upload_image_failed,
                        //       type: SnackBarType.error,
                        //     );
                        //   }
                        // }
                      },
                      child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 26.0,
                ),
                user!.fullName.wText(
                  TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                InkWell(
                  onTap: () async {
                    // var values = await DialogService.of(context).twoValueField(
                    //   title: S.current.change_name,
                    //   hintText: [S.current.first_name, S.current.last_name],
                    //   initValue: [user!.first!, user!.last!],
                    //   prefix: Icon(Icons.account_circle_outlined),
                    // );
                    // if (values != null) {
                    //   user!.first = values[0];
                    //   user!.last = values[1];
                    //   var resp = await user!.update(context);
                    //   if (resp != null) {
                    //     user!.first = widget.provider.user!.first;
                    //     user!.last = widget.provider.user!.last;
                    //   } else {
                    //     widget.provider.setUser(user!);
                    //   }
                    //   setState(() {});
                    // }
                  },
                  child: Icon(
                    Icons.edit,
                    size: 18.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            tapWidget(),
          ],
        ),
      ),
    );
  }

  Widget tapWidget() {
    var selectedColor = Theme.of(context).colorScheme.secondary;
    var selectedTextColor = Theme.of(context).scaffoldBackgroundColor;
    var screens = [
      ProfilePage(
        user: user!,
        updateUser: (user) {
          // widget.provider.setUser(user);
        },
      ),
      AddressPage(
        address: widget.address!,
        updateAddress: (address) {
          // widget.provider.setAddress(address);
        },
      ),
      DeliveryPage(
        car: widget.car!,
      ),
    ];
    return Expanded(
      child: ValueListenableBuilder<int>(
        valueListenable: selectedEvent,
        builder: (context, v, w) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => selectedEvent.value = 0,
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: v == 0 ? selectedColor : Colors.transparent,
                          border: Border.all(
                            color: selectedColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            bottomLeft: Radius.circular(24.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.current.my_profile.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: v == 0 ? selectedTextColor : selectedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => selectedEvent.value = 1,
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: v == 1 ? selectedColor : Colors.transparent,
                          border: Border(
                            top: BorderSide(
                              color: selectedColor,
                            ),
                            bottom: BorderSide(
                              color: selectedColor,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.current.address.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: v == 1 ? selectedTextColor : selectedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => selectedEvent.value = 2,
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: v == 2 ? selectedColor : Colors.transparent,
                          border: Border.all(
                            color: selectedColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.current.delivery.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: v == 2 ? selectedTextColor : selectedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Expanded(child: screens[v]),
            ],
          );
        },
      ),
    );
  }
}
