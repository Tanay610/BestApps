class Templates {
  late String? id;
  late bool type;
  late String status;
  late String store_id;
  late String template;
  late bool synced;

  Templates({
    this.id,
    required this.type,
    required this.status,
    required this.store_id,
    required this.template,
    required this.synced,
  });

  Templates.fromJson(json) {
    id = json.data['\$id'];
    type = json.data['type'];
    status = json.data['status'];
    store_id = json.data['store_id'];
    template = json.data['template'];
    synced = true;
  }

   Templates.fromFunction(json) {
    id = json['\$id'];
    type = json['type'];
    status = json['status'];
    store_id = json['store_id'];
    template = json['template'];
    synced = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['status'] = status;
    data['store_id'] = store_id;
    data['template'] = template;
    return data;
  }
}