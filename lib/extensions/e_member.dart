import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';

extension EMemberModel on MemberModel {
  String? hasFullData(String? pass) {
    if (name == null || name!.isEmpty) {
      return '${S.current.empty} ${S.current.name}';
    }
    if (avatar == null || avatar!.isEmpty) {
      return '${S.current.empty} ${S.current.avatar}';
    }
    if (email == null || email!.isEmpty) {
      return '${S.current.empty} ${S.current.email_address}';
    }
    if (phone == null || phone!.isEmpty) {
      return '${S.current.empty} ${S.current.phone_number}';
    }
    if (pass == null || pass.isEmpty) {
      return '${S.current.empty} ${S.current.password}';
    }
    return null;
  }
}
