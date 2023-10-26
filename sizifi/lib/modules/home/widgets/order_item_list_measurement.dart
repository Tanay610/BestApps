import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sizifi/modules/home/data/model/item_type.dart';
import 'package:sizifi/modules/home/data/model/order_item.dart';
import 'package:sizifi/modules/home/data/model/point_of_measurement.dart';

import '../data/model/item_type.dart';

class OrderItemsListMeasurement extends StatefulWidget {
  final data;
  final OrderItem item;
  final itemDataCount;
  final index;
  final refreshState;
  const OrderItemsListMeasurement({
    Key? key,
    required this.data,
    this.itemDataCount,
    required this.item,
    this.index,
    this.refreshState,
  }) : super(key: key);

  @override
  State<OrderItemsListMeasurement> createState() =>
      _OrderItemsListMeasurementState();
}

class _OrderItemsListMeasurementState extends State<OrderItemsListMeasurement> {
  String pom = "other";
  String unit = "Inches";
  String? _measurement;
  List<ItemType> _measurements = [];
  late final TextEditingController _measurementValueController =
      TextEditingController(text: widget.data['measurement'].toString());
  List<DropdownMenuItem<String>> pointofmeasures = [];
  @override
  void initState() {
    super.initState();
    print("Point Of Measurement ${widget.item.itemtypeobj!.pom!}");
    // if (widget.item.itemtypeobj == null) {
    //   widget.item.itemtypeobj =
    //       ItemType(name: "", description: "", store_id: "", pom: []);
    // }
    if (widget.item.itemtypeobj != null &&
        widget.item.itemtypeobj!.pom != null &&
        widget.item.itemtypeobj!.pom!.length > 0) {
      pointofmeasures = widget.item.itemtypeobj!.pom!
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e.id,
              ))
          .toList();

      _measurement = widget.item.itemtypeobj!.pom!.first.id;
    }

    pointofmeasures.add(const DropdownMenuItem(
      value: 'other',
      child: Text('Other'),
    ));
    // print(widget.item);
    unit = widget.data['unit'];
  }

  void removeItemData() {
    setState(() {
      // print(widget.index);
      widget.item.item_data.removeAt(widget.index);
      widget.refreshState();
    });
  }

  @override
  Widget build(BuildContext context) {
    pointofmeasures = [];
    if (widget.item.itemtypeobj != null &&
        widget.item.itemtypeobj!.pom != null &&
        widget.item.itemtypeobj!.pom!.length > 0) {
      pointofmeasures = widget.item.itemtypeobj!.pom!
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e.id,
              ))
          .toList();

      // for (var data in widget.item.item_data) {
      //   if (data["pom"] != 'other') {
      //     pointofmeasures
      //         .removeWhere((element) => element.value == data["pom"]);
      //   }
      // }

      pointofmeasures.add(const DropdownMenuItem(
        child: Text('Other'),
        value: 'other',
      ));

      // if (widget.item.itemtypeobj!.pom!
      //         .where((element) => element.id == measurement)
      //         .length >
      //     0) {
      //   setState(() {
      //     measurement = widget.item.itemtypeobj!.pom!.first.id;
      //   });
      // }
      // print(measurement);
      print(widget.item.itemtypeobj!.pom!);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 0.0, height: 12.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Measurement ${widget.index + 1}',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF333333)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10,
                      ),
                      child: DropdownButtonFormField(
                          value: _measurement == null
                              ? _measurements.first.id
                              : _measurement.toString(),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          items: pointofmeasures,
                          onChanged: (v) {
                            setState(() {
                              _measurement = v!.toString();
                              widget.item.item_data[widget.index]["pom"] =
                                  widget.item.itemtypeobj!.pom!
                                      .firstWhere((element) =>
                                          element.id == _measurement)
                                      .name;
                              widget.item.item_data[widget.index]["pomid"] =
                                  _measurement;
                              print('');
                              // widget.refreshState();
                              // print(measurement == 'other');
                            });
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Visibility(
                    visible: _measurement == 'other',
                    child: TextFormField(
                      initialValue: pom,
                      decoration: const InputDecoration(
                          hintText: "POM",
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
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
                      onChanged: (status) {
                        setState(
                          () {
                            pom = status.toString();
                            widget.item.item_data[widget.index]["other"] = pom;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 0.0, height: 12.0),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: _measurementValueController,
                  decoration: const InputDecoration(
                      hintText: "Value",
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
                  onChanged: (value) {
                    setState(() {
                      widget.item.item_data[widget.index]["measurement"] =
                          value;
                    });
                    // widget.item.name = name;
                  },
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                width: 2.0,
                height: 16.0,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(15)),
                child: ButtonTheme(
                  alignedDropdown: true,
                  buttonColor: const Color(0xFFFFFFFF),
                  child: DropdownButton<String>(
                    underline: const Text(""),
                    borderRadius: BorderRadius.circular(8),
                    value: unit,
                    isExpanded: true,
                    items: <String>[
                      'Inches',
                      'Inches(Decimal)',
                      'Centimetes',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (status) {
                      setState(
                        () {
                          unit = status.toString();
                          widget.item.item_data[widget.index]["unit"] = unit;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: SizedBox(
                width: 0,
                height: 16.0,
              ),
            ),
            Visibility(
              visible: widget.itemDataCount > 1 ? true : false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          // print(widget.index);
                          removeItemData();
                        },
                      );
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xFFA74A45),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
