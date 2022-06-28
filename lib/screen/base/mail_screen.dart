import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/provider/base/base.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/service/dialog_service.dart';
import 'package:mefood/service/navigator_service.dart';
import 'package:mefood/widget/base/base.dart';

import 'mail_detail.dart';

class MailScreen extends StatefulWidget {
  final MemberModel user;

  const MailScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  final _controller = ScrollController();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    Timer.run(fetchDate);
  }

  void _onRefresh() async {
    var provider = context.read<MailProvider>();
    await provider.fetchMails(widget.user.id!);
    _refreshController.refreshCompleted();
  }

  void fetchDate() async {
    var provider = context.read<MailProvider>();
    var resp = await provider.fetchMails(widget.user.id!);
    if (resp != null) {
      DialogService.of(context).showSnackBar(
        resp,
        type: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppbar(
            context,
            title: provider.checkAmount() == 0
                ? S.current.inbox.toUpperCase()
                : '${provider.checkAmount()} ${S.current.selected}',
            icon: provider.isEditing
                ? InkWell(
                    child: Icon(
                      provider.isCheckAll()
                          ? Icons.checklist_rtl
                          : Icons.checklist,
                    ),
                    onTap: () => provider.isCheckAll()
                        ? provider.deselecteAll()
                        : provider.selecteAll(),
                  )
                : null,
            actions: [
              TextActionButton(
                title: (provider.isEditing ? S.current.cancel : S.current.edit)
                    .toUpperCase(),
                onTap: () => provider.setEditing(!provider.isEditing),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  enablePullDown: true,
                  child: SingleChildScrollView(
                    controller: _controller,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomTextField(
                            prefix: Icon(Icons.search),
                            hintText: S.current.search,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ListView.separated(
                          controller: _controller,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var mail = provider.getMails()[i];
                            var email = mail.model;
                            return Slidable(
                              key: const ValueKey(0),
                              enabled: !provider.isEditing,
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  if (mail.model.status ==
                                      S.current.unread.toUpperCase())
                                    SlidableAction(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      foregroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      icon: Icons.check_outlined,
                                      label: S.current.read.toUpperCase(),
                                      onPressed: (context) =>
                                          provider.updateMailByIndex(
                                        i,
                                        status: S.current.read,
                                      ),
                                    ),
                                  SlidableAction(
                                    onPressed: (context) =>
                                        provider.updateMailByIndex(
                                      i,
                                      status: S.current.delete,
                                    ),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    icon: Icons.delete_forever,
                                    label: S.current.delete.toUpperCase(),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: InkWell(
                                  onTap: () {
                                    if (provider.isEditing) {
                                      provider.toggleItemAtIndex(i);
                                    } else {
                                      NavigatorService.of(context).push(
                                          screen: MailDetail(
                                        mail: mail,
                                        unread: provider.getUnreadCount(),
                                        index: i,
                                      ));
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      if (provider.isEditing)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Center(
                                            child: Icon(
                                              mail.isSelected
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                          ),
                                        ),
                                      Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                              vertical: 6.0,
                                            ),
                                            width: 12.0,
                                            height: 12.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              color: email.status ==
                                                      S.current.unread
                                                          .toUpperCase()
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                  : Colors.transparent,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 60.0,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: email.title!.wText(
                                                    TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8.0,
                                                ),
                                                email.regdate!.visiableDate
                                                    .wText(
                                                  TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                provider.isEditing
                                                    ? SizedBox(
                                                        height: 24.0,
                                                      )
                                                    : Icon(
                                                        Icons.arrow_right,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                      ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            email.subtitle!.wText(
                                              TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            email.content!.wText(
                                              TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w200,
                                              ),
                                              lines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Divider(),
                            );
                          },
                          itemCount: provider.getMails().length,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border(
                      top: BorderSide(color: Theme.of(context).hintColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      MainMenuButton(
                        title: S.current.as_read,
                        isEnabled: provider.isAllUnRead() != null &&
                            provider.isAllUnRead()!,
                        onTap: () async {
                          var resp = await provider.onAsRead();
                          if (resp != null) {
                            DialogService.of(context).showSnackBar(
                              resp,
                              type: SnackBarType.error,
                            );
                          }
                        },
                      ),
                      const Spacer(),
                      MainMenuButton(
                        title: S.current.delete,
                        isEnabled: provider.isAllUnRead() != null,
                        onTap: () => provider.onDelete(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
