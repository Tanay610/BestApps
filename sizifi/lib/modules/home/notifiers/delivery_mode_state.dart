import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:sizifi/core/config/constants.dart';
import 'package:sizifi/modules/home/data/model/delivery_mode.dart';
import 'package:uuid/uuid.dart';

class DeliveryModeState extends ChangeNotifier {
  final String collectionId = "647730b339bc34ea0f27";
  Client client = Client();
  late Databases db;
  late String error;
  List<DeliveryModes> _deliveryModesList = [];
  List<DeliveryModes> get deliveryModesList => _deliveryModesList;
  late DeliveryModes _currentDeliveryModes;
  DeliveryModes get currentDeliveryModes => _currentDeliveryModes;

  DeliveryModeState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    db = Databases(client);
    _deliveryModesList = [];
    // getDeliveryModes();
  }

  getDeliveryModes() async {
    try {
      DocumentList res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
      );
      _deliveryModesList =
          res.documents.map((doc) => DeliveryModes.fromJson(doc)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getDeliveryModeById(String id) async {
    try {
      await getDeliveryModes();
      _currentDeliveryModes =
          _deliveryModesList.firstWhere((mode) => mode.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addDeliverymodes(DeliveryModes modes) async {
    try {
      var docId = const Uuid();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docId.v1(),
        data: modes.toJson(),
      );
      _deliveryModesList.add(DeliveryModes.fromJson(res));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  deleteDeliverymodes(DeliveryModes modes) async {
    try {
      await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: modes.id.toString(),
      );
      _deliveryModesList.removeWhere((c) => c.id == modes.id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updateDeliverymodes(DeliveryModes modes) async {
    try {
      var res = await db.updateDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: modes.id.toString(),
        data: modes.toJson(),
      );
      DeliveryModes updated = DeliveryModes.fromJson(res);
      _deliveryModesList = List<DeliveryModes>.from(_deliveryModesList.map(
        (c) => c.id == updated.id ? updated : c,
      ));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void editmodes(String id, String newdeliveryModeName) async {
    try {
      var modesToUpdate = _deliveryModesList.firstWhere((c) => c.id == id);
      modesToUpdate.mode_name = newdeliveryModeName;

      await updateDeliverymodes(modesToUpdate);
    } catch (e) {
      print(e);
    }
  }

  setDeliveryMode(var data) {
    print(data);
    try {
      _deliveryModesList = [];

      data['documents'].map((tr) {
        DeliveryModes deliveryMode = DeliveryModes.fromFunction(tr);
        print(deliveryMode);
        _deliveryModesList.add(deliveryMode);
        // return tailor;
      }).toList();
    } catch (e) {
      print(e);
    }
  }
}
