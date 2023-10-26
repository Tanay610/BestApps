import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(
      {super.key, required this.refreshCallBack, this.isConnection = false});

  final Function refreshCallBack;
  final bool isConnection;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "😔",
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              getErrorText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () => refreshCallBack(),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: const Text(
                "TRY AGAIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getErrorText() {
    if (isConnection) {
      return 'There is a problem with your intenet connection.'
          '\n Please try again.';
    } else {
      return 'Could not load this page. \nPlease try again. ';
    }
  }
}
