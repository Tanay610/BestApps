import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/core/config/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:sizifi/modules/home/data/model/store_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sizifi/modules/home/notifiers/delivery_charges_state.dart';
import 'package:sizifi/modules/home/notifiers/delivery_mode_state.dart';
import 'package:sizifi/modules/home/notifiers/tailor_state.dart';
import 'package:sizifi/modules/settings/ui/Tailor_Setting/search_tailor_page.dart';
import 'package:uuid/uuid.dart';

import 'item_type_state.dart';
import 'order_state.dart';
import 'templates_state.dart';

class StoreState extends ChangeNotifier {
  final String collectionId = "63637680c48bc40d0a5c";
  Client client = Client();
  late Account account;
  late Databases db;
  late String error;
  late Functions functions;
  late List<Store> _stores = [];
  late Teams teams;
  late MembershipList _members;
  Store? _activeStore;
  final bool _store_set = false;
  String? userData;

  Store? get activeStore => _activeStore;

  setActiveStore(store) {
    _activeStore = store;
    notifyListeners();
  }

  List<dynamic> get stores => _stores;
  MembershipList get members => _members;

  StoreState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);

    db = Databases(client); //
    teams = Teams(client);
    functions = Functions(client);
    // getStores();
  }

  getStores(res) async {
    try {
      print("get stores");

      res = jsonDecode(res);
      print(res);

      _stores = [];
      // res["memberships"].map((tr) => Store.fromJson(tr)).toList()
      // as List<Store>; //
      var i = 0;
      for (var s in res['memberships']) {
        print(s);
        _stores.add(Store.fromJson(res['memberships'][i]));
        i++;
      }
      if (!_store_set && _stores.isNotEmpty) {
        _activeStore = _stores[0];
        print("Active store${_activeStore?.store_name}");
      }

      print(_stores);

      // print("stores$_stores");
    } catch (e) {
      print("Nama $e");
    }
  }

  getMembers(membs) async {
    _members = membs;

    notifyListeners();
  }

  addStore(Store store) async {
    var storeId = const Uuid();
    store.team_id = storeId.v1();
    Future result = teams.create(
      teamId: store.team_id,
      name: store.store_name,
      roles: ["owner", "Super-Admin"],
    );
    //store.total = 1;
    // print("adding"+store.id);

    result.then((res) {
      var docId = const Uuid();
      String docIds = docId.v1();
      var promise = db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docIds,
        data: {
          "team_id": store.team_id,
          "store_name": store.store_name,
          "location": store.location,
          "about": "Store for alteration",
          "order_no_prefix": "1234",
          "next_no": "0945",
          "store_brand_name": store.store_brand_name,
          "brand_store": store.brand_store,
          "email": store.email,
          "phone_no": store.phone_no,
          "address_1": store.address_1,
          "address_2": store.address_2,
          "landmark": store.landmark,
          "city": store.city,
          "pin_code": store.pin_code,
          "state": store.state,
          "country": "India"
        },
        // permissions: ["team:${store.id}"],
      );
      promise.then((value) {
        _stores.add(store);
        if (!_store_set && _stores.isNotEmpty) {
          _activeStore = _stores.first;
          // print("Active store" + _activeStore.name);
        }
      });
    });

    // getStores();
    notifyListeners();
  }

  addStoreMembership(Store store, var data, String role) async {
    var userId = const Uuid();

    // ignore: prefer_interpolation_to_compose_strings
    var dataString = '{"uId":"' +
        userId.v1() +
        '","email":"' +
        data["email"].toString() +
        '","phone":"' +
        data["number_country_code"].toString() +
        data["number"].toString() +
        '","pass":"' +
        data["password"].toString() +
        '","name":"' +
        data["name"].toString() +
        '","teamId":"' +
        store.team_id +
        '","teamName":"' +
        store.store_name +
        '","roles":["' +
        role +
        '"]}';
    print(dataString);
    await functions
        .createExecution(functionId: '6385f6976a546bbac27a', data: dataString)
        // .then((value) => print(value.response));
        .then((value) {
      userData = value.response;
      // print(userData);
    });

    notifyListeners();
  }

  updateStore(Store? store) async {
    // var storeId = const Uuid();
    if (store != null) {
      // print(store.id);

      try {
        teams.updateName(
          teamId: store.team_id,
          name: store.store_name,
        );
        print(store.id.toString());
        var res = await db.updateDocument(
            databaseId: AppConstants.dbId,
            collectionId: collectionId,
            documentId: store.id.toString(),
            data: store.toJson());
        res.data["teamId"] = res.data["team_id"];
        Store updated = Store.fromJson(res.data);
        _stores = List<Store>.from(
            (_stores).map((stor) => stor.id == updated.id ? updated : stor));
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  deleteStore(Store store) async {
    try {
      await teams.delete(teamId: store.team_id);
      _stores = List<Store>.from(_stores.where((st) => st.id != store.team_id));
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  getStoreData(BuildContext context, int? offset) async {
    try {
      await functions
          .createExecution(
              functionId: '649e6418bf448c905844',
              data: '{"storeId":"' + activeStore!.team_id + '"}')
          // .then((value) => print(value.response));
          .then((value) {
        var storeData = jsonDecode(value.response);
        // print(value.response);
        if (storeData["success"] == true) {
          // print(storeData["result"]["tailor"]);
          Provider.of<TailorState>(context, listen: false)
              .setTailors(storeData["result"]["tailor"]);
          Provider.of<DeliveryChargesState>(context, listen: false)
              .setDeliveryCharges(storeData["result"]["deliveryCharges"]);
          Provider.of<DeliveryModeState>(context, listen: false)
              .setDeliveryMode(storeData["result"]["deliveryModes"]);
          Provider.of<TemplatesState>(context, listen: false)
              .setTemplates(storeData["result"]["templates"]);
          Provider.of<ItemTypeState>(context, listen: false)
              .setItemType(storeData["result"]["itemType"]);
          Provider.of<OrderState>(context, listen: false)
              .setOrders(storeData["result"]["orders"], context);
        }
        // Provider.of<StoreState>(_context, listen:false).getStores(value.response);
      });
    } catch (e) {
      print(e);
    }
  }
}
