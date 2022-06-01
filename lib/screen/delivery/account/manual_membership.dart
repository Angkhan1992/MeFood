import 'package:flutter/material.dart';

class ManualMembership extends StatefulWidget {
  ManualMembership({Key? key}) : super(key: key);

  @override
  State<ManualMembership> createState() => _ManualMembershipState();
}

class _ManualMembershipState extends State<ManualMembership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Membership'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
