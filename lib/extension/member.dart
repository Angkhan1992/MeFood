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

  Future<String?> update(BuildContext? context) async {
    if (hasFullData != null) {
      return hasFullData;
    }
    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlAuth}/updateUser',
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

  Future<String?> add(BuildContext? context) async {
    if (hasFullData != null) {
      return hasFullData;
    }

    var resp = await APIService.of(context: context).post(
      APIService.kUrlAuthDelivery + '/registerUser',
      toJson(),
    );

    if (resp != null) {
      if (resp['ret'] == 10000) {
        id = resp['result']['user_id'] as int;
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  Future<String?> updatePassword(
    BuildContext? context, {
    required String pass,
  }) async {
    // if (!pass.validatePassword) return 'Invalid password';
    var resp = await APIService(context: context).post(
      APIService.kUrlAuthDelivery + '/registerPassword',
      {
        'usr_id': id,
        'password': pass.generateMD5,
      },
    );

    if (resp != null) {
      if (resp['ret'] == 10000) {
        id = resp['result']['user_id'] as int;
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
