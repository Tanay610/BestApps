import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/model/orders.dart';

class OrderCountProvider with ChangeNotifier {
  int orderCOunt = 011;

  void incrementOrderCount() {
    orderCOunt++;
    notifyListeners();
  }
}

class CsvProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return _orders;
  }

  exportOrdersToCSV() async {
    // Map<Permission, PermissionStatus> statuses =
    //     await [Permission.storage].request();

    List<List<dynamic>> rows = [];
    List<String> columns = [
      "id",
      "customer_name",
      "customer_number",
      "customer_number_country",
      "customer_number_country_code",
      "invoice_date",
      "status",
      "created_at",
      "updated_at",
      "item_id",
      "item_name",
      "pom",
      "measurement",
      "unit",
      "tailor_id",
      "tailor_name",
      "tailor_number",
      "tailor_number_country",
      "tailor_number_country_code",
      "delivery_charges",
      "address_1"
          "address_2",
      "landmark",
      "city",
      "pin_code",
      "delivery_mode",
      "expected_delivery",
      "pending_orders",
      "skills",
      "assigned_to",
      "store_id",
      "store_notes",
      "customer_notes",
      "delivery_date"
    ];
    List<dynamic> row = [];
    for (var column in columns) {
      row.add(column);
    }
    rows.add(row);

    for (var order in orders) {
      for (var item in order.items) {
        for (var data in item.item_data) {
          var itemData = const JsonDecoder().convert(data);
          List<dynamic> rowData = [
            order.id,
            order.customer_name,
            order.customer_number,
            order.customer_number_country,
            order.customer_number_country_code,
            order.invoice_date,
            order.status,
            order.created_at,
            order.updated_at,
            item.id,
            item.name,
            itemData["pom"],
            itemData["measurement"],
            itemData["unit"],
            order.tailorObj!.id,
            order.tailorObj!.name,
            order.tailorObj!.number,
            order.tailorObj!.number_country,
            order.tailorObj!.number_country_code,
            order.delivery_charges,
            order.address_1,
            order.address_2,
            order.landmark,
            order.city,
            order.pin_code,
            order.delivery_mode,
            order.tailorObj!.pending_orders,
            order.tailorObj!.skills,
            order.assigned_to,
            order.store_id,
            order.store_notes,
            order.customer_notes,
            order.delivery_date
          ];

          rows.add(rowData);
        }
      }
    }

    if (await Permission.storage.request().isGranted) {
      String csv = const ListToCsvConverter().convert(rows);

      String dir = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);

      //  dir = await ExternalPath.getExternalStorageDirectories(ExternalPath.DIRECTORY_DOWNLOADS);

      String fileName = "${DateFormat.y().format(DateTime.now())}_export.csv";
      //String dir = "";
      //print(dir);

      File f = File("$dir/$fileName");

      f.writeAsString(csv);
      return fileName;
    } else {
      // Map<Permission, PermissionStatus> status = await [
      //   Permission.storage,
      // ].request();
    }
    notifyListeners();
  }
}
