import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';
import '../models/orders_list.dart';
import 'common_widgets.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrdersList>();
    final pendingOrders = orders.pendingOrders;
    final completedOrders = orders.completedOrders;
    return Column(
      children: [
        ItemListView(
          icon: Icons.incomplete_circle,
          title: 'PENDING',
          itemList: pendingOrders,
          listItemBuilder: (context, index) {
            return Text(
              'Order ${pendingOrders[index].id}: ${pendingOrders[index].type.name}',
            );
          },
        ),
        ItemListView(
          icon: Icons.check_circle,
          title: 'COMPLETE',
          itemList: completedOrders,
          listItemBuilder: (context, index) {
            return Text(
              'Order ${completedOrders[index].id}: ${completedOrders[index].type.name}',
            );
          },
        ),
        const Divider(),
        RowOfTwoButtons(
          leftButton: ElevatedButton(
            onPressed: () => orders.addNewPending(context, Order.normal()),
            child: const Text('New Normal Order'),
          ),
          rightButton: ElevatedButton(
            onPressed: () => orders.addNewPending(context, Order.vip()),
            child: const Text('New VIP Order'),
          ),
        ),
      ],
    );
  }
}
