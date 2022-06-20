import 'package:flutter/material.dart';
import 'package:mefood/widget/base/base.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, title: 'Inbox'),
    );
  }
}
