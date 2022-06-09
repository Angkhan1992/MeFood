import 'package:flutter/cupertino.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/base/base.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/util.dart';

extension ESupportModel on SupportModel {
  Future<String?> submit(
    BuildContext context, {
    required int userId,
  }) async {
    var param = {
      'mem_id': userId,
      'email': email,
      'type': type,
      'category': category,
      'content': content,
    };
    logger.d('${APIService.kUrlSupport}/blockAccount');
    var resp = await APIService.of(context).post(
      '${APIService.kUrlSupport}/blockAccount',
      param,
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
