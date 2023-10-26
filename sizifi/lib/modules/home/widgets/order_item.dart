import 'package:flutter/material.dart';
import 'package:sizifi/modules/home/widgets/order_item_list.dart';
import 'package:sizifi/modules/home/widgets/order_item_list_edit.dart';

import '../data/model/order_item.dart';

class OrderItems extends StatefulWidget {
  final items;
  final removeItems;
  final insertMeasurement;
  final edit;
  final refreshState;
  const OrderItems({
    Key? key,
    this.items,
    this.edit,
    this.removeItems,
    this.insertMeasurement,
    this.refreshState,
  }) : super(key: key);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        OrderItem item = widget.items[index];
        if (widget.edit) {
          return OrderItemsListEdit(
            key: ObjectKey(item),
            index: index,
            item: item,
            removeItems: widget.removeItems,
            insertMeasurement: widget.insertMeasurement,
            itemCount: widget.items.length,
            refreshState: widget.refreshState,
          );
        } else {
          return OrderItemList(
            index: index,
            item: item,
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 0.0, height: 10.0);
      },
    );
  }
}
