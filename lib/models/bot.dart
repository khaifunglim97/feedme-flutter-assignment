import 'package:feed_me_assignment/main.dart';
import 'package:flutter/material.dart';

enum BotStatus {
  idle('IDLE'),
  working('WORKING');

  final String name;

  const BotStatus(this.name);
}

class Bot extends ChangeNotifier {
  final int id;
  BotStatus status;
  int orderId = -1;

  Bot()
      : id = getBotId(),
        status = BotStatus.idle;

  bool isIdle() => status == BotStatus.idle;

  void setWorking(int orderId) {
    status = BotStatus.working;
    this.orderId = orderId;
  }

  void setIdle() {
    status = BotStatus.idle;
    orderId = -1;
  }

  bool isProcessingOrder() => orderId > 0;
}
