import 'package:mefood/model/user_model.dart';

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
}
