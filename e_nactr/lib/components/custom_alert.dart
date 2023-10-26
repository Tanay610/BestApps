import 'dart:ui';

import 'package:flutter/material.dart';


/// ignore     must be immutable 
class CustomAlertBox extends StatelessWidget {
  CustomAlertBox({super.key, required this.child});

  final Widget child;

  late double deviceWidth;
  late double deviceHeight;
  late double dialogHeight;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;

    deviceWidth =
        orientation == Orientation.portrait ? size.width : size.height;

    deviceHeight =
        orientation == Orientation.portrait ? size.height : size.width;

    dialogHeight = deviceHeight * (0.50);

    return MediaQuery(
        data: const MediaQueryData(),
        child: GestureDetector(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0.5,
              sigmaY: 0.5,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: deviceWidth * 0.9,
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: child,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
