import 'dart:io';
import 'package:path/path.dart';
import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'package:path_provider/path_provider.dart';

class DownloadsDB {
  getpath() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = documentDirectory.path + '/downloads.db';
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

  Future removewithAllId(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find({});
    val.forEach((element) {
      db.remove(element);
    });
    await db.close();
  }

  Future<List> listAll() async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find({});
    await db.close();
    print(val);
    return val;
  }

  Future<List> check(Map item) async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    List val = await db.find(item);
    await db.close();
    return val;
  }

  clear() async {
    final db = ObjectDB(FileSystemStorage(await getpath()));
    db.remove({});
  }
}
