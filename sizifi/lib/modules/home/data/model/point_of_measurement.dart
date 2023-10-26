class PointOfMeasurement {
  late String name;
  late String item_type_id;
  String? id;

  PointOfMeasurement({required this.name, required this.item_type_id});

  PointOfMeasurement.fromJson(json1) {
    id = json1.data["\$id"];
    name = json1.data['name'];
    item_type_id = json1.data['item_type_id'];
  }

  PointOfMeasurement.fromFunction(json1) {
    id = json1["\$id"];
    name = json1['name'];
    item_type_id = json1['item_type_id'];
    print(id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['item_type_id'] = item_type_id;
    return data;
  }
}
