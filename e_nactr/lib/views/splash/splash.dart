import 'dart:async';

import 'package:e_nactr/util/router.dart';
import 'package:e_nactr/views/main_s.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    return Timer(const Duration(seconds: 4), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Routed.pushReplacement(context, const MainPage());
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: 
            Image.asset("assets/icons/open-book.png"),

            ),

            const Text("Enactr",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
