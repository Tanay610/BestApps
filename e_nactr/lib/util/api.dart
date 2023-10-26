import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_nactr/models/category.dart';
import 'package:xml2json/xml2json.dart';

class Api {
  Dio dio = Dio();
  static String baseUrl = "https://catalog.feedbooks.com";
  static String publicDomainUrl = '$baseUrl/publicdomain/browse';
  static String popular = '$publicDomainUrl/top.atom';
  static String recent = '$publicDomainUrl/recent.atom';
  static String awards = '$publicDomainUrl/awards.atom';
  static String noteworthy = '$publicDomainUrl/homepage_selection.atom';
  static String shortStory = '$publicDomainUrl/top.atom?cat=FBFIC029000';
  static String scifi = '$publicDomainUrl/top.atom?cat=FBFIC028000';
  static String actionAdventure = '$publicDomainUrl/top.atom?cat=FBFIC002000';
  static String mystery = '$publicDomainUrl/top.atom?cat=FBFIC022000';
  static String romance = '$publicDomainUrl/top.atom?cat=FBFIC027000';
  static String horror = '$publicDomainUrl/top.atom?cat=FBFIC015000';

  Future<CategoryFeed> getCategory(String Url) async {
    var res = await dio.get(Url).catchError((e) {
      throw (e);
    });
    CategoryFeed category;
    if (res.statusCode == 200) {
      Xml2Json xml2json = new Xml2Json();
      xml2json.parse(res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      category = CategoryFeed.fromJson(json);
    } else {
      throw ('Error ${res.statusCode}');
    }
    return category;
  }
}
