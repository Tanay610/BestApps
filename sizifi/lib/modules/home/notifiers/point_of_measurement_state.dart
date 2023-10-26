import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:sizifi/modules/home/data/model/item_type.dart';
import 'package:sizifi/modules/home/data/model/point_of_measurement.dart';
import 'package:uuid/uuid.dart';
import '../../../core/config/constants.dart';

class PointOfMeasurementState extends ChangeNotifier {
  final String collectionId = "6477310f1956b797a598";
  Client client = Client();
  late Databases db;
  late String error;
  List<PointOfMeasurement> _pointsOfMeasurements = [];
  List<PointOfMeasurement> _pointsOfMeasurementResults = [];
  List<PointOfMeasurement> get pointsOfMeasurements => _pointsOfMeasurements;
  List<PointOfMeasurement> get pointsOfMeasurementResults =>
      _pointsOfMeasurementResults;
  // late PointOfMeasurement _pointOfMeasurement;
  // PointOfMeasurement get pointOfMeasurement => _pointOfMeasurement;

  PointOfMeasurementState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    db = Databases(client);
    _pointsOfMeasurements = [];
    // getPointsOfMeasurement();
  }

  getPointsOfMeasurement() async {
    try {
      DocumentList res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
      );
      _pointsOfMeasurements =
          res.documents.map((doc) => PointOfMeasurement.fromJson(doc)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getPointOfMeasurement(ItemType itemType) async {
    try {
      await getPointsOfMeasurement();
      print(itemType.id);
      DocumentList res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        queries: [Query.equal('item_type_id', itemType.id.toString())],
      );
      _pointsOfMeasurementResults =
          res.documents.map((tr) => PointOfMeasurement.fromJson(tr)).toList();

      print(_pointsOfMeasurementResults);

      itemType.pom = _pointsOfMeasurementResults;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getPointOfMeasurementFromDoc(var data, ItemType itemType) async {
    try {
      // await getPointsOfMeasurement();
      // print(itemType.id);
      // DocumentList res = await db.listDocuments(
      //   databaseId: AppConstants.dbId,
      //   collectionId: collectionId,
      //   queries: [Query.equal('item_type_id', itemType.id.toString())],
      // );
      _pointsOfMeasurementResults = [];

      // print(data['documents']);
      for (var tr in data['documents']) {
        // print(tr);
        _pointsOfMeasurementResults.add(PointOfMeasurement.fromFunction(tr));
      }
      // data['documents'].map((tr) {
      //   });

      // print(_pointsOfMeasurementResults);
      // print("sdjfkdjfdjk" +_pointsOfMeasurementResults.toString());

      itemType.pom = _pointsOfMeasurementResults;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addPointOfMeasurement(PointOfMeasurement pointOfMeasurement) async {
    try {
      var docId = const Uuid();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docId.v1(),
        data: pointOfMeasurement.toJson(),
      );
      _pointsOfMeasurements.add(PointOfMeasurement.fromJson(res));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  deletePointOfMeasurement(PointOfMeasurement pointOfMeasurement) async {
    try {
      await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: pointOfMeasurement.item_type_id.toString(),
      );
      _pointsOfMeasurements =
          List<PointOfMeasurement>.from(_pointsOfMeasurements.where(
        (pom) => pom.item_type_id != pointOfMeasurement.item_type_id,
      ));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updatePointOfMeasurement(PointOfMeasurement pointOfMeasurement) async {
    try {
      var res = await db.updateDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: pointOfMeasurement.id.toString(),
        data: pointOfMeasurement.toJson(),
      );
      PointOfMeasurement updated = PointOfMeasurement.fromJson(res);
      _pointsOfMeasurements.add(updated);
      // _pointsOfMeasurements =
      //     List<PointOfMeasurement>.from(_pointsOfMeasurements.map(
      //   (pom) => pom.item_type_id == updated.item_type_id ? updated : pom,
      // ));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
