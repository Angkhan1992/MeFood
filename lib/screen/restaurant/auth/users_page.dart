import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class UsersPage extends StatefulWidget {
  final Function(MemberModel admin, MemberModel user)? onNext;
  final Function()? onPrevious;

  UsersPage({
    Key? key,
    this.onNext,
    this.onPrevious,
  }) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var admin = MemberModel();
  String adminPass = '', adminRepass = '';
  bool isAdminPassVisible = true, isAdminRepassVisible = true;

  var user = MemberModel();
  String userPass = '', userRepass = '';
  bool isUserPassVisible = true, isUserRepassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Row(
            children: [
              const SizedBox(width: 24.0),
              Text(
                'Add Users',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 16.0),
            ],
          ),
          const SizedBox(height: 24.0),
          Container(
            padding: const EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [kShadowContainer],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Admin Photo'.subtitle,
                          const SizedBox(height: 24.0),
                          WebCachImage(
                            url: admin.linkAvatar ?? '',
                            shortDesc: '300 * 300 Avatar',
                            picker: () async {
                              var result = await FilePicker.platform.pickFiles(
                                withReadStream: true,
                              );
                              if (result != null) {
                                var file = result.files.single;
                                var resp = await APIService.of(context).upload(
                                  path: 'avatar',
                                  webFile: file,
                                  // filePath: file.path,
                                );
                                if (resp['ret'] == 10000) {
                                  var imageUrl = '$kUrlAvatar${resp['result']}';
                                  setState(() {
                                    admin.linkAvatar = imageUrl;
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          S.current.admin_info.subtitle,
                          const SizedBox(height: 24.0),
                          CustomTextField(
                            prefix: Icon(LineIcons.user),
                            hintText: S.current.full_name,
                            // onChanged: (value) => admin.fullName = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.email_outlined),
                            hintText: S.current.email_address,
                            onChanged: (value) => admin.email = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.phone_android),
                            hintText: S.current.phone_number,
                            onChanged: (value) => admin.phone = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.lock),
                            hintText: S.current.password,
                            suffix: InkWell(
                              onTap: () => setState(() {
                                isAdminPassVisible = !isAdminPassVisible;
                              }),
                              child: Icon(
                                isAdminPassVisible
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            obscureText: isAdminPassVisible,
                            onChanged: (value) => adminPass = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.lock),
                            hintText: S.current.confirm_password,
                            suffix: InkWell(
                              onTap: () => setState(() {
                                isAdminRepassVisible = !isAdminRepassVisible;
                              }),
                              child: Icon(
                                isAdminRepassVisible
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            obscureText: isAdminRepassVisible,
                            onChanged: (value) => adminRepass = value,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'User Photo'.subtitle,
                          const SizedBox(height: 24.0),
                          WebCachImage(
                            url: user.linkAvatar ?? '',
                            shortDesc: '300 * 300 Avatar',
                            picker: () async {
                              var result = await FilePicker.platform.pickFiles(
                                withReadStream: true,
                              );
                              if (result != null) {
                                var file = result.files.single;
                                var resp = await APIService.of(context).upload(
                                  path: 'avatar',
                                  webFile: file,
                                  // filePath: file.path,
                                );
                                if (resp['ret'] == 10000) {
                                  var imageUrl = '$kUrlAvatar${resp['result']}';
                                  setState(() {
                                    user.linkAvatar = imageUrl;
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          S.current.user_info.subtitle,
                          const SizedBox(height: 24.0),
                          CustomTextField(
                            prefix: Icon(LineIcons.user),
                            hintText: S.current.full_name,
                            // onChanged: (value) => user.fullName = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.email_outlined),
                            hintText: S.current.email_address,
                            onChanged: (value) => user.email = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.phone_android),
                            hintText: S.current.phone_number,
                            onChanged: (value) => user.phone = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.lock),
                            hintText: S.current.password,
                            suffix: InkWell(
                              onTap: () => setState(() {
                                isAdminPassVisible = !isAdminPassVisible;
                              }),
                              child: Icon(
                                isAdminPassVisible
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            obscureText: isAdminPassVisible,
                            onChanged: (value) => userPass = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.lock),
                            hintText: S.current.confirm_password,
                            suffix: InkWell(
                              onTap: () => setState(() {
                                isAdminRepassVisible = !isAdminRepassVisible;
                              }),
                              child: Icon(
                                isAdminRepassVisible
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            obscureText: isAdminRepassVisible,
                            onChanged: (value) => userRepass = value,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlineButton(
                        title: S.current.previous,
                        onTap: widget.onPrevious,
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      child: CustomFillButton(
                        title: S.current.next,
                        onTap: onNext,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onNext() {
    var errorAdmin = admin.hasFullData;
    if (errorAdmin != null) {
      Fluttertoast.showToast(msg: errorAdmin);
      return;
    }
    if (adminPass != adminRepass) {
      Fluttertoast.showToast(msg: 'Invalid Password');
      return;
    }
    var errorUser = user.hasFullData;
    if (errorUser != null) {
      Fluttertoast.showToast(msg: errorUser);
      return;
    }
    if (userPass != userRepass) {
      Fluttertoast.showToast(msg: 'Invalid Password');
      return;
    }
    if (widget.onNext != null) {
      widget.onNext!(admin, user);
    }
  }
}
