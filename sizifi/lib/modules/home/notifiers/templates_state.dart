import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
// import 'package:sizifi/modules/home/data/model/item_type.dart';
import 'package:uuid/uuid.dart';

import '../../../core/config/constants.dart';
import '../data/model/orders.dart';
import '../data/model/templates.dart';

class TemplatesState extends ChangeNotifier {
  final String collectionId = "64970261df0c95c025ae";
  Client client = Client();
  late Databases db;
  late String error;
  List<Templates> _userTemplates = [];
  List<Templates> get userTemplates => _userTemplates;
  List<Templates> _tailorTemplates = [];
  List<Templates> get tailorTemplates => _tailorTemplates;
  late Templates _currentTemplates;
  Templates get currentTemplates => _currentTemplates;

  TemplatesState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    db = Databases(client);
    _userTemplates = [
      Templates(
        type: false,
        status: 'Initiated',
        store_id: "",
        template:
            'Initiated Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: false,
        status: 'Under Alteration',
        store_id: "",
        template:
            'Under Alteration Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: false,
        status: 'Measurement/Notes Update',
        store_id: "",
        template:
            'Measurement/Notes Update Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: false,
        status: 'Altered & Ready',
        store_id: "",
        template:
            'Altered & Ready Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: false,
        status: 'Delivered',
        store_id: "",
        template:
            'Delivered Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: false,
        status: 'On hold',
        store_id: "",
        template:
            ' On hold Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: false,
        status: 'Canceled',
        store_id: "",
        template:
            'Canceled Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
    ];
    _tailorTemplates = [
      Templates(
        type: true,
        status: 'Initiated',
        store_id: "",
        template:
            'Initiated Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: true,
        status: 'Under Alteration',
        store_id: "",
        template:
            'Under Alteration Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: true,
        status: 'Measurement/Notes Update',
        store_id: "",
        template:
            'Measurement/Notes Update Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: true,
        status: 'Altered & Ready',
        store_id: "",
        template:
            'Altered & Ready Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: true,
        status: 'Delivered',
        store_id: "",
        template:
            'Delivered Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: true,
        status: 'On hold',
        store_id: "",
        template:
            'On hold Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
      Templates(
        type: true,
        status: 'Canceled',
        store_id: "",
        template:
            'Canceled Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            '\nAlteration Details:<POM> <value> <units> '
            '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>',
        synced: false,
      ),
    ];
  }

  getTemplates(String id) async {
    try {
      DocumentList res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        queries: [
          Query.equal('store_id', [id])
        ],
      );

      print("Found templtes: ${res.documents.length}");

      for (var doc in res.documents) {
        Templates updated = Templates.fromJson(doc);
        print(updated);
        if (updated.type) {
          _tailorTemplates = List<Templates>.from(_tailorTemplates.map(
            (template) =>
                template.status == updated.status ? updated : template,
          ));
        } else {
          _userTemplates = List<Templates>.from(_userTemplates.map(
            (template) =>
                template.status == updated.status ? updated : template,
          ));
        }
      }

      //  _templates = res.documents.map((doc) => Templates.fromJson(doc as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching templates: $e');
    }
  }

  addTemplates(Templates template, var updateTemplate) async {
    try {
      var docId = const Uuid();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docId.v1(),
        data: template.toJson(),
      );
      Templates updated = Templates.fromJson(res);
      // _pointsOfMeasurements =
      //     List<PointOfMeasurement>.from(_pointsOfMeasurements.map(
      //   (pom) => pom.item_type_id == updated.item_type_id ? updated : pom,
      // ));
      if (updated.type) {
        _tailorTemplates = List<Templates>.from(_tailorTemplates.map(
          (template) => template.status == updated.status ? updated : template,
        ));
      } else {
        _userTemplates = List<Templates>.from(_userTemplates.map(
          (template) => template.status == updated.status ? updated : template,
        ));
      }
      updateTemplate(updated);
      notifyListeners();
    } catch (e) {
      print('Error adding template: $e');
    }
  }

  updateTemplates(Templates template, var updateTemplate) async {
    try {
      var res = await db.updateDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: template.id.toString(),
        data: template.toJson(),
      );
      Templates updated = Templates.fromJson(res);
      // _pointsOfMeasurements =
      //     List<PointOfMeasurement>.from(_pointsOfMeasurements.map(
      //   (pom) => pom.item_type_id == updated.item_type_id ? updated : pom,
      // ));
      if (updated.type) {
        _tailorTemplates = List<Templates>.from(_tailorTemplates.map(
          (template) => template.status == updated.status ? updated : template,
        ));
      } else {
        _userTemplates = List<Templates>.from(_userTemplates.map(
          (template) => template.status == updated.status ? updated : template,
        ));
      }
      updateTemplate(updated);
      notifyListeners();
    } catch (e) {
      print('Error updating template: $e');
    }
  }

  deleteTemplates(Templates template) async {
    try {
      var res = await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: template.id.toString(),
      );
      // _templates.remove(template);
      notifyListeners();
    } catch (e) {
      print('Error deleting template: $e');
    }
  }

  genrateUserTemplate(Order order) {
    String Template = userTemplates
        .where((element) => element.status == order.status)
        .first
        .template;

    String itemsData = "";
    for (var item in order.items) {
      itemsData += "Item name: " + item.name + " ";
    }

    //TODO Replace variables
    Template = Template.replaceAll('<Order ID>', order.id.toString())
        .replaceAll('<Customer name>', order.customer_name.toString())
        .replaceAll('<Customer notes>', order.customer_notes.toString())
        .replaceAll('<Store Notes>', order.store_notes.toString())
        .replaceAll('<Invoice no>', order.invoice.toString())
        .replaceAll('<Expected Delivery Date>', order.delivery_date.toString())
        .replaceAll('<Delivery Mode>', order.delivery_mode.toString())
        .replaceAll('<Item>', itemsData);

    return Template;
  }

  genrateTailorTemplate(Order order) {
    // ignore: non_constant_identifier_names
    String Template = tailorTemplates
        .where((element) => element.status == order.status)
        .first
        .template;

    String itemsData = "";
    for (var item in order.items) {
      itemsData += "Item name: " + item.name + " ";
    }

    //TODO Replace variables
    Template = Template.replaceAll('<Order ID>', order.id.toString())
        .replaceAll('<Customer name>', order.customer_name.toString())
        .replaceAll('<Customer notes>', order.customer_notes.toString())
        .replaceAll('<Store Notes>', order.store_notes.toString())
        .replaceAll('<Invoice no>', order.invoice.toString())
        .replaceAll('<Expected Delivery Date>', order.delivery_date.toString())
        .replaceAll('<Delivery Mode>', order.delivery_mode.toString())
        .replaceAll('<Item>', itemsData);

    return Template;
  }

  setTemplates(var data) {
    for (var doc in data["documents"]) {
      Templates updated = Templates.fromFunction(doc);
      print(updated);
      if (updated.type) {
        _tailorTemplates = List<Templates>.from(_tailorTemplates.map(
          (template) => template.status == updated.status ? updated : template,
        ));
      } else {
        _userTemplates = List<Templates>.from(_userTemplates.map(
          (template) => template.status == updated.status ? updated : template,
        ));
      }
    }
  }
}
