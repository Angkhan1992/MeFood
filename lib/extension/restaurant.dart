import 'package:mefood/extension/extension.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/model.dart';

extension ERestaurantModel on RestaurantModel {
  String? get hasFullData {
    if (address!.hasFullData != null) {
      return '${address!.hasFullData} on ${S.current.address}';
    }
    if (name == null || name!.isEmpty) {
      return '${S.current.empty} ${S.current.name}';
    }
    if (email == null || email!.isEmpty) {
      return '${S.current.empty} ${S.current.email_address}';
    }
    if (phone == null || phone!.isEmpty) {
      return '${S.current.empty} ${S.current.phone_number}';
    }
    if (logo == null || logo!.isEmpty) {
      return '${S.current.empty} ${S.current.logo}';
    }
    if (galleries == null || galleries!.isEmpty) {
      return '${S.current.empty} ${S.current.galleries}';
    }
    if (category == null || category!.isEmpty) {
      return '${S.current.empty} ${S.current.category}';
    }
    return null;
  }
}
