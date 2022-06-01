import 'package:flutter/widgets.dart';
import 'package:mefood/model/model.dart';

class OrderProvider extends ChangeNotifier {
  OrderModel? _acceptedOrder;
  final List<OrderModel> _pendingOrders = [];

  OrderModel? getAcceptedOrder() {
    return _acceptedOrder;
  }

  List<OrderModel> getPendingOrders() {
    return _pendingOrders;
  }

  void addPendingOrder(OrderModel model) {
    _pendingOrders.add(model);
    notifyListeners();
  }

  void acceptOrder(OrderModel model) {
    _acceptedOrder = model;
    notifyListeners();
  }
}
