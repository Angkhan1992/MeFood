import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/common/common.dart';
import 'package:mefood/widget/restraurant/register_widget.dart';

class OwnerPage extends StatefulWidget {
  final Function()? onPrevious;
  final Function(MemberModel owner)? onNext;

  OwnerPage({
    Key? key,
    this.onPrevious,
    this.onNext,
  }) : super(key: key);

  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  var owner = MemberModel();
  String pass = '', repass = '';
  bool isPassVisible = true, isRepassVisible = true;

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
                S.current.owner_info,
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
                          'Owner Photo'.subtitle,
                          const SizedBox(height: 24.0),
                          WebCachImage(
                            url: owner.avatar ?? '',
                            shortDesc: '300 * 300 Avatar',
                            picker: () async {
                              var result = await FilePicker.platform.pickFiles(
                                withReadStream: true,
                              );
                              if (result != null) {
                                var file = result.files.single;
                                var resp = await APIService.of(context: context)
                                    .upload(
                                  path: 'upload/avatar',
                                  webFile: file,
                                  // filePath: file.path,
                                );
                                if (resp['ret'] == 10000) {
                                  var imageUrl = '$kUrlAvatar${resp['result']}';
                                  setState(() {
                                    owner.avatar = imageUrl;
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
                          S.current.owner_info.subtitle,
                          const SizedBox(height: 24.0),
                          CustomTextField(
                            prefix: Icon(LineIcons.user),
                            hintText: S.current.full_name,
                            onChanged: (value) => owner.name = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.email_outlined),
                            hintText: S.current.email_address,
                            onChanged: (value) => owner.email = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.phone_android),
                            hintText: S.current.phone_number,
                            onChanged: (value) => owner.phone = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.lock),
                            hintText: S.current.password,
                            suffix: InkWell(
                              onTap: () => setState(() {
                                isPassVisible = !isPassVisible;
                              }),
                              child: Icon(
                                isPassVisible
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            obscureText: isPassVisible,
                            onChanged: (value) => pass = value,
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextField(
                            prefix: Icon(Icons.lock),
                            hintText: S.current.confirm_password,
                            suffix: InkWell(
                              onTap: () => setState(() {
                                isRepassVisible = !isRepassVisible;
                              }),
                              child: Icon(
                                isRepassVisible
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            obscureText: isRepassVisible,
                            onChanged: (value) => repass = value,
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
    var error = owner.hasFullData(pass);
    if (error != null) {
      Fluttertoast.showToast(msg: error);
      return;
    }
    if (pass != repass) {
      Fluttertoast.showToast(msg: 'Invalid Password');
      return;
    }
    if (widget.onNext != null) {
      widget.onNext!(owner);
    }
  }
}
