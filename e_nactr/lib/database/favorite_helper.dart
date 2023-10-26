import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';

class FavoriteDB {
  getpath() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = documentDirectory.path + '/favorites.db';
    return path;
  }

  // Insertion
  add(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    db.insert(item);
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    int val = await db.remove(item);
    await db.close();
    return val;
  }

  Future<List> listAll(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find({});
    await db.close();
    return val;
  }

  Future<Stream<List>> listAllStream() async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    return db.find({}).asStream();
  }

  Future<List> check(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find(item);
    await db.close();
    return val;
  }
}
