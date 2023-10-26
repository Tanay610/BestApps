import 'package:sizifi/modules/home/data/model/delivery_charges.dart';
import 'package:sizifi/modules/home/data/model/order_item.dart';
import 'package:sizifi/modules/home/notifiers/item_state.dart';
import 'package:sizifi/modules/home/notifiers/tailor_state.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';

class Order {
  late String? id;
  // late Permissions permissions;
  late String customer_name;
  late String customer_number;
  late String customer_number_country;
  late String customer_number_country_code;
  late String? invoice;
  late String status;
  late DateTime created_at;
  late DateTime updated_at;
  late List<OrderItem> items;
  late String tailor;
  late String? customer_notes;
  late String? store_notes;
  late String tailor_type;

  late String delivery_charges;
  late String address_1;
  late String address_2;
  late String landmark;
  late String city;
  late String state;
  late String pin_code;
  late String invoice_date;
  // late String? tailorNotes;
  late String delivery_date;
  late String delivery_mode;
  late Tailor? tailorObj;
  late String assigned_to;
  late String store_id;

  late DeliveryCharges? deliveryChargesobj;

  late bool is_draft;

  Order({
    this.id,
    // required this.permissions,
    required this.customer_name,
    required this.customer_number,
    required this.customer_number_country,
    required this.customer_number_country_code,
    this.invoice,
    required this.status,
    required this.items,
    required this.created_at,
    required this.updated_at,
    required this.delivery_charges,
    required this.address_1,
    required this.address_2,
    required this.landmark,
    required this.city,
    required this.state,
    required this.pin_code,
    required this.invoice_date,
    required this.customer_notes,
    required this.store_notes,
    // this.tailorNotes,
    required this.tailor,
    required this.tailor_type,
    required this.delivery_mode,
    required this.delivery_date,
    required this.assigned_to,
    required this.store_id,
    required this.is_draft,
    this.tailorObj,
  });

  Order.fromJson(json1) {
    // print(json1.value['\$id']);
    // permissions = (json1$permissions != null
    //     ? new Permissions.fromJson(json1.$permissions)
    //     : null)!;
    // id = json1.key;
    // customer_name = json1.value['customer_name'];
    // customer_number = json1.value['customer_number'];
    // customer_number_country = json1.value['customer_number_country'];
    // customer_number_country_code = json1.value['customer_number_country_code'];
    // invoice_number = json1.value['invoice_number'];
    // status = json1.value['status'];
    // notes = json1.value['notes'];
    // storeNotes = json1.value['storeNotes'];
    // tailorNotes = json1.value['tailorNotes'];
    // created_at = DateTime.fromMillisecondsSinceEpoch(json1.value['created_at']);
    // updated_at = DateTime.fromMillisecondsSinceEpoch(json1.value['updated_at']);
    // tailor = json1.value['tailor'];
    // delivery_mode = json1.value['delivery_mode'];
    // delivery_date =`
    //     DateTime.fromMillisecondsSinceEpoch(json1.value['delivery_date']);
    // print(json1.data);

    id = json1.data['\$id'];
    customer_name = json1.data['customer_name'];
    customer_number = json1.data['customer_number'];
    customer_number_country = json1.data['customer_number_country'];
    customer_number_country_code = json1.data['customer_number_country_code'];
    invoice = json1.data['invoice'];
    status = json1.data['status'];
    customer_notes = json1.data['customer_notes'].toString();
    store_notes = json1.data['store_notes'].toString();
    // tailorNotes = json1.data['tailorNotes'].toString();
    created_at = DateTime.parse(json1.data['created_at']);
    updated_at = DateTime.parse(json1.data['updated_at']);
    tailor = json1.data['tailor'];
    delivery_mode = json1.data['delivery_mode'];

    delivery_date = json1.data['delivery_date'];
    assigned_to = json1.data['assigned_to'];
    store_id = json1.data['store_id'];
    delivery_charges = json1.data['delivery_charges'];
    address_1 = json1.data['address_1'];
    address_2 = json1.data['address_2'];
    landmark = json1.data['landmark'];
    city = json1.data['city'];
    state = json1.data['state'];
    pin_code = json1.data['pin_code'];
    invoice_date = json1.data['invoice_date'];
    tailor_type = json1.data['tailor_type'];
    is_draft = json1.data['is_draft'];

    OrderItemState().getItems(this);
    TailorState ts = TailorState();

    ts.getTailor(tailor);
    items = OrderItemState().items;
    try {
      tailorObj = ts.tailor;
    } catch (e) {
      tailorObj = null;
    }

    // print(items);
  }

  Order.fromFunction(json1) {
    // print(json1.value['\$id']);
    // permissions = (json1$permissions != null
    //     ? new Permissions.fromJson(json1.$permissions)
    //     : null)!;
    // id = json1.key;
    // customer_name = json1.value['customer_name'];
    // customer_number = json1.value['customer_number'];
    // customer_number_country = json1.value['customer_number_country'];
    // customer_number_country_code = json1.value['customer_number_country_code'];
    // invoice_number = json1.value['invoice_number'];
    // status = json1.value['status'];
    // notes = json1.value['notes'];
    // storeNotes = json1.value['storeNotes'];
    // tailorNotes = json1.value['tailorNotes'];
    // created_at = DateTime.fromMillisecondsSinceEpoch(json1.value['created_at']);
    // updated_at = DateTime.fromMillisecondsSinceEpoch(json1.value['updated_at']);
    // tailor = json1.value['tailor'];
    // delivery_mode = json1.value['delivery_mode'];
    // delivery_date =`
    //     DateTime.fromMillisecondsSinceEpoch(json1.value['delivery_date']);
    // print(json1.data);

    id = json1['\$id'];
    customer_name = json1['customer_name'];
    customer_number = json1['customer_number'];
    customer_number_country = json1['customer_number_country'];
    customer_number_country_code = json1['customer_number_country_code'];
    invoice = json1['invoice'];
    status = json1['status'];
    customer_notes = json1['customer_notes'].toString();
    store_notes = json1['store_notes'].toString();
    // tailorNotes = json1.data['tailorNotes'].toString();
    created_at = DateTime.parse(json1['created_at']);
    updated_at = DateTime.parse(json1['updated_at']);
    tailor = json1['tailor'];
    delivery_mode = json1['delivery_mode'];

    delivery_date = json1['delivery_date'];
    assigned_to = json1['assigned_to'];
    store_id = json1['store_id'];
    delivery_charges = json1['delivery_charges'];
    address_1 = json1['address_1'];
    address_2 = json1['address_2'];
    landmark = json1['landmark'];
    city = json1['city'];
    state = json1['state'];
    pin_code = json1['pin_code'];
    invoice_date = json1['invoice_date'];
    tailor_type = json1['tailor_type'];
    is_draft = json1['is_draft'];

    // OrderItemState().getItems(this);
    TailorState ts = TailorState();

    // ts.getTailor(tailor);
    items = OrderItemState().items;
    try {
      tailorObj = ts.tailor;
    } catch (e) {
      tailorObj = null;
    }

    // print(items);
  }

  // DeliveryChargesState().getDeliveryCharges(this);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_name'] = customer_name;
    data['customer_number'] = customer_number;
    data['customer_number_country'] = customer_number_country;
    data['customer_number_country_code'] = customer_number_country_code;
    data['invoice'] = invoice;
    data['tailor'] = tailor;
    data['status'] = status;
    data['created_at'] = created_at.toIso8601String();
    data['updated_at'] = updated_at.toIso8601String();
    data['delivery_mode'] = delivery_mode;
    data['customer_notes'] = customer_notes;
    data['store_notes'] = store_notes;
    // data['tailorNotes'] = tailorNotes;
    data['assigned_to'] = assigned_to;
    data['store_id'] = store_id;
    data['delivery_date'] = delivery_date;
    data['assigned_to'] = assigned_to;
    data['store_id'] = store_id;
    data['delivery_charges'] = delivery_charges;
    data['address_1'] = address_1;
    data['address_2'] = address_2;
    data['landmark'] = landmark;
    data['city'] = city;
    data['state'] = state;
    data['pin_code'] = pin_code;
    data['invoice_date'] = invoice_date;
    data['tailor_type'] = tailor_type;
    data['is_draft'] = is_draft;
    return data;
  }
}
