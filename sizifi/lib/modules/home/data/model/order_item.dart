import 'dart:convert';

import 'item_type.dart';

class OrderItem {
  late String? id;
  late String? order_id;
  late String name;
  late List<dynamic> item_data;
  late String item_type;
  late String? item_type_other;
  ItemType? itemtypeobj;

  OrderItem({
    required this.id,
    required this.order_id,
    required this.name,
    required this.item_data,
    required this.item_type,
    this.item_type_other,
    this.itemtypeobj,
  });

  OrderItem.fromJson(json1) {
    // print(json1.data);
    // id = json1.value['\$id'];
    // order_id = json1.value['order_id'];
    // name = json1.value['name'];
    // item_data = json1.value['item_data'];
    id = json1.data['\$id'];
    order_id = json1.data['order_id'];
    name = json1.data['name'];
    item_data = json.decode(json1.data['item_data']);
    item_type = json1.data['item_type'];
    item_type_other = json1.data['item_type_other'];
    // print(item_data);
  }

  OrderItem.fromFunction(json1) {
    // print(json1.data);
    // id = json1.value['\$id'];
    // order_id = json1.value['order_id'];
    // name = json1.value['name'];
    // item_data = json1.value['item_data'];
    id = json1['\$id'];
    order_id = json1['order_id'];
    name = json1['name'];
    item_data = json.decode(json1['item_data']);
    item_type = json1['item_type'];
    item_type_other = json1['item_type_other'];
    // print(item_data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = order_id;
    data['name'] = name;
    data['item_data'] = json.encode(item_data);
    data['item_type'] = item_type;
    data['item_type_other'] = item_type_other;
    return data;
  }
}
