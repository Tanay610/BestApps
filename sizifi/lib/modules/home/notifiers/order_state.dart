import 'dart:convert';
//import 'dart:io';
//import 'package:sizifi/modules/home/data/model/order_item.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/notifiers/item_state.dart';
import 'package:sizifi/modules/home/notifiers/tailor_state.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:uuid/uuid.dart';
//import 'package:http/http.dart' as http;

import '../../../core/config/constants.dart';
import '../../authentication/models/user.dart';
import '../../authentication/notifiers/auth_state.dart';
import '../data/model/orders.dart';

import 'dart:io';

import 'package:permission_handler/permission_handler.dart' as p_handler;

// import 'package:sembast/sembast.dart';
// import 'package:fit_master/core/data/app_db.dart';

class OrderState extends ChangeNotifier {
//   var store = intMapStoreFactory.store("orders");
//   Future<Database> get _db async => await AppDatabase.instance.database;
  final String collectionId = "636376690a0a4b4b00cd"; //
  Client client = Client(); //
  late Databases db; //
  late String _error;
  List<Order> _orders = [];
  // ignore: prefer_final_fields
  late var _queryBuilder = {};
  // late Finder _query = new Finder();
  late String _query;
  List<Order> _searchResults = [];
  late String _order = "created_at";
  late String _sort = "DESC";
  late User _user;
  //late AuthState as;
  //List<Order> MyDocument = [];
  //late Order order1;

  set order(String order) {
    _order = order;
    // print(order);
    // _getOrders();
  }

  set sort(String sort) {
    _sort = sort;
    // print(sort);
  }

  set query(String query) {
    _query = query;
    // print("Query " + query);

    _searchOrders();
  }

  set queryBuilder(var qb) {
    _queryBuilder = qb;
  }

  List<Order> get searchResults => _searchResults;
  User get user => _user;

  List<Order> get orders => _orders;
  String get error => _error;

  OrderState() {
    _init();
  }
  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId); //
    db = Databases(client); //
    _orders = [];
    // _getOrders();
  }

  // bool _initl = false;
  setUser(User us) async {
    // if (_initl == false) {
    _user = us;
    print("setting user");
    // _getOrders();
    notifyListeners();
    // _initl = true;
    // }
  }

  getOrders(String id) async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      queries.add(Query.equal('assigned_to', id));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            // await ts.getTailor(order.tailor);
            order.tailorObj =
                ts.tailors.where((element) => element.id == order.tailor).first;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  _searchOrders() async {
    try {
      models.DocumentList res; //
      List<String> queries = [];
      // print(_query);
      if (_query.isEmpty) {
        _searchResults = _orders;
      } else {
        queries.add(Query.search(_queryBuilder['name'], _query));
        queries.add(Query.equal('assigned_to', _user.id));

        if (_queryBuilder['status'] != null) {
          // _queries.add(Query.equal('status', _queryBuilder['status']));
        }
        // print(_queries);

        res = await db.listDocuments(
          collectionId: collectionId,
          // orderAttributes: [_order],
          // orderTypes: [_sort],
          queries: queries,
          databaseId: AppConstants.dbId,
        ); //AuthState().isLoggedIn
        // print(res.documents);

        // final jsonData = json.decode(res.body);

        // List<Order> myDocument = List<Order>.from(jsonData.map((documentJson) {
        // return MyDocument.fromJson(documentJson);
        // }));

        _searchResults =
            res.documents.map((or) => Order.fromJson(or)).toList(); //
        for (var order in _searchResults) {
          if (order.tailorObj == null) {
            // print("Tailor object not found");
            try {
              // await TailorState().getTailor(order.tailor);
              order.tailorObj = _orders
                  .where((ord) => ord.id == order.id)
                  .toList()
                  .first
                  .tailorObj;

              // _searchResults = List<Order>.from(_searchResults
              //     .map((ord) => ord.id == order.id ? order : ord));
              // print(order.tailorObj);
            } catch (e) {
              // print(e);
            }
          }
        }
      }
      // _queries.add(Query.equal('assigned_to', _user.id));

      //  = _orders;
      notifyListeners();
    } catch (e) {
      // print(e.toString());
    }
    // // var res;
    // if (_query != "") {
    //   if (_queryBuilder['type'] == "name") {
    //     // queries.add(Query.search('customer_name', _query));
    //   }
    // }
    // if (_query != "") {
    //   var res1 = await store.find(await _db);
    //   // print("search: " + res.toString());
    //   _searchResults = res1.map((tr) => Order.fromJson(tr)).toList();
    //   // print(_searchResults);
    // } else {
    // _searchResults = _orders;
    // }
  }

  addOrder(Order order, String storeId, BuildContext context) async {
    try {
      print("creating new order");

      var docId = const Uuid();
      String docIds = docId.v1();

      print("Items${order.items.length}");
      OrderItemState ois = new OrderItemState();

      //order item documents
      order.items.forEach((item) async {
        if (item.name != "") {
          item.order_id = docIds;
          print(item);
          await ois.addItem(item, storeId);
        }
      });
      order.items = ois.items;

      //create order document
      var res = await db.createDocument(
        collectionId: collectionId,
        documentId: docIds,
        data: order.toJson(),
        databaseId: AppConstants.dbId,
        // permissions: ["team:" + storeId],
      );

      print(res);
      Order finalOrder = Order.fromJson(res);
      finalOrder.items = order.items;
      finalOrder.tailorObj = order.tailorObj;

      if (order.tailorObj == null) {
        // print("Tailor object not ");
        try {
          // print("jhkhkjhjh ${order.tailorObj}");
          TailorState ts = Provider.of<TailorState>(context, listen: false);
          // await ts.getTailor(order.tailor);
          // print(ts.tailors);
          if (order.tailor != "null") {
            print(order.customer_name);
            // _orders = List<Order>.from(
            //     _orders.map((ord) => ord.id == order.id ? order : ord));
            // } else {
            order.tailorObj =
                ts.tailors.where((element) => element.id == order.tailor).first;
            // _orders = List<Order>.from(
            //     _orders.map((ord) => ord.id == order.id ? order : ord));
          }
        } catch (e) {
          print(e);
        }
      }
      orders.add(finalOrder);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updateTailorPending(Order order) async {
    Tailor? tl = order.tailorObj;
    // print(order.status);
    switch (order.status) {
      case "Initiated":
        await updateTailor(tl, 1);
        break;
      case "Reassigned Tailor":
        await updateTailor(tl, 1);
        break;
      case "Altered & Ready":
        await updateTailor(tl, -1);
        break;
      case "Delivered":
        await updateTailor(tl, -1);
        break;
      default:
    }
  }

  updateTailor(Tailor? tl, int pending) async {
    tl!.pending_orders = (int.parse(tl.pending_orders) + pending).toString();
    // TailorState ts = ;
    await TailorState().updateTailor(tl);
    notifyListeners();
  }

  updateOrder(Order order, String storeId) async {
    try {
      // final finder = Finder(filter: Filter.byKey(order.id));

      // await store.update(await _db, order.toJson(), finder: finder);

      // order.items.forEach((item) async {
      //   OrderItemState().updateItem(item);
      // });

      // var res = await store.find(await _db, finder: finder);
      // Order updated = Order.fromJson(res.first);

      // if (order.status != updated.status) {
      //   updateTailorPending(updated);
      // }

      order.items.forEach((item) async {
        if (item.order_id == null) {
          item.order_id = order.id;
          await OrderItemState().addItem(item, storeId);
        }
        item.order_id = order.id;
        // print(item);
        await OrderItemState().updateItem(item);
      });
      var res = await db.updateDocument(
        collectionId: collectionId,
        documentId: order.id.toString(),
        data: order.toJson(),
        databaseId: AppConstants.dbId,
      );
      Order updated = Order.fromJson(res);
      updated.tailorObj = order.tailorObj;
      updated.items = order.items;
      _orders = List<Order>.from(
          _orders.map((ord) => ord.id == updated.id ? updated : ord));
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  deleteOrder(Order order) async {
    try {
      // final finder = Finder(filter: Filter.byKey(order.id));
      // await store.delete(await _db, finder: finder);

      // order.items.forEach((item) async {
      //   final orderfinder = Finder(filter: Filter.byKey(item.id));
      //   await store.delete(await _db, finder: orderfinder);
      // });
      order.items.forEach((item) async {
        item.order_id = order.id;
        // print(item);
        await OrderItemState().deleteItem(item);
      });
      var res = await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: order.id.toString(),
      );
      _orders = List<Order>.from(_orders.where((ord) => ord.id != order.id));
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  List<Order> getTailorOrders(tailor) {
    // print(tailor.id);
    List<Order> to =
        List<Order>.from(_orders.where((ord) => ord.tailor == tailor.id));
    // print(to);
    return to;
  }

  // exportOrdersToCSV() async {
  //   // Map<Permission, PermissionStatus> statuses =
  //   // await [Permission.storage].request();

  //   List<List<dynamic>> rows = [];
  //   List<String> columns = [
  //     "id",
  //     "customer_name",
  //     "customer_number",
  //     "customer_number_country",
  //     "customer_number_country_code",
  //     "invoice_number",
  //     "status",
  //     "created_at",
  //     "updated_at",
  //     "item_id",
  //     "item_name",
  //     "pom",
  //     "measurement",
  //     "unit",
  //     "tailor_id",
  //     "tailor_name",
  //     "tailor_number",
  //     "tailor_number_country",
  //     "tailor_number_country_code",
  //     "pending_orders",
  //     "skills",
  //     "notes",
  //     "delivery_date"
  //   ];
  //   List<dynamic> row = [];
  //   for (var column in columns) {
  //     row.add(column);
  //   }
  //   rows.add(row);

  //   for (var order in orders) {
  //     for (var item in order.items) {
  //       for (var data in item.item_data) {
  //         var itemData = const JsonDecoder().convert(data);
  //         List<dynamic> rowData = [
  //           order.id,
  //           order.customer_name,
  //           order.customer_number,
  //           order.customer_number_country,
  //           order.customer_number_country_code,
  //           order.invoice,
  //           order.status,
  //           order.created_at,
  //           order.updated_at,
  //           item.id,
  //           item.name,
  //           itemData["pom"],
  //           itemData["measurement"],
  //           itemData["unit"],
  //           order.tailorObj!.id,
  //           order.tailorObj!.name,
  //           order.tailorObj!.number,
  //           order.tailorObj!.number_country,
  //           order.tailorObj!.number_country_code,
  //           order.tailorObj!.pending_orders,
  //           order.tailorObj!.skills,
  //           order.customer_notes,
  //           order.delivery_date
  //         ];

  //         rows.add(rowData);
  //       }
  //     }
  //   }

  //   String csv = const ListToCsvConverter().convert(rows);

  //   String dir = await ExternalPath.getExternalStoragePublicDirectory(
  //       ExternalPath.DIRECTORY_DOWNLOADS);

  //   String fileName =
  //       DateFormat.yMMMMEEEEd().format(DateTime.now()) + "_export.csv";
  //   // String dir = "";
  //   // print(dir);

  //   // File f = File(dir + "/" + fileName);

  //   // f.writeAsString(csv);
  //   return fileName;
  // }

//! exporting all the order details to csv

  exportOrdersToCSV() async {
    // Map<Permission, PermissionStatus> statuses =
    //     await [Permission.storage].request();

    List<List<dynamic>> rows = [];
    List<String> columns = [
      "id",
      "customer_name",
      "customer_number",
      "customer_number_country",
      "customer_number_country_code",
      "invoice_date",
      "status",
      "created_at",
      "updated_at",
      "item_id",
      "item_name",
      // "pom",
      // "measurement",
      // "unit",
      "tailor_id",
      "tailor_name",
      "tailor_number",
      "tailor_number_country",
      "tailor_number_country_code",
      "delivery_charges",
      "address_1"
          "address_2",
      "landmark",
      "city",
      "pin_code",
      "delivery_mode",
      "expected_delivery",
      "pending_orders",
      "skills",
      "assigned_to",
      "store_id",
      "store_notes",
      "customer_notes",
      "delivery_date"
    ];
    List<dynamic> row = [];
    for (var column in columns) {
      row.add(column);
    }
    rows.add(row);

    for (var order in orders) {
      for (var item in order.items) {
        for (var data in item.item_data) {
          try {
            print(data);
            // var itemData = JsonDecoder().convert("'" + data.toString() + "'");
            List<dynamic> rowData = [
              order.id,
              order.customer_name,
              order.customer_number,
              order.customer_number_country,
              order.customer_number_country_code,
              order.invoice_date,
              order.status,
              order.created_at,
              order.updated_at,
              item.id,
              item.name,
              // itemData["pom"],
              // itemData["measurement"],
              // itemData["unit"],
              order.tailorObj!.id,
              order.tailorObj!.name,
              order.tailorObj!.number,
              order.tailorObj!.number_country,
              order.tailorObj!.number_country_code,
              order.delivery_charges,
              order.address_1,
              order.address_2,
              order.landmark,
              order.city,
              order.pin_code,
              order.delivery_mode,
              order.tailorObj!.pending_orders,
              order.tailorObj!.skills,
              order.assigned_to,
              order.store_id,
              order.store_notes,
              order.customer_notes,
              order.delivery_date
            ];

            rows.add(rowData);
          } catch (e) {
            print(e);
          }
        }
      }
    }
    // p_handler.Permission.storage.request();

    if (await p_handler.Permission.storage.request().isGranted) {
      String csv = const ListToCsvConverter().convert(rows);

      String dir = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);

      //  dir = await ExternalPath.getExternalStorageDirectories(ExternalPath.DIRECTORY_DOWNLOADS);

      String fileName = "${DateFormat.y().format(DateTime.now())}_export.csv";
      //String dir = "";
      //print(dir);

      File f = File("$dir/$fileName");

      f.writeAsString(csv);
      return fileName;
    } else {
      Map<p_handler.Permission, PermissionStatus> status = await [
        p_handler.Permission.storage,
      ].request();
    }
    notifyListeners();
  }

  Future<Order> getOrder(String id) async {
    var res = await db.getDocument(
      collectionId: collectionId,
      documentId: id,
      databaseId: AppConstants.dbId,
    );

    // Assuming res is of type Document
    Order order = Order.fromJson(res);

    return order;
  }

  getCustomerNameDesc() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderAsc("customer_name"));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  getCustomerNameAsc() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderDesc("customer_name"));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  getOrdersByCreationDateDesc() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderAsc("created_at"));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  getOrdersByCreationDateAsc() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderDesc("created_at"));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  getOrdersByDeliveryDateDesc() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderAsc("delivery_date"));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  getOrdersByDeliveryDateAsc() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderDesc("delivery_date"));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

//       final response = await  db.listDocuments(
//         collectionId: collectionId,
//         // orderAttributes: [_order],
//         // orderTypes: [_sort],
//         queries: _queries,
//         databaseId: AppConstants.dbId,
//       );

//  final jsonData = response.documents as List<dynamic>;

      //  _orders = jsonData.map((documentJson) => Order.fromJson(documentJson)).toList();

      //
      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  getOrders7() async {
    try {
      print("getting orders");
      // var res = await store.find(await _db);
      // print("res" + res.toString());
      // _orders = res.map((tr) => Order.fromJson(tr)).toList();

      models.DocumentList res;

      List<String> queries = [];
      print(AuthState().isLoggedIn);
      //_queries.add(Query.equal('assigned_to', id));
      queries.add(Query.orderDesc(""));
      res = await db.listDocuments(
        collectionId: collectionId,
        // orderAttributes: [_order],
        // orderTypes: [_sort],
        queries: queries,
        databaseId: AppConstants.dbId,
      );

      _orders = res.documents.map((or) => Order.fromJson(or)).toList(); //
      for (var order in _orders) {
        if (order.tailorObj == null) {
          print("Tailor object not found");
          try {
            TailorState ts = TailorState();
            await ts.getTailor(order.tailor);
            order.tailorObj = ts.tailor;
            _orders = List<Order>.from(
                _orders.map((ord) => ord.id == order.id ? order : ord));
            print(order.tailorObj);
          } catch (e) {
            print(e);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    //return null;
  }

  setOrders(var data, BuildContext context) async {
    try {
      _orders = [];
      data['documents'].map((dc) async {
        Order order = Order.fromFunction(dc);

        OrderItemState ois = new OrderItemState();
        ois.getOrderItemFromDoc(dc['items'], order);

        order.items = ois.items;
        if (order.tailorObj == null) {
          // print("Tailor object not ");
          try {
            // print("jhkhkjhjh ${order.tailorObj}");
            TailorState ts = Provider.of<TailorState>(context, listen: false);
            // await ts.getTailor(order.tailor);
            // print(ts.tailors);
            if (order.tailor != "null") {
              print(order.customer_name);
              // _orders = List<Order>.from(
              //     _orders.map((ord) => ord.id == order.id ? order : ord));
              // } else {
              order.tailorObj = ts.tailors
                  .where((element) => element.id == order.tailor)
                  .first;
              // _orders = List<Order>.from(
              //     _orders.map((ord) => ord.id == order.id ? order : ord));
            }
          } catch (e) {
            print(e);
          }
        }
        print("adding in  list " + order.customer_name);
        _orders.add(order);
      }).toList();

      print(_orders);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
