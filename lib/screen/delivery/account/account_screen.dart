import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/user_model.dart';
import 'package:mefood/provider/provider.dart';
import 'package:mefood/screen/delivery/account/page/address_page.dart';
import 'package:mefood/screen/delivery/account/page/delivery_page.dart';
import 'package:mefood/screen/delivery/account/page/profile_page.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';
import 'package:mefood/widget/common/common.dart';

class AccountScreen extends StatefulWidget {
  final DeliveryProvider provider;

  const AccountScreen({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var selectedTap = 0;
  final selectedEvent = ValueNotifier(0);

  UserModel? user;

  @override
  void initState() {
    super.initState();
    user = widget.provider.user!.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'.toUpperCase()),
        actions: [TextActionButton(title: 'Verify'.toUpperCase())],
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
                  AvatarImageWidget(
                    avatar: user!.avatar,
                    borderColor: Theme.of(context).colorScheme.secondary,
                    size: 90.0,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async {
                        var filePath =
                            await ImagePickerService.of(context).picker();
                        if (filePath != null) {
                          var respAvatar = await APIService.of().upload(
                            path: 'upload/avatar',
                            filePath: filePath,
                          );
                          if (respAvatar['ret'] == 10000) {
                            var avatarUrl =
                                '$kUrlAvatar${respAvatar['result']}';
                            logger.d(avatarUrl);
                            user!.avatar = avatarUrl;
                            var respUser = await user!.update(context);
                            if (respUser == null) {
                              widget.provider.setUser(user!);
                            } else {
                              user!.avatar = widget.provider.user!.avatar;
                            }
                            setState(() {});
                          } else {
                            DialogService.of(context).showSnackBar(
                              'Upload image failed',
                              type: SnackBarType.error,
                            );
                          }
                        }
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
                    var values = await DialogService.of(context).twoValueField(
                      title: 'Change Name',
                      hintText: ['First Name', 'Last Name'],
                      initValue: [user!.first!, user!.last!],
                      prefix: Icon(Icons.account_circle_outlined),
                    );
                    if (values != null) {
                      user!.first = values[0];
                      user!.last = values[1];
                      var resp = await user!.update(context);
                      if (resp != null) {
                        user!.first = widget.provider.user!.first;
                        user!.last = widget.provider.user!.last;
                      } else {
                        widget.provider.setUser(user!);
                      }
                      setState(() {});
                    }
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
          widget.provider.setUser(user);
        },
      ),
      AddressPage(
        address: widget.provider.address!,
        updateAddress: (address) {
          widget.provider.setAddress(address);
        },
      ),
      DeliveryPage(
        car: widget.provider.car!,
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
                            'Profile'.toUpperCase(),
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
                            'Address'.toUpperCase(),
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
                            'Delivery'.toUpperCase(),
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
          }),
    );
  }
}
