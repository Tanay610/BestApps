//import 'package:appwrite/models.dart';

class DeliveryCharges {
  String? id;
  late String name;
  late String currency;
  late String price;
  late String store_id;

  //late String charge;
  DeliveryCharges({
    this.id,
    required this.store_id,
    required this.name,
    required this.currency,
    required this.price,
    // required String charge
  });

  DeliveryCharges.fromJson(json1) {
    id = json1.data['\$id'];
    store_id = json1.data["store_id"];

    name = json1.data['name'];
    currency = json1.data['currency'];
    price = json1.data['price'];
    //charge = json1.data['charge'];
  }

  DeliveryCharges.fromFunc(json1) {
    id = json1['\$id'];
    store_id = json1["store_id"];

    name = json1['name'];
    currency = json1['currency'];
    price = json1['price'];
    //charge = json1.data['charge'];
  }

  //String get charge => charge;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data["store_id"] = store_id;

    data['name'] = name;
    data['currency'] = currency;
    data['price'] = price;
    //data['charge'] = charge;
    return data;
  }

//   fromJson(Document tr) {}
}
