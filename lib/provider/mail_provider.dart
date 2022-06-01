import 'package:flutter/material.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/model/mail_model.dart';
import 'package:mefood/service/service.dart';

class MailProvider extends ChangeNotifier {
  List<ExtMail>? mails;
  bool isEditing = false;

  Future<void> initMails() async {
    mails = (await PrefService.of().getMailHistory())
        .map((e) => ExtMail.instanceOf(e))
        .toList();
    notifyListeners();
  }

  Future<String?> fetchMails(int usr_id) async {
    var resp = await APIService.of().post(
      '${APIService.kUrlHistory}/getMails',
      {
        'id': usr_id,
      },
    );
    if (resp!['ret'] == 10000) {
      mails!.clear();
      mails = (resp['result'] as List)
          .map((e) => ExtMail.instanceOf(MailModel.fromJson(e)))
          .toList();
      await PrefService.of()
          .saveMailHistory((mails!).map((e) => e.model).toList());
      notifyListeners();
      return null;
    } else {
      return 'Failed fetch mails';
    }
  }

  List<ExtMail> getMails() {
    return mails ?? [];
  }

  void setEditing(bool edit) {
    isEditing = edit;
    if (!isEditing) {
      for (var model in mails!) {
        model.isSelected = false;
      }
    }
    notifyListeners();
  }

  void selecteAll() {
    for (var model in mails!) {
      model.isSelected = true;
    }
    notifyListeners();
  }

  void deselecteAll() {
    for (var model in mails!) {
      model.isSelected = false;
    }
    notifyListeners();
  }

  void toggleItemAtIndex(int index) {
    var model = mails![index];
    model.isSelected = !model.isSelected;
    notifyListeners();
  }

  bool? isAllUnRead() {
    List<ExtMail> selectedItems = [];
    for (var item in mails!) {
      if (item.isSelected) {
        selectedItems.add(item);
      }
    }
    if (selectedItems.isEmpty) {
      return null;
    }
    var allUnread = true;
    for (var item in selectedItems) {
      if (item.model.status != 'UNREAD') {
        allUnread = false;
        break;
      }
    }
    return allUnread;
  }

  bool isCheckAll() {
    List<ExtMail> selectedItems = [];
    for (var item in mails!) {
      if (item.isSelected) {
        selectedItems.add(item);
      }
    }
    return selectedItems.length == mails!.length;
  }

  int checkAmount() {
    List<ExtMail> selectedItems = [];
    for (var item in mails!) {
      if (item.isSelected) {
        selectedItems.add(item);
      }
    }
    return selectedItems.length;
  }

  Future<void> updateMailByIndex(
    int index, {
    required String status,
  }) async {
    var mail = mails![index];
    await mail.updateMail(status);
    if (status == 'READ') {
      mail.model.status = status;
    } else {
      mails!.remove(mail);
    }
    await PrefService.of()
        .saveMailHistory((mails!).map((e) => e.model).toList());
    notifyListeners();
  }

  Future<String?> onAsRead() async {
    isEditing = false;
    notifyListeners();

    var noFailed = true;
    for (var item in mails!) {
      if (item.isSelected) {
        var resp = await item.updateMail('READ');
        if (resp != null) {
          noFailed = false;
        } else {
          item.model.status = 'READ';
        }
      }
    }
    await PrefService.of()
        .saveMailHistory((mails!).map((e) => e.model).toList());
    setEditing(false);
    if (noFailed) {
      return null;
    } else {
      return 'Failed some process';
    }
  }

  Future<String?> onDelete() async {
    isEditing = false;
    notifyListeners();

    var noFailed = true;
    List<ExtMail> deleteItems = [];
    for (var item in mails!) {
      if (item.isSelected) {
        var resp = await item.updateMail('DELETE');
        if (resp != null) {
          noFailed = false;
        } else {
          deleteItems.add(item);
        }
      }
    }
    for (var delete in deleteItems) {
      mails!.remove(delete);
    }

    await PrefService.of()
        .saveMailHistory((mails!).map((e) => e.model).toList());
    setEditing(false);
    if (noFailed) {
      return null;
    } else {
      return 'Failed some process';
    }
  }

  int getUnreadCount() {
    var unreadList = [];
    for (var mail in mails!) {
      if (mail.model.status == 'UNREAD') {
        unreadList.add(mail);
      }
    }
    return unreadList.length;
  }
}
