import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/Order%20pages/increment_provider.dart';
import 'package:sizifi/modules/home/data/model/orders.dart';
import 'package:sizifi/modules/home/notifiers/delivery_charges_state.dart';
import 'package:sizifi/modules/home/widgets/order_item.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/reuseable_widgets/date_textfield.dart';
import '../notifiers/store_state.dart';
import '../../authentication/notifiers/auth_state.dart';
import '../data/model/delivery_charges.dart';
import '../data/model/order_item.dart';
import '../data/model/tailor.dart';
import '../notifiers/order_state.dart';
import '../notifiers/tailor_state.dart';

class AddOrderScreen extends StatefulWidget {
  final Order? order;
  const AddOrderScreen({
    Key? key,
    this.order,
  }) : super(key: key);

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  String? selectedValue;
  int inum1 = 1;

  late DateTime today;
  late TextEditingController _customerNameController;
  String? _customer_number;
  String? _customer_number_country;
  String? _customer_number_country_code;
  late String? _item;
  List<OrderItem> _items = [];
  String? _tailor;
  Tailor? _tailorObj;
  List<Tailor> _tailors = [];
  String? _deliverycharge;
  List<DeliveryCharges> _deliverycharges = [];
  final List<dynamic> _members = [];
  late String? _assigned_to;
  late String _store_id;
  late TextEditingController _invoiceNumberController;
  // late DateTime _invoiceDateController;
  //late TextEditingController _notesController;
  //late TextEditingController _storeNotesController;
  late String? notes;
  late String? storeNotes;
  late TextEditingController _tailorNotesController;
  String _statusController = "Initiated";
  final String _delivery_modeController = "Store-Pickup";
  late String? _delivery_chargesController = "29";
  late String? tailor_type;
  String? _orderId;
  bool _isEdit = false;
  late String title;
  // late DateTime _deliveryDate;
  late String _storePickupController = "store";
  bool _isValid = false;
  String error = "Please Fill missing fields";
  TextEditingController adrController = TextEditingController();
  TextEditingController addrController = TextEditingController();
  TextEditingController landmarkControl = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController _invoiceDateController = TextEditingController();
  TextEditingController _expectedDeliveryController = TextEditingController();
  TextEditingController _customerNotesController = TextEditingController();
  TextEditingController _storeNotesController = TextEditingController();

  //! change log variables
  String? selectedDropdownValue;
  List dropdownItems = [];
  List<Tailor> warehouseTailors = [];
  List<Tailor> storeTailors = [];

  void insertItem() {
    setState(
      () {
        // value:
        // _item == null ? null : _item.toString();
        OrderItem ot = OrderItem(
          id: null,
          order_id: null,
          name: "",
          item_data: [],
          item_type: '',
        );
        insertMeasurement(ot);
        _items.add(ot);
        inum1++;
      },
    );
  }

  void insertMeasurement(OrderItem ot) {
    // setState(() {
    var itemData = {
      "pom": "other",
      "pomid": "other",
      "measurement": "0",
      "unit": "Inches",
      "other": "other"
    };
    // OrderItem oth = _items.firstWhere((item) => item.id == ot.id);
    ot.item_data.add(itemData);
    //print(ot.item_data);
    // });
  }

  void deleteItem(int index) {
    setState(
      () {
        //print("Deleting item:$index");
        _items.removeAt(index);
      },
    );
  }

  void refreshState() {
    setState(() {});
  }

  @override
  void initState() {
    // updateTailors();
    Future.delayed(
      Duration.zero,
      () {
        if (_tailors.isEmpty) {
          showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("No Tailors Found"),
                content: const Text(
                    "Please enter tailor details in tailor management."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.addTailor, ModalRoute.withName('/'));
                    },
                    child: const Text('Add Tailor'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
    //print(widget.order);

    _isEdit = widget.order != null;

    today = DateTime.now();
    _customerNameController = TextEditingController(
        text: _isEdit
            ? widget.order?.customer_name != "null"
                ? widget.order?.customer_name
                : null
            : null);
    _customer_number = _isEdit
        ? widget.order?.customer_number != "null"
            ? widget.order?.customer_number
            : ""
        : "";
    _customer_number_country = _isEdit
        ? widget.order?.customer_number_country != "null"
            ? widget.order?.customer_number_country
            : 'IN'
        : 'IN';
    _customer_number_country_code = _isEdit
        ? widget.order?.customer_number_country_code != "null"
            ? widget.order?.customer_number_country_code
            : '+91'
        : '+91';
    _invoiceNumberController = TextEditingController(
        text: _isEdit
            ? widget.order?.invoice != "null"
                ? widget.order?.invoice
                : null
            : null);
    _tailor = _isEdit
        ? widget.order?.tailor != "null"
            ? widget.order?.tailor
            : null
        : null;
    _statusController = _isEdit ? widget.order!.status : "Initiated";
    _orderId = _isEdit ? widget.order?.id : null;
    _assigned_to = "";
    title = _isEdit ? "Edit Order" : "Add Order";
    _items = _isEdit ? widget.order!.items : [];

    // _deliveryDate = _isEdit ? widget.order!.delivery_date : today;
    _expectedDeliveryController = (_isEdit
        ? TextEditingController(text: "${widget.order!.delivery_date}")
        : TextEditingController());

    // _invoiceDateController = _isEdit ? widget.order!.invoice_date : today;
    _invoiceDateController = (_isEdit
        ? TextEditingController(text: "${widget.order!.invoice_date}")
        : TextEditingController());
    _customerNotesController = TextEditingController(
        text: _isEdit
            ? widget.order?.customer_notes != "null"
                ? widget.order?.customer_notes
                : null
            : null);
    _storeNotesController = TextEditingController(
        text: _isEdit
            ? widget.order?.store_notes != "null"
                ? widget.order?.store_notes
                : null
            : null);
    notes = _isEdit
        ? widget.order?.customer_notes != "null"
            ? widget.order?.customer_notes
            : null
        : null;
    storeNotes = _isEdit
        ? widget.order?.store_notes != "null"
            ? widget.order?.store_notes
            : null
        : null;

    tailor_type = _isEdit
        ? widget.order?.tailor_type != "null"
            ? widget.order?.tailor_type
            : null
        : null;
    _delivery_chargesController = _isEdit
            ? widget.order?.delivery_charges != "null"
                ? widget.order?.delivery_charges
                : null
            : null
        // "Delivery Charges"
        ;
    if (!_isEdit) {
      insertItem();
    }
    super.initState();
  }

  getMembers() {
    List<DropdownMenuItem> items = [];
    for (var ms in _members) {
      DropdownMenuItem<String> dd = DropdownMenuItem<String>(
        alignment: AlignmentDirectional.centerStart,
        value: ms['userId'].toString(),
        child: Text(ms['userName']),
      );

      setState(() {
        items.add(dd);
      });
    }

    return items;
  }

  void updateTailors(String type) {
    if (type == "wh") {
      setState(() {
        storeTailors = [];
        warehouseTailors =
            _tailors.where((tailor) => tailor.type == "wh").toList();
      });
    } else if (type == "store") {
      setState(() {
        warehouseTailors = [];
        storeTailors =
            _tailors.where((tailor) => tailor.type == "store").toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    StoreState ss = Provider.of<StoreState>(context);
    List stores = ss.stores;
    Future.delayed(Duration.zero, () {
      if (ss.stores.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.addStore, ModalRoute.withName('/'));
        // Navigator.pushNamed(context, );
      } else {
        // _members = ss.activeStore.members;
        _store_id = _isEdit
            ? widget.order!.store_id
            : Provider.of<StoreState>(context, listen: false)
                .activeStore!
                .team_id;
        //print(_members);
      }
      ;
    });

    _deliverycharges =
        Provider.of<DeliveryChargesState>(context).deliveryChargesList;
    _tailors = Provider.of<TailorState>(context).tailors;
    //print("dsahasdyuoi${_tailors}");

    warehouseTailors = _tailors.where((tailor) => tailor.type == "wh").toList();
    storeTailors = _tailors.where((tailor) => tailor.type == "store").toList();

    if (_assigned_to == "") {
      if (_isEdit) {
        setState(() {
          _assigned_to = widget.order?.assigned_to;
        });
      } else {
        setState(() {
          _assigned_to = Provider.of<AuthState>(context).user.id;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            _isEdit ? 'Edit Order' : 'Create Order',
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.homeBottom, (_) => false);
              },
              child: Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  child: const Center(
                      child: Icon(Icons.arrow_back,
                          color: Color(0xFFA74A45), size: 20)))),
          actions: [
            InkWell(
              onTap: () async {
                if (_customerNameController.text != "" &&
                    _customer_number.toString() != "" &&
                    _tailor != null) {
                  var allSet = true;
                  for (var item in _items) {
                    if (item.name != "") {
                      for (var data in item.item_data) {
                        var measurement = data;
                        if (measurement["pom"] == "" ||
                            measurement["measurement"] == 0) {
                          allSet = false;
                        }
                      }
                    } else {
                      allSet = false;
                    }
                  }
                  if (allSet) {
                    _isValid = true;
                  }
                } else {}

                if (_isValid) {
                  try {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.homeBottom, ((route) => false));
                  } catch (e) {
                    //print(e);
                  }
                } else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(error),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
                }
                // Navigator.pushNamed(context, AppRoutes.home)
                //     .then((_) => setState(() {
                //           // //print("THis runs");
                //         }));
              },
              child: Container(),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: ListView(children: [
              Text(
                'Order Details',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333)),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: _customerNameController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    hintText: "Customer name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 13),
              IntlPhoneField(
                initialValue: _customer_number,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    hintText: "Customer Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
                initialCountryCode: _customer_number_country,
                onChanged: (phone) {
                  _customer_number = phone.number;
                  _customer_number_country = phone.countryISOCode;
                  _customer_number_country_code = phone.countryCode;
                },
              ),
              const SizedBox(height: 13),
              TextField(
                controller: _invoiceNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  hintText: "Invoice Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Stack(
              //   children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: DateTimePickerTextField(
                      label: "Invoice Date",
                      textController: _invoiceDateController),
                ),
              ),
              //   ],
              // ),
              const SizedBox(height: 0),
              Visibility(
                visible: _isEdit,
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Status: ',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15)),
                          child: ButtonTheme(
                            alignedDropdown: true,
                            buttonColor: const Color(0xFF000000),
                            child: DropdownButton<String>(
                              underline: const Text(""),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              menuMaxHeight: 450,
                              isExpanded: true,
                              value: _statusController,
                              items: <String>[
                                'Initiated',
                                'Under Alteration',
                                'Measurement/Notes Update',
                                'Altered & Ready',
                                'Delivered',
                                'On hold',
                                'Canceled',
                                //'Reassigned Tailor',
                              ].map((String newwvalue) {
                                return DropdownMenuItem<String>(
                                  value: newwvalue,
                                  child: Center(
                                    child: Text(
                                      newwvalue,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    _statusController = val.toString();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderItems(
                      insertMeasurement: insertMeasurement,
                      removeItems: deleteItem,
                      refreshState: refreshState,
                      items: _items,
                      edit: true,
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        insertItem();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 55.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFA74A45),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(18.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '+ Add Item',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF333333)),
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
              const SizedBox(height: 35),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tailor Type',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          value: tailor_type,
                          items: const [
                            DropdownMenuItem(
                              value: "wh",
                              child: Text("WareHouse Tailor"),
                            ),
                            DropdownMenuItem(
                              value: "store",
                              child: Text("Store Tailor"),
                            ),
                          ],
                          onChanged: (v) {
                            setState(() {
                              tailor_type = v;
                              _tailor = tailor_type == "wh"
                                  ? warehouseTailors.first.id
                                  : storeTailors.first.id;
                              //print(tailor_type);
                              // updateTailors(tailor_type!);
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tailor',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            itemHeight: 72,
                            // decoration: const InputDecoration(
                            //   border: InputBorder.none,
                            //   contentPadding: EdgeInsets.all(0),
                            // ),
                            icon: const Icon(Icons.arrow_drop_down,
                                size: 27, color: Colors.black54),
                            borderRadius: BorderRadius.circular(8),
                            hint: Text(
                              "Select Tailor",
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            // ignore: prefer_null_aware_operators
                            value: _tailor,
                            // isExpanded: true,
                            items: (tailor_type == 'wh'
                                    ? warehouseTailors
                                    : storeTailors)
                                .map((Tailor tailor) {
                              // //print(widget.order?.tailor);
                              // //print(tailor.id.toString());
                              return DropdownMenuItem(
                                alignment: Alignment.center,
                                value: tailor.id.toString(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              tailor.name,
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  // fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Text("Skills: ${tailor.skills}",
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                )),
                                            Text(
                                              "Pending Orders: ${tailor.pending_orders}",
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (tailorID) {
                              setState(
                                () {
                                  _tailorObj = _tailors
                                      .where(
                                          (element) => element.id == tailorID)
                                      .first;
                                  // _tailor = int.parse(tailorID.toString());
                                  _tailor = tailorID!;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _customerNotesController,
                    // controller = customerNotesController,
                    decoration: const InputDecoration(
                        hintText: "Customer Notes",
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                    onChanged: (name) {
                      // = name;
                      notes = name;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    controller: _storeNotesController,
                    decoration: const InputDecoration(
                        hintText: "Store Notes",
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                    onChanged: (name) {
                      storeNotes = name;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333)),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: DateTimePickerTextField(
                          label: "Expected Delivery",
                          textController: _expectedDeliveryController),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 6, right: 5),
                      child: DropdownButtonFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        value: _storePickupController,
                        items: [
                          DropdownMenuItem(
                            value: "store",
                            child: Text(
                              "Store Pickup",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000).withOpacity(0.6),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "home_delivery",
                            child: Text(
                              "Home Delivery",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "paid_home",
                            child: Text(
                              "Paid Home Delivery",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (v) {
                          setState(
                            () {
                              _storePickupController = v.toString();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Visibility(
                      visible: _storePickupController != "store",
                      child: Column(children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.normal),
                              ),
                              value: _deliverycharge == null
                                  ? null
                                  : _deliverycharge.toString(),
                              isExpanded: true,
                              itemHeight: null,
                              items: _deliverycharges
                                  .map((DeliveryCharges deliveryCharge) {
                                return DropdownMenuItem<String>(
                                  alignment: AlignmentDirectional.centerStart,
                                  value: deliveryCharge.id.toString(),
                                  child: Text(deliveryCharge.name),
                                );
                              }).toList(),
                              onChanged: (deliveryChargeID) {
                                setState(
                                  () {
                                    _deliverycharge = deliveryChargeID!;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: adrController,
                          decoration: const InputDecoration(
                              hintText: "Address 1",
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          onChanged: (name) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: addrController,
                          decoration: const InputDecoration(
                              hintText: "Address 2",
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          onChanged: (name) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: landmarkControl,
                          decoration: const InputDecoration(
                              hintText: "Land Mark",
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          onChanged: (name) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                              hintText: "City",
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          onChanged: (name) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: stateController,
                          decoration: const InputDecoration(
                              hintText: "State",
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          onChanged: (name) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: pincodeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "Pincode",
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          onChanged: (name) {},
                        ),
                      ])),
                ],
              )),
              const SizedBox(height: 15),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Assigned To',
                    //   style: GoogleFonts.poppins(
                    //       fontSize: 22,
                    //       fontWeight: FontWeight.w600,
                    //       color: const Color(0xFF333333)),
                    // ),
                    // const SizedBox(height: 5),
                    // Container(
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFFFFFFFF),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ButtonTheme(
                    //     alignedDropdown: true,
                    //   //   child: DropdownButton<dynamic>(
                    //   //     underline: const Text(""),
                    //   //     style: GoogleFonts.roboto(
                    //   //       textStyle: const TextStyle(
                    //   //           // fontSize: 18,
                    //   //           color: Colors.black,
                    //   //           fontWeight: FontWeight.normal),
                    //   //     ),
                    //   //     isExpanded: true,
                    //   //     value: _assigned_to,
                    //   //     items: getMembers(),
                    //   //     onChanged: (newstatus) {
                    //   //       setState(
                    //   //         () {
                    //   //           _assigned_to = newstatus.toString();
                    //   //         },
                    //   //       );
                    //   //     },
                    //   //   ),
                    //   // ),
                    // ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: const Color(0xFFA74A45),
                        ),
                        onPressed: () async {
                          OrderCountProvider occcProvider =
                              Provider.of<OrderCountProvider>(context,
                                  listen: false);
                          if (_customerNameController.text != "" &&
                              _customer_number.toString() != "" &&
                              _tailor != null) {
                            var allSet = true;
                            //print(allSet);
                            for (var item in _items) {
                              if (item.name != "") {
                                for (var data in item.item_data) {
                                  print(data);
                                  var measurement = data;
                                  if (measurement["pom"] == "" ||
                                      measurement["measurement"] == 0) {
                                    allSet = false;
                                    print(measurement["pom"]);
                                    print("$allSet After");
                                  }
                                }
                              } else {
                                allSet = false;
                              }
                            }
                            if (allSet) {
                              _isValid = true;
                            }
                          } else {}

                          if (_isValid) {
                            //print(today);
                            //print(_expectedDeliveryController.text);
                            // //print(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
                            //     expectedDeliveryController.text.toString()));
                            // //print(_invoiceDateController);
                            try {
                              Order order = Order(
                                id: _orderId,
                                customer_name: _customerNameController.text,
                                customer_number: _customer_number.toString(),
                                customer_number_country:
                                    _customer_number_country.toString(),
                                customer_number_country_code:
                                    _customer_number_country_code.toString(),
                                invoice: _invoiceNumberController.text,
                                status: _statusController,
                                items: _items,
                                //customer_notes: _notesController.text,
                                //store_notes: _storeNotesController.text,
                                //customer_notes: notes.toString(),
                                customer_notes: _customerNotesController.text,
                                store_notes: storeNotes.toString(),
                                // delivery_date: _deliveryDate,
                                // delivery_date: today,
                                delivery_date: _expectedDeliveryController.text,
                                delivery_mode: _delivery_modeController,
                                tailor: _tailor.toString(),
                                created_at: _isEdit
                                    ? widget.order!.created_at
                                    : DateTime.now(),
                                updated_at: DateTime.now(),
                                assigned_to: _assigned_to.toString(),
                                store_id: _store_id,

                                tailor_type: tailor_type.toString(),
                                delivery_charges:
                                    _delivery_chargesController.toString(),
                                address_1: adrController.text,
                                address_2: addrController.text,
                                city: cityController.text,
                                // invoice_date: _invoiceDateController,
                                // invoice_date: today,
                                invoice_date: _invoiceDateController.text,
                                landmark: landmarkControl.text,
                                pin_code: pincodeController.text,
                                state: stateController.text,
                                is_draft: false,
                              );

                              OrderState os = Provider.of<OrderState>(context,
                                  listen: false);
                              StoreState ss = Provider.of<StoreState>(context,
                                  listen: false);
                              if (_isEdit) {
                                await os.updateOrder(
                                    order, ss.activeStore!.team_id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text("Order Details Updated!!"),
                                    backgroundColor:
                                        Theme.of(context).splashColor,
                                  ),
                                );
                              } else {
                                await os.addOrder(
                                    order, ss.activeStore!.team_id, context);
                                // ocountProvider.incrementOrderCount();
                                //print("new Order created");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: const Text("Order Created!!"),
                                        backgroundColor:
                                            Theme.of(context).splashColor));
                                occcProvider.incrementOrderCount();
                              }

                              Navigator.pushNamedAndRemoveUntil(context,
                                  Routes.homeBottom, ((route) => false));
                            } catch (e) {
                              //print("hahahaha!");
                              //print(e);
                            }
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(error),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'))
                                ],
                              ),
                            );
                          }
                          // Navigator.pushNamed(context, AppRoutes.home)
                          //     .then((_) => setState(() {
                          //           // //print("THis runs");
                          //         }));
                        },
                        child: Text(
                          _isEdit ? "Update order" : "Create order",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    !_isEdit
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 52,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                backgroundColor:
                                    const Color(0xFFA74A45).withOpacity(0.44),
                              ),
                              onPressed: () async {
                                try {
                                  //print(today);
                                  Order order = Order(
                                      id: _orderId,
                                      customer_name:
                                          _customerNameController.text,
                                      customer_number:
                                          _customer_number.toString(),
                                      customer_number_country:
                                          _customer_number_country.toString(),
                                      customer_number_country_code:
                                          _customer_number_country_code
                                              .toString(),
                                      invoice: _invoiceNumberController.text,
                                      status: _statusController,
                                      items: _items,
                                      customer_notes:
                                          _customerNotesController.text,
                                      store_notes: _storeNotesController.text,
                                      // delivery_date: _deliveryDate,
                                      delivery_date:
                                          _expectedDeliveryController.text,
                                      delivery_mode: _delivery_modeController,
                                      tailor: _tailor.toString(),
                                      created_at: _isEdit
                                          ? widget.order!.created_at
                                          : DateTime.now(),
                                      updated_at: DateTime.now(),
                                      assigned_to: _assigned_to.toString(),
                                      store_id: _store_id,
                                      tailor_type: tailor_type.toString(),
                                      delivery_charges:
                                          _delivery_chargesController
                                              .toString(),
                                      address_1: adrController.text,
                                      address_2: addrController.text,
                                      city: cityController.text,
                                      // invoice_date: _invoiceDateController,
                                      invoice_date: _invoiceDateController.text,
                                      landmark: landmarkControl.text,
                                      pin_code: pincodeController.text,
                                      state: stateController.text,
                                      tailorObj: _tailorObj,
                                      is_draft: true);

                                  OrderState os = Provider.of<OrderState>(
                                      context,
                                      listen: false);
                                  StoreState ss = Provider.of<StoreState>(
                                      context,
                                      listen: false);
                                  if (_isEdit) {
                                    await os.updateOrder(
                                        order, ss.activeStore!.team_id);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          const Text("Order Details Updated!!"),
                                      backgroundColor:
                                          Theme.of(context).splashColor,
                                    ));
                                  } else {
                                    await os.addOrder(order,
                                        ss.activeStore!.team_id, context);
                                    // ocountProvider.incrementOrderCount();
                                    //print("Draft created");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: const Text("Draft Saved"),
                                            backgroundColor:
                                                Theme.of(context).splashColor));
                                  }
                                  // ocountProvider.incrementOrderCount();
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.homeBottom, ((route) => false));
                                } catch (e) {
                                  //print("hahahaha!");
                                  //print(e);
                                }
                              },
                              child: Text(
                                "Save Draft",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              const SizedBox(height: 35),
            ])),
      ),
    );
  }
}
