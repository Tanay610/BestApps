import 'package:e_nactr/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    checkTheme();
  }

  ThemeData theme = ThemeConfig.lightTheme;
  Key? key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setkey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  /// change the theme in the provider and SharedPreferences
  void setTheme(value, c) async {
    theme = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', c);
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r = prefs.getString('theme') ?? 'light';

    if (r == 'light') {
      t = ThemeConfig.lightTheme;
      setTheme(ThemeConfig.lightTheme, 'light');
    } else {
      t = ThemeConfig.darkTheme;
      setTheme(ThemeConfig.darkTheme, 'dark');
    }
    return t;
  }
}
