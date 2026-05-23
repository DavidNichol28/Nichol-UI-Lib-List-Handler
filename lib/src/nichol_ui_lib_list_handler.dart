import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nichol_ui_lib_list_item.dart';

class NicholUILibListHandler extends StatelessWidget {
  final List<NicholUILibListItem> listItems;
  final int selectedListItem;

  const NicholUILibListHandler({super.key, required this.listItems, required this.selectedListItem, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 333,
      child: ListView.builder(
        itemCount: listItems.length,
      itemBuilder: (context, index) {
        return listItems[index ] as Widget;
      },
  ));
}
}
