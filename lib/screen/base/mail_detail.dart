import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/widget/base/base.dart';
import 'package:provider/provider.dart';

class MailDetail extends StatefulWidget {
  final ExtMail mail;
  final int unread;
  final int index;

  const MailDetail({
    Key? key,
    required this.mail,
    required this.unread,
    required this.index,
  }) : super(key: key);

  @override
  State<MailDetail> createState() => _MailDetailState();
}

class _MailDetailState extends State<MailDetail> {
  MailProvider? provider;

  @override
  void initState() {
    super.initState();

    Timer.run(initData);
  }

  void initData() async {
    provider = Provider.of<MailProvider>(context, listen: false);
    if (widget.mail.model.status == S.current.unread.toUpperCase()) {
      await provider!.updateMailByIndex(
        widget.index,
        status: S.current.read.toUpperCase(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
        actions: [
          TextActionButton(
            title: S.current.delete.toUpperCase(),
            onTap: () async {
              await provider!.updateMailByIndex(
                widget.index,
                status: S.current.delete.toUpperCase(),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mail.model.title!,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                widget.mail.model.subtitle!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                widget.mail.model.content!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTitle() {
    var count = widget.unread;
    if (widget.mail.model.status == S.current.unread.toUpperCase()) {
      count--;
    }
    return count == 0
        ? Container()
        : Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: (widget.mail.model.title! +
                    ' (' +
                    (count > 99 ? '99+' : '$count') +
                    ')')
                .wText(
              TextStyle(
                fontSize: fontXMd,
              ),
            ),
          );
  }
}
