class DeliveryModes {
  late String? id;
  late String mode_name;
  late String store_id;

  DeliveryModes({
    this.id,
    required this.mode_name,
  });

  DeliveryModes.fromJson(json1) {
    store_id = json1.data["store_id"];
    id = json1.data['\$id'];
    mode_name = json1.data['mode_name'];
  }

  DeliveryModes.fromFunction(json1) {
    store_id = json1["store_id"];
    id = json1['\$id'];
    mode_name = json1['mode_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;

    data["store_id"] = store_id;
    data['mode_name'] = mode_name;
    return data;
  }
}
