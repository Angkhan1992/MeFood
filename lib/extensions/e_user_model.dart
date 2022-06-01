import 'package:flutter/widgets.dart';
import 'package:mefood/extensions/extensions.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/service/service.dart';

extension EUserModel on UserModel {
  bool get isFullData {
    if (first == null || first!.isEmpty) return false;
    if (last == null || last!.isEmpty) return false;
    if (avatar == null || avatar!.isEmpty) return false;
    if (email == null || email!.isEmpty) return false;
    if (phone == null || phone!.isEmpty) return false;
    if (gender == null || gender!.isEmpty) return false;
    if (dob == null || dob!.isEmpty) return false;

    return true;
  }

  String get fullName => '$last $first';

  Future<String?> update(BuildContext? context) async {
    if (!isFullData) {
      return S.current.input_all_fields;
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
    if (!isFullData) return 'Please fill full data';

    var resp = await APIService.of(context: context).post(
      APIService.kUrlAuth + '/registerUser',
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
      APIService.kUrlAuth + '/regDeliveryPassword',
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
