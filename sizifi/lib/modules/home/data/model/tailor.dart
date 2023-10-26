import 'package:flutter/src/material/dropdown.dart';

class Tailor {
  late String? id;
  late String name;
  late String number;
  late String number_country;
  late String number_country_code;
  late String skills;
  late String pending_orders;
  late String? email;
  late String store_id;
  late bool tailor_status;
  late String type;

  Tailor({
    this.id,
    required this.name,
    required this.number,
    required this.number_country,
    required this.number_country_code,
    required this.pending_orders,
    required this.skills,
    this.email,
    required this.store_id,
    required this.tailor_status,
    required this.type,
  });

  Tailor.fromJson(json1) {
    // print(json1);
    // id = json1.key;
    // name = json1.value['name'];
    // number = json1.value['number'];
    // number_country = json1.value['number_country'];
    // number_country_code = json1.value['number_country_code'];
    // pending_orders = json1.value['pending_orders'];
    // skills = json1.value['skills'];
    id = json1.data['\$id'];
    name = json1.data['name'];
    number = json1.data['number'];
    number_country = json1.data['number_country'];
    number_country_code = json1.data['number_country_code'];
    pending_orders = json1.data['pending_orders'].toString();
    skills = json1.data['skills'];
    email = json1.data['email'];
    store_id = json1.data['store_id'];
    tailor_status = json1.data['tailor_status'];
    type = json1.data['type'];
  }

 Tailor.fromFunction(json1) {
    // print(json1);
    // id = json1.key;
    // name = json1.value['name'];
    // number = json1.value['number'];
    // number_country = json1.value['number_country'];
    // number_country_code = json1.value['number_country_code'];
    // pending_orders = json1.value['pending_orders'];
    // skills = json1.value['skills'];
    id = json1['\$id'];
    name = json1['name'];
    number = json1['number'];
    number_country = json1['number_country'];
    number_country_code = json1['number_country_code'];
    pending_orders = json1['pending_orders'].toString();
    skills = json1['skills'];
    email = json1['email'];
    store_id = json1['store_id'];
    tailor_status = json1['tailor_status'];
    type = json1['type'];
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['number_country'] = number_country;
    data['number_country_code'] = number_country_code;
    data['name'] = name;
    data['pending_orders'] = pending_orders;
    data['skills'] = skills;
    data['email'] = email;
    data['store_id'] = store_id;
    data['tailor_status'] = tailor_status;
    data['type'] = type;
    return data;
  }

  map(DropdownMenuItem<Object> Function(dynamic e) param0) {}
}
