import 'dart:io';

import 'package:e_nactr/components/custom_alert.dart';
import 'package:flutter/material.dart';

class Dialogs {
  showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                "Enactr",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                         ),
             ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              "Are you sure you want to quit?",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black12)
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 130.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
