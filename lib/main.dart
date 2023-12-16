import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bots_list.dart';
import 'models/orders_list.dart';
import 'widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

// To simulate global increasing orders id
int currentOrderId = 0;

int getOrderId() {
  return currentOrderId += 1;
}

int currentBotId = 0;

int getBotId() {
  return currentBotId += 1;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrdersList()),
        ChangeNotifierProvider(create: (_) => BotsList()),
      ],
      child: const MaterialApp(
        title: 'FeedMe Demo',
        home: MyHomePage(title: 'FeedMe Demo'),
      ),
    );
  }
}
