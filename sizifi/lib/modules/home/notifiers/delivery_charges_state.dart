import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:sizifi/core/config/constants.dart';
import 'package:sizifi/modules/home/data/model/delivery_charges.dart';
import 'package:uuid/uuid.dart';

class DeliveryChargesState extends ChangeNotifier {
  final String collectionId = "647730d2607e8b2b5520";
  Client client = Client();
  late Databases db;
  late String error;
  List<DeliveryCharges> _deliveryChargesList = [];
  List<DeliveryCharges> get deliveryChargesList => _deliveryChargesList;
  late DeliveryCharges _currentDeliveryCharges;
  DeliveryCharges get currentDeliveryCharges => _currentDeliveryCharges;

  DeliveryChargesState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    db = Databases(client);
    _deliveryChargesList = [];
    // getDeliveryCharges();
  }

  getDeliveryCharges() async {
    try {
      DocumentList res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
      );
      _deliveryChargesList =
          res.documents.map((doc) => DeliveryCharges.fromJson(doc)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getDeliveryChargesById(String id) async {
    try {
      await getDeliveryCharges();
      _currentDeliveryCharges =
          _deliveryChargesList.firstWhere((charges) => charges.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addDeliveryCharges(DeliveryCharges charges) async {
    try {
      var docId = const Uuid();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docId.v1(),
        data: charges.toJson(),
      );
      _deliveryChargesList.add(DeliveryCharges.fromJson(res));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  deleteDeliveryCharges(DeliveryCharges charges) async {
    try {
      await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: charges.id.toString(),
      );
      _deliveryChargesList.removeWhere((c) => c.id == charges.id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updateDeliveryCharges(DeliveryCharges charges) async {
    try {
      var res = await db.updateDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: charges.id.toString(),
        data: charges.toJson(),
      );
      DeliveryCharges updated = DeliveryCharges.fromJson(res);
      _deliveryChargesList =
          List<DeliveryCharges>.from(_deliveryChargesList.map(
        (c) => c.id == updated.id ? updated : c,
      ));
      notifyListeners();
      print(res.data);
    } catch (e) {
      print(e);
    }
  }

  void editCharges(String id, String newitemName, String newitemCharge) async {
    try {
      var chargesToUpdate = _deliveryChargesList.firstWhere((c) => c.id == id);
      chargesToUpdate.name = newitemName;
      chargesToUpdate.price = newitemCharge;

      await updateDeliveryCharges(chargesToUpdate);
    } catch (e) {
      print(e);
    }
  }

  setDeliveryCharges(var data)
  {
          print(data);
    try{
        _deliveryChargesList = [];

         data['documents'].map((tr) {
          DeliveryCharges deliveryCharges = DeliveryCharges.fromFunc(tr);
          print(deliveryCharges);
          _deliveryChargesList.add(deliveryCharges);
          // return tailor;
        }).toList(); 
    }
    catch(e){
     print(e);
    }
  }
}
