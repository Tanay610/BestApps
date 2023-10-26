import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class Item {
  final String id;
  String name;
  String charge;

  Item({required this.id, required this.name, required this.charge});
}

class ChargesProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addCharges(String name, String charge) {
    String id = DateTime.now().toString();
    Item newItem = Item(id: id, name: name, charge: charge);
    _items.add(newItem);
    notifyListeners();
  }

  void editCharges(String id, String newName, String newCharge) {
    int index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].name = newName;
      _items[index].charge = newCharge;
      notifyListeners();
    }
  }
}
