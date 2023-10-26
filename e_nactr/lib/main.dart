import 'package:e_nactr/view_models/app_provider.dart';
import 'package:e_nactr/view_models/genre_provider.dart';
import 'package:e_nactr/view_models/home_provider.dart';
import 'package:e_nactr/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_)=> GenreProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AppProvider appProvider, Widget? child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          home: SplashPage(),
        );
      },
    );
  }
}
