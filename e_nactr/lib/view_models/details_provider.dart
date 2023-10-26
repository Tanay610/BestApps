import 'package:e_nactr/database/download_helper.dart';
import 'package:e_nactr/database/favorite_helper.dart';
import 'package:e_nactr/models/category.dart';
import 'package:e_nactr/util/api.dart';
import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  CategoryFeed related = CategoryFeed();
  bool loading = true;
  Entry? entry;
  var favDB = FavoriteDB();
  var dlDB = DownloadsDB();

  bool faved = false;
  bool dowloaded = false;
  Api api = Api();

  getFeed(String url) async {
    setLoading(true);
    checkFav();
    checkDownload();
    try {
      CategoryFeed feed = await api.getCategory(url);
      setRelated(feed);
      setLoading(false);
    } catch (e) {
      throw (e);
    }
  }

  // check if book is favorited or not

  void setLoading(bool bool) {}

  checkFav() async {
    List c = await favDB.check({'id': entry!.id!.t.toString()});
    if (c.isNotEmpty) {
      setFaved(true);
    } else {
      setFaved(false);
    }
  }

  addFav() async {
    await favDB.add({'id': entry!.id!.t.toString(), 'item': entry!.toJson()});
    checkFav();
  }

  removeFav() async {
    favDB.remove({'id': entry!.id!.toString()}).then((value) {
      print(value);
      checkFav();
    });
  }

  // check if the book has been downloaded before

  checkDownload()async{

  }


  void setRelated(CategoryFeed feed) {}

  void setFaved(bool bool) {}
}
