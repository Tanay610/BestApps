import "package:flutter/material.dart";


class Criteria extends ChangeNotifier
{
  late String selectedFilter="Created on";


  void setSelectedFilter(String value)
  {
    selectedFilter = value;
    notifyListeners();
  }
}




