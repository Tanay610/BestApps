import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:sizifi/modules/home/data/model/item_type.dart';
import 'package:sizifi/modules/home/notifiers/point_of_measurement_state.dart';
import 'package:uuid/uuid.dart';
import '../../../core/config/constants.dart';

class ItemTypeState extends ChangeNotifier {
  final String collectionId = "647730e616b5b7d6b07a";
  Client client = Client();
  late Databases db;
  late String error;
  List<ItemType> _itemTypes = [];
  List<ItemType> get itemTypes => _itemTypes;
  late ItemType _itemType;
  ItemType get itemType => _itemType;

  ItemTypeState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    db = Databases(client);
    _itemTypes = [];
    // getItemTypes();
  }

  getItemTypes() async {
    try {
      DocumentList res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
      );
      _itemTypes = res.documents.map((tr) => ItemType.fromJson(tr)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getItemType(String id) async {
    try {
      await getItemTypes();
      _itemType = _itemTypes.firstWhere((itemType) => itemType.store_id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addItemType(ItemType itemType) async {
    try {
      var docId = const Uuid();
      var docIdv1 = docId.v1();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docIdv1,
        data: itemType.toJson(),
      );

      PointOfMeasurementState ps = PointOfMeasurementState();

      itemType.pom!.forEach((item) async {
        item.item_type_id = docIdv1;
        print(item);
        await ps.addPointOfMeasurement(item);
      });

      ItemType finalItemType = ItemType.fromJson(res);

      finalItemType.pom = ps.pointsOfMeasurements;

      _itemTypes.add(finalItemType);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  deleteItemType(ItemType itemType) async {
    try {
      await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: itemType.id.toString(),
      );
      _itemTypes =
          List<ItemType>.from(_itemTypes.where((it) => it.id != itemType.id));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updateItemType(ItemType itemType) async {
    try {
      var res = await db.updateDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: itemType.id.toString(),
        data: itemType.toJson(),
      );

      
      PointOfMeasurementState ps = PointOfMeasurementState();

      itemType.pom!.forEach((pom) async {
        pom.item_type_id = itemType.id.toString();
        print(pom);
        if(pom.id == null)
        {
          await ps.addPointOfMeasurement(pom);
        }
        else{
          await ps.updatePointOfMeasurement(pom);
        }
      });

      ItemType finalItemType = ItemType.fromJson(res);

      finalItemType.pom = ps.pointsOfMeasurements;


      ItemType updated = ItemType.fromJson(res);


      _itemTypes = List<ItemType>.from(
          _itemTypes.map((it) => it.id == updated.id ? updated : it));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  setItemType(var data) {
    print(data);
    try {
      _itemTypes = [];

      data['documents'].map((tr) {
        ItemType itemType = ItemType.fromFunction(tr);
        PointOfMeasurementState ps = new PointOfMeasurementState();
        ps.getPointOfMeasurementFromDoc(tr['pom'], itemType);
        itemType.pom = ps.pointsOfMeasurementResults;
        print(itemType.pom);
        _itemTypes.add(itemType);
        // return tailor;
      }).toList();
    } catch (e) {
      print(e);
    }
  }
}
