import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';

extension Sale on SaleModel {
  String get currency {
    return '₭ ${formatCurrency.format(product!.price! * productAmount!)}';
  }
}
