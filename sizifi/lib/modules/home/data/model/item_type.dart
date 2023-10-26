import 'package:sizifi/modules/home/data/model/point_of_measurement.dart';
//import 'package:sizifi/modules/home/notifiers/point_of_measurement_state.dart';

class ItemType {
  late String? id;
  late String name;
  late String description;
  late String? store_id;
  List<PointOfMeasurement>? pom;

  ItemType({
    this.id,
    required this.name,
    required this.description,
    required this.store_id,
    required this.pom,
    //required String type,
  });

  ItemType.fromJson(json1) {
    id = json1.data['\$id'];
    name = json1.data['name'];
    description = json1.data['description'];
    store_id = json1.data['store_id'];
    pom = null;
    // PointOfMeasurementState ps = new PointOfMeasurementState();
    // ps.getPointOfMeasurement(this);

    // // pom =  ps.pointsOfMeasurementResults;

    // print(name + pom.length.toString());
  }

   ItemType.fromFunction(json1) {
    id = json1['\$id'];
    name = json1['name'];
    description = json1['description'];
    store_id = json1['store_id'];
    pom = null;
   }
  //get type => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['description'] = description;
    data['store_id'] = store_id;

    return data;
  }
}
