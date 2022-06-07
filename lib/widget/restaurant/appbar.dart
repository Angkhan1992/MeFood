import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:mefood/widget/restaurant/restaurant.dart';

class FooterView extends StatefulWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    var leftIcons = [
      {
        'icon': LineIcons.facebookF,
        'action': () {},
      },
      {
        'icon': LineIcons.linkedinIn,
        'action': () {},
      },
      {
        'icon': LineIcons.twitter,
        'action': () {},
      },
      {
        'icon': LineIcons.youtube,
        'action': () {},
      },
      {
        'icon': LineIcons.instagram,
        'action': () {},
      },
    ];
    var rightIcons = [
      {
        'icon': LineIcons.apple,
        'action': () {},
      },
      {
        'icon': LineIcons.android,
        'action': () {},
      },
    ];
    var links = [
      [
        {
          'title': 'About US',
          'action': () {},
        },
        {
          'title': 'Term & Conditions',
          'action': () {},
        },
        {
          'title': 'Privacy & Policy',
          'action': () {},
        },
      ],
      [
        {
          'title': 'MeFood Learn',
          'action': () {},
        },
        {
          'title': 'Customer App',
          'action': () {},
        },
        {
          'title': 'Delivery App',
          'action': () {},
        },
      ],
      [
        {
          'title': 'Feedback',
          'action': () {},
        },
        {
          'title': 'Report to MeFood',
          'action': () {},
        },
        {
          'title': 'Support with MeFood',
          'action': () {},
        },
      ],
    ];

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var row in links) ...{
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var link in row) ...{
                      (link['title'] as String).wText(
                        TextStyle(
                          fontSize: 12.0,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    },
                  ],
                ),
              ),
            },
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              'Follow Us'.wText(
                TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              for (var icon in leftIcons) ...{
                const SizedBox(
                  width: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor.withOpacity(0.3),
                  ),
                  child: Icon(
                    icon['icon'] as IconData,
                    size: 18.0,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              },
              const Spacer(),
              'Mobile app'.wText(
                TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              for (var icon in rightIcons) ...{
                const SizedBox(
                  width: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor.withOpacity(0.3),
                  ),
                  child: Icon(
                    icon['icon'] as IconData,
                    size: 18.0,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              },
            ],
          ),
        ),
        Divider(),
        const SizedBox(height: 24.0),
        '© 2020 - 2022   KYGABYTE IT SOLUTION Inc.'.wText(
          TextStyle(
            fontSize: 12.0,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1000.0),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      height: 56.0,
      child: Row(
        children: [
          WebLogo(),
          const Spacer(),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            offset: Offset(0.0, 24.0),
            elevation: 1,
            itemBuilder: (context) {
              return [
                CustomMenuItem(
                  icon: Icon(
                    LineIcons.user,
                    size: 18.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: 'ACCOUNT',
                  color: Theme.of(context).colorScheme.secondary,
                ),
                CustomMenuItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      'assets/icons/menu/ic_sign.svg',
                      color: Colors.red,
                      width: 14.0,
                      height: 14.0,
                    ),
                  ),
                  title: 'LOGOUT',
                  color: Colors.red,
                ),
              ];
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    LineIcons.user,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Black Gold',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text('Owner'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
