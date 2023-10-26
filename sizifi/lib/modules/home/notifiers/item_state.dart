import 'package:sizifi/modules/home/data/model/order_item.dart';
import 'package:sizifi/modules/home/data/model/orders.dart';
// import 'package:fit_master/core/data/app_db.dart';
// import 'package:sembast/sembast.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:uuid/uuid.dart';

import '../../../core/config/constants.dart';

class OrderItemState extends ChangeNotifier {
  // var store = intMapStoreFactory.store("order_items");
  // Future<Database> get _db async => await AppDatabase.instance.database;
  final String collectionId = "636376784299bfbaf14e"; //
  Client client = Client(); //
  late Databases db; //
  late String error;
  List<OrderItem> _items = [];
  List<OrderItem> get items => _items;
  OrderItemState() {
    _init();
  }
  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId); //
    db = Databases(client); //
    _items = [];
  }

  getItems(Order order) async {
    try {
      // final finder = Finder(filter: Filter.equals("order_id", order.id));
      // var res = await store.find(await _db, finder: finder);
      // print(res);
      // order.items = res.map((tr) => OrderItem.fromJson(tr)).toList();
      DocumentList res; //
      // print(order.id);
      res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        queries: [
          Query.equal('order_id', [order.id])
        ],
      ); //
      // print(res.toMap());
      order.items = res.documents.map((tr) => OrderItem.fromJson(tr)).toList();

      _items = order.items;
      // print(order.items);
      notifyListeners();
      // return _items;
    } catch (e) {
      // print(e);
    }
    // throw ("dww");
  }

  addItem(OrderItem item, String storeId) async {
    try {
      // await StoreState().getStores();
      var docId = const Uuid();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docId.v1(),
        data: item.toJson(),
        // permissions: ["team:" + storeId],
      );
      _items.add(OrderItem.fromJson(res));
      notifyListeners();
      // await store.add(await _db, item.toJson());
    } catch (e) {
      print(e);
    }
  }

  updateItem(OrderItem item) async {
    try {
      // final finder = Finder(filter: Filter.byKey(item.id));
      // await store.update(await _db, item.toJson(), finder: finder);
      var res = await db.updateDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: item.id.toString(),
        data: item.toJson(),
      );
    } catch (e) {
      // print(e);
    }
  }

  deleteItem(OrderItem item) async {
    try {
      // final finder = Finder(filter: Filter.byKey(item.id));
      // await store.delete(await _db, finder: finder);
      // _tailors = List<Tailor>.from(_tailors.where((tl) => tl.id != tailor.id));
      var res = await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: item.id.toString(),
      );
      _items = List<OrderItem>.from(_items.where((ord) => ord.id != item.id));
    } catch (e) {
      // print(e);
    }
  }

  getOrderItemFromDoc(var data,Order order)
  {
    _items = [];

    for (var tr in data['documents']) {
            // print(tr);
            _items.add(OrderItem.fromFunction(tr));
      }
        order.items = _items;

      notifyListeners();

  }

}