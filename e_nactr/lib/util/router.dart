import 'package:flutter/material.dart';

class Routed {
  static Future pushPage(BuildContext context, Widget page) {
    var value = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );

    return value;
  }

  /// functions made to push the pages in the stack.

  static Future pushPageDialog(BuildContext context, Widget page) {
    var value = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
        fullscreenDialog: true,
      ),
    );
    return value;
  }

  /// this function is made to push the page after the splash page

  static pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
