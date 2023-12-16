import '../main.dart';

enum OrderType {
  normal('Normal'),
  vip('VIP');

  final String name;

  const OrderType(this.name);
}

enum OrderStatus {
  pending,
  processing,
  complete,
}

class Order {
  final int id;
  final OrderType type;
  OrderStatus status;

  Order(this.id, this.type, this.status);

  Order.normal()
      : id = getOrderId(),
        type = OrderType.normal,
        status = OrderStatus.pending;

  Order.vip()
      : id = getOrderId(),
        type = OrderType.vip,
        status = OrderStatus.pending;

  Order.failed()
      : id = -1,
        type = OrderType.normal,
        status = OrderStatus.pending;

  bool isValid() => id > 0;

  bool isVip() => type == OrderType.vip;

  bool isProcessing() => status == OrderStatus.processing;

  bool isPending() => status == OrderStatus.pending;

  void setProcessing() => status = OrderStatus.processing;

  void setPending() => status = OrderStatus.pending;
}
