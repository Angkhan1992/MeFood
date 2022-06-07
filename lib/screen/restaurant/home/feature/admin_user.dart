import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';

class AdminUser extends StatefulWidget {
  AdminUser({Key? key}) : super(key: key);

  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Admin Users'.pageTitle,
        const SizedBox(height: 24.0),
      ],
    );
  }
}
