import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite/models.dart' as models;
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';
import '../../../core/config/constants.dart';
//import 'package:appwrite/models.dart' as models;
// import 'package:fit_master/core/data/app_db.dart';
// import 'package:sembast/sembast.dart';

class TailorState extends ChangeNotifier {
  // var store = intMapStoreFactory.store("tailor");
  // Future<Database> get _db async => await AppDatabase.instance.database;
  final String collectionId = "6363765aa8edf460507b"; //
  Client client = Client(); //
  late Databases db; //
  late String error;
  List<Tailor> _tailors = [];
  List<Tailor> get tailors => _tailors;
  Tailor? _tailor;
  Tailor? get tailor => _tailor;

  TailorState() {
    _init();
  }

  _init() {
    // print('Tailor State');
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId); //
    db = Databases(client); //
    _tailors = [];
    // getTailors();
    // print(_tailors);
  }

  getTailors() async {
    try {
      // var res = await store.find(await _db);
      // _tailors = res.map((tr) => Tailor.fromJson(tr)).toList();
      DocumentList res; //
      res = await db.listDocuments(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
      ); //
      _tailors = res.documents.map((tr) => Tailor.fromJson(tr)).toList(); //
      // print("taolp" + _tailors.toString());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  setTailors(var data) {
    print("object");
    try {
      _tailors = [];

      data['documents'].map((tr) {
        Tailor tailor = Tailor.fromFunction(tr);
        print(tailor);
        _tailors.add(tailor);
        // return tailor;
      }).toList(); //
    } catch (e) {
      print(e);
    }
  }

  getTailor(String id) async {
    try {
      await getTailors();
      // print(id);
      // ignore: unrelated_type_equality_checks
      _tailor = _tailors.where((tailor) => tailor.id == id).first;
      notifyListeners();
      //  return _tailor;
    } catch (e) {
      print(e);
    }
  }

  addTailor(Tailor tailor, String storeId) async {
    try {
      // StoreState ss = StoreState();
      // await ss.getStores();

      // await store.add(await _db, tailor.toJson());
      // var res = await store.find(await _db);
      // _tailors.add(Tailor.fromJson(res.last));
      print(tailor.tailor_status);
      print("Add tailor");
      var docId = const Uuid();
      var res = await db.createDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: docId.v1(),
        data: tailor.toJson(),
        // permissions: ["team:" + storeId],
      );
      _tailors.add(Tailor.fromJson(res));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  deleteTailor(Tailor tailor) async {
    try {
      // final finder = Finder(filter: Filter.byKey(tailor.id));
      // await store.delete(await _db, finder: finder);
      await db.deleteDocument(
        databaseId: AppConstants.dbId,
        collectionId: collectionId,
        documentId: tailor.id.toString(),
      );
      _tailors = List<Tailor>.from(_tailors.where((tl) => tl.id != tailor.id));
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  updateTailor(Tailor tailor) async {
    try {
      // final finder = Finder(filter: Filter.byKey(tailor.id));
      // await store.update(await _db, tailor.toJson(), finder: finder);
      // var res = await store.find(await _db, finder: finder);
      // Tailor updated = Tailor.fromJson(res.first);
      var res = await db.updateDocument(
          databaseId: AppConstants.dbId,
          collectionId: collectionId,
          documentId: tailor.id.toString(),
          data: tailor.toJson());
      Tailor updated = Tailor.fromJson(res);
      _tailors = List<Tailor>.from(
          _tailors.map((tail) => tail.id == updated.id ? updated : tail));
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }  
}