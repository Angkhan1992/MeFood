import 'package:flutter/material.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

extension EMemberModel on MemberModel {
  String? get hasFullData {
    if (firstName == null || firstName!.isEmpty) {
      return '${S.current.empty} ${S.current.name}';
    }
    if (lastName == null || lastName!.isEmpty) {
      return '${S.current.empty} ${S.current.password}';
    }
    if (email == null || email!.isEmpty) {
      return '${S.current.empty} ${S.current.email_address}';
    }
    if (phone == null || phone!.isEmpty) {
      return '${S.current.empty} ${S.current.phone_number}';
    }

    return null;
  }

  String get fullName => '$firstName $lastName';

  dynamic toRegisterJson(String pass) {
    var result = toJson();
    result['pass'] = pass.generateMD5;
    return result;
  }

  Future<String?> update(
    BuildContext? context, {
    String? password,
  }) async {
    var resp = await APIService.of(context).post(
      '${APIService.kUrlUser}/update',
      toJson(),
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
