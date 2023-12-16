import 'package:flutter/material.dart';

class ItemListView<T> extends StatelessWidget {
  const ItemListView({
    super.key,
    required this.icon,
    required this.title,
    required this.itemList,
    required this.listItemBuilder,
  });

  final IconData icon;
  final String title;
  final List<T> itemList;
  final Widget? Function(BuildContext, int) listItemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        const Divider(),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: itemList.length,
          itemBuilder: listItemBuilder,
        ),
      ],
    );
  }
}

class RowOfTwoButtons extends StatelessWidget {
  const RowOfTwoButtons({
    super.key,
    required this.leftButton,
    required this.rightButton,
  });

  final Widget leftButton;
  final Widget rightButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        leftButton,
        rightButton,
      ],
    );
  }
}
