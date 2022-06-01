import 'package:flutter/cupertino.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';

extension ECenterModel on CenterModel {
  static Future<List<CenterModel>> getAllCenterData(
      BuildContext context) async {
    var resp = await APIService.of(context: context).post(
      '${APIService.kUrlSupport}/center',
      {},
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        try {
          return (resp['result'] as List)
              .map((e) => CenterModel.fromJson(e))
              .toList();
        } catch (e) {
          logger.d(e);
        }
      }
    }
    return [];
  }
}
