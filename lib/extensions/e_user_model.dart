import 'package:flutter/widgets.dart';
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
      return 'Failed Server Error';
    }
  }
}
