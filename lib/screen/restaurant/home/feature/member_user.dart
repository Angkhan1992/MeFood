import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

class MemberUser extends StatefulWidget {
  MemberUser({Key? key}) : super(key: key);

  @override
  State<MemberUser> createState() => _MemberUserState();
}

class _MemberUserState extends State<MemberUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Member Users'.pageTitle,
        const SizedBox(height: 24.0),
      ],
    );
  }
}
