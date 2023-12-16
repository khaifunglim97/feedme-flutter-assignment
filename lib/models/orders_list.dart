import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bots_list.dart';
import 'order.dart';

class OrdersList extends ChangeNotifier {
  final _pendingVipOrders = <Order>[];
  final _pendingNormalOrders = <Order>[];
  final _completedOrders = <Order>[];

  List<Order> get pendingOrders => _pendingVipOrders + _pendingNormalOrders;

  List<Order> get completedOrders => _completedOrders;

  void addNewPending(BuildContext context, Order order) {
    if (order.isVip()) {
      _pendingVipOrders.add(order);
    } else {
      _pendingNormalOrders.add(order);
    }
    notifyListeners();

    final bots = context.read<BotsList>();
    bots.processNextOrder(context, null);
  }

  void completeOrder(int orderId) {
    for (final order in pendingOrders) {
      if (order.id == orderId && order.isProcessing()) {
        pendingOrders.remove(order);
        _pendingVipOrders.remove(order);
        _pendingNormalOrders.remove(order);
        _completedOrders.add(order);
        order.status = OrderStatus.complete;
        break;
      }
    }
    notifyListeners();
  }

  Order? getNextPendingOrder() {
    for (final order in pendingOrders) {
      if (order.isPending()) return order;
    }
    return null;
  }

  void setOrderToPending(int orderId) {
    for (final order in pendingOrders) {
      if (order.id == orderId) {
        order.setPending();
        notifyListeners();
        return;
      }
    }
  }
}
