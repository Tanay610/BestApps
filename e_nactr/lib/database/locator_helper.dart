import 'package:path/path.dart';
import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocatorDb {
  getpath() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = documentDirectory.path + '/locator.db';
    return path;
  }

  // Insertion
  add(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    db.insert(item);
    await db.close();
  }

  update(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    int update = await db.update({'bookId': item['bookId']}, item);
    if (update == 0) {
      db.insert(item);
    }
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    int val = await db.remove(item);
    await db.close();
    return val;
  }

  Future<List> listAll() async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find({});
    await db.close();
    return val;
  }

  Future<List> getlocator(String id) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find({'bookId': id});
    await db.close();
    return val;
  }
}
