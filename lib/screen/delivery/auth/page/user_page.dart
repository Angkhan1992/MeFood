import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../extensions/e_export.dart';
import '../../../../model/m_export.dart';
import '../../../../util/extensions.dart';
import '../../../../widget/common/button.dart';
import '../../../../widget/common/textfield.dart';

class AddProfilePage extends StatelessWidget {
  final Function(UserModel)? onNext;
  AddProfilePage({
    Key? key,
    this.onNext,
  }) : super(key: key);

  final _user = UserModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: SvgPicture.asset(
                        'assets/icons/menu/ic_profile.svg',
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Container(
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
                      hintText: 'First Name',
                      keyboardType: TextInputType.name,
                      onSaved: (name) => _user.first = name,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomTextField(
                      prefix: const Icon(LineIcons.user),
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
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            onSaved: (email) => _user.email = email,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(Icons.phone_android_outlined),
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
            onSaved: (phone) => _user.phone = phone,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(LineIcons.genderless),
            hintText: 'Male / Female',
            readOnly: true,
            onTap: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            prefix: const Icon(LineIcons.calendar),
            hintText: 'Date of Birth',
            readOnly: true,
            onTap: () {},
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomFillButton(
            title: 'Next'.toUpperCase(),
            onTap: () => onTapNext(),
          ),
        ],
      ),
    );
  }

  void onTapNext() async {
    if (onNext != null) {
      if (_user.isFullData) return;
      onNext!(_user);
    }
  }
}
