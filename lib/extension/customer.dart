import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/customer/customer.dart';
import 'package:mefood/service/service.dart';

extension ECustomer on CustomerModel {
  String? get validate {
    return null;
  }

  Future<String?> register(
    BuildContext context, {
    required String pass,
  }) async {
    if (validate != null) {
      return validate;
    }

    var param = user!.toJson();
    param['pass'] = pass.generateMD5;

    var resp = await APIService.of(context).post(
      '${APIService.kUrlCustomerAuth}/register',
      {
        'user': jsonEncode(param),
      },
      checkToken: false,
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
