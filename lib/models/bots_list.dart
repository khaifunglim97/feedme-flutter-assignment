import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bot.dart';
import 'orders_list.dart';

class BotsList extends ChangeNotifier {
  final _bots = <Bot>[];

  List<Bot> get bots => _bots;

  void addBot(Bot bot) {
    _bots.add(bot);
    notifyListeners();
  }

  Bot? getNextIdleBot() {
    for (final bot in _bots) {
      if (bot.isIdle()) return bot;
    }
    return null;
  }

  bool isBotAlive(Bot? bot) {
    if (bot == null) return false;
    for (final bots in _bots) {
      if (bots.id == bot.id) return true;
    }
    return false;
  }

  void processNextOrder(BuildContext context, Bot? bot) {
    final orders = context.read<OrdersList>();
    final order = orders.getNextPendingOrder();
    if (order == null || !order.isValid()) return;

    final nextBot = !isBotAlive(bot) ? getNextIdleBot() : bot;
    if (nextBot == null) return;

    if (kDebugMode) {
      print('Bot ${nextBot.id} will start process Order ${order.id}');
    }
    nextBot.setWorking(order.id);
    order.setProcessing();
    notifyListeners();

    Future.delayed(
      const Duration(seconds: 10),
      () {
        final orders = context.read<OrdersList>();

        if (isBotAlive(nextBot)) {
          orders.completeOrder(order.id);
          nextBot.setIdle();
          notifyListeners();
          if (kDebugMode) {
            print('Bot ${nextBot.id} has done processing Order ${order.id}');
          }
        }

        processNextOrder(context, nextBot);
      },
    );
  }

  Bot? killLatestBot(BuildContext context) {
    if (_bots.isEmpty) return null;

    final latestBot = _bots.removeLast();
    notifyListeners();

    final orders = context.read<OrdersList>();
    if (latestBot.isProcessingOrder()) {
      orders.setOrderToPending(latestBot.orderId);
    }

    return latestBot;
  }
}
