import 'package:flutter/material.dart';

import 'bots_widget.dart';
import 'orders_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: const [
          OrdersWidget(),
          BotsWidget(),
        ],
      ),
    );
  }
}
