class Store {
  String? id;
  late String team_id;
  late String location;
  late String about;
  late String order_no_prefix;
  late String next_no;
  late String store_name;
  late String store_brand_name;
  late String brand_store;
  late String email;
  late String phone_no;
  late String address_1;
  late String address_2;
  late String landmark;
  late String city;
  late String pin_code;
  late String state;
  late String country;
  // late int total;
  // late List members;

  Store(
      {this.id,
      required this.team_id,
      required this.location,
      required this.about,
      required this.order_no_prefix,
      required this.next_no,
      required this.store_name,
      required this.store_brand_name,
      required this.brand_store,
      required this.email,
      required this.phone_no,
      required this.address_1,
      required this.address_2,
      required this.landmark,
      required this.city,
      required this.pin_code,
      required this.state,
      required this.country});

  Store.fromJson(json1) {
    // print(json1.toString());
    // print(json1["members"]["memberships"]);
    id = json1["\$id"];
    team_id = json1["teamId"];
    //print(id);
    location = json1["location"];
    about = json1["about"];
    order_no_prefix = json1["order_no_prefix"];
    next_no = json1["next_no"];
    //members = json1["members"];
    store_name = json1["store_name"];
    store_brand_name = json1["store_brand_name"];
    brand_store = json1["brand_store"];
    email = json1["email"];
    phone_no = json1["phone_no"];
    address_1 = json1["address_1"];
    address_2 = json1["address_2"];
    landmark = json1["landmark"];
    city = json1["city"];
    pin_code = json1["pin_code"];
    state = json1["state"];
    country = json1["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_id'] = team_id;
    data['location'] = location;
    data['about'] = about;
    data["order_no_prefix"] = order_no_prefix;
    data["next_no"] = next_no;
    data['store_name'] = store_name;
    data['store_brand_name'] = store_brand_name;
    data['brand_store'] = brand_store;
    data['email'] = email;
    data['phone_no'] = phone_no;
    data['address_1'] = address_1;
    data['address_2'] = address_2;
    data['landmark'] = landmark;
    data['city'] = city;
    data['pin_code'] = pin_code;
    data['state'] = state;
    data['country'] = country;
    return data;
  }
}
