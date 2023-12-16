import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bot.dart';
import '../models/bots_list.dart';
import 'common_widgets.dart';

class BotsWidget extends StatelessWidget {
  const BotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final botsList = context.watch<BotsList>();
    final bots = botsList.bots;
    return Column(
      children: [
        ItemListView(
          icon: Icons.manage_accounts,
          title: 'BOTS',
          itemList: bots,
          listItemBuilder: (context, index) {
            return Text('Bot ${bots[index].id}: ${bots[index].status.name}');
          },
        ),
        const Divider(),
        RowOfTwoButtons(
          leftButton: ElevatedButton(
            onPressed: () => botsList.killLatestBot(context),
            child: const Text('- Bot'),
          ),
          rightButton: ElevatedButton(
            onPressed: () {
              final bot = Bot();
              botsList.addBot(bot);
              botsList.processNextOrder(context, bot);
            },
            child: const Text('+ Bot'),
          ),
        ),
      ],
    );
  }
}
