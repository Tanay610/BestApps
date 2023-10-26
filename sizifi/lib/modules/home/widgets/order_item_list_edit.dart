import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/data/model/item_type.dart';
import 'package:sizifi/modules/home/data/model/order_item.dart';
import 'package:sizifi/modules/home/notifiers/item_type_state.dart';
import 'package:sizifi/modules/home/widgets/order_item_list_measurement.dart';

import '../../../components/sf_button.dart';

class OrderItemsListEdit extends StatefulWidget {
  final index;
  final OrderItem item;
  final removeItems;
  final itemCount;
  final insertMeasurement;
  final refreshState;
  const OrderItemsListEdit({
    Key? key,
    this.index,
    required this.item,
    this.itemCount,
    this.removeItems,
    this.insertMeasurement,
    this.refreshState,
  }) : super(key: key);

  @override
  _OrderItemsListEditState createState() => _OrderItemsListEditState();
}

class _OrderItemsListEditState extends State<OrderItemsListEdit> {
  int inum = 1;
  late final TextEditingController _itemNameController =
      TextEditingController(text: widget.item.name);
  //late String _itemTypeController = "shirt";
  // late final TextEditingController _itemTypeController =
  //     TextEditingController(text: widget.item.name);
  late final TextEditingController _OthersController =
      TextEditingController(text: widget.item.name);

  String? _item;
  List<ItemType> _items = [];
  List<DropdownMenuItem<String>> itemList = [];

  @override
  void initState() {
    super.initState();
    // widget.itemDataCount = da;
  }

  void insert2() {
    setState(() {
      inum++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _items = Provider.of<ItemTypeState>(context).itemTypes;
    itemList = _items.map((ItemType orderItem) {
      return DropdownMenuItem<String>(
        alignment: AlignmentDirectional.centerStart,
        value: orderItem.id.toString(),
        child: Text(orderItem.name),
      );
    }).toList();
    itemList.add(const DropdownMenuItem(
      value: "other",
      child: Text("Other"),
    ));
    if (widget.item.itemtypeobj == null) {
      setState(() {
        widget.item.item_type = _items.first.id.toString();
        widget.item.itemtypeobj = _items.first;
      });
    }
    // //print(_items);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item ${widget.index + 1}',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333)),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    color: Color(0xFFA74A45),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          widget.removeItems(widget.index);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: const Color(0xFFFFB888).withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _itemNameController,
                    decoration: const InputDecoration(
                        hintText: "Item Name",
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                    onChanged: (name) {
                      setState(() {
                        widget.item.name = name;
                      });
                    },
                  ),

                  const SizedBox(height: 12),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.all(Radius.circular(10))),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10, right: 10),
                  //     child: DropdownButtonFormField(
                  //       decoration: InputDecoration(border: InputBorder.none),
                  //       //zzz value: _itemTypeController,
                  //       items: const [
                  //         DropdownMenuItem(
                  //           child: Text("Shirt"),
                  //           value: "shirt",
                  //         ),
                  //         DropdownMenuItem(
                  //           child: Text("Other"),
                  //           value: "other",
                  //         ),
                  //       ],
                  //       onChanged: (v) {
                  //         setState(
                  //           () {
                  //             _itemTypeController = v.toString();
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.all(Radius.circular(10))),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10, right: 10),
                  //     child: DropdownButtonFormField(
                  //         decoration: InputDecoration(border: InputBorder.none),
                  //         value: _item,
                  //         items: const [
                  //           DropdownMenuItem(
                  //             child: Text("Shirt"),
                  //             value: "shirt",
                  //           ),
                  //         ],
                  //         onChanged: (v) {
                  //           setState(() {
                  //             _item = v.toString();
                  //           });
                  //         }),
                  //   ),
                  // ),

                  const SizedBox(height: 12),
                  Column(
                    children: [
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
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.normal),
                            ),
                            value: _item == null
                                ? _items.first.id
                                : _item.toString(),
                            isExpanded: true,
                            itemHeight: null,
                            items: itemList,
                            onChanged: (itemTypeID) {
                              setState(
                                () {
                                  _item = itemTypeID!;
                                  if (_item != "other") {
                                    widget.item.item_type = _item.toString();
                                    widget.item.itemtypeobj = _items
                                        .where((element) => element.id == _item)
                                        .first;
                                    print(widget
                                        .item.itemtypeobj!.pom!.first.name);
                                    widget.item.item_data = [
                                      {
                                        "pom": widget
                                            .item.itemtypeobj!.pom!.first.name,
                                        "pomid": widget
                                            .item.itemtypeobj!.pom!.first.id,
                                        "measurement": "0",
                                        "unit": "Inches",
                                        "other": "other"
                                      }
                                    ];
                                    print(widget.item.item_data[0]);
                                    // widget.insertMeasurement(widget.item);
                                    // //print(widget.item.itemtypeobj!.pom);
                                  } else {
                                    widget.item.item_type = _item.toString();
                                    widget.item.itemtypeobj = null;
                                    widget.item.item_data = [
                                      {
                                        "pom": "other",
                                        "pomid": "other",
                                        "measurement": "0",
                                        "unit": "Inches",
                                        "other": "other"
                                      }
                                    ];
                                    // widget.insertMeasurement(widget.item);
                                    //print(widget.item.itemtypeobj);
                                  }
                                  widget.refreshState();
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _item == 'other',
                    child: Column(
                      children: [
                        TextField(
                          controller: _OthersController,
                          decoration: const InputDecoration(
                            hintText: "Others",
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
                            ),
                          ),
                          onChanged: (name) {
                            setState(() {
                              widget.item.item_type_other = name;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // Text(
                  //   'Measurement ${widget.index + 1}',
                  //   style: GoogleFonts.poppins(
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.w400,
                  //       color: const Color(0xFF333333)),
                  // ),
                  // Container(
                  //   width: 35,
                  //   height: 35,
                  //   decoration: const BoxDecoration(
                  //       color: Color(0xFFA74A45),
                  //       borderRadius: BorderRadius.all(Radius.circular(10))),
                  //   child: IconButton(
                  //     onPressed: () {
                  //       setState(
                  //         () {
                  //           widget.removeMeansrements(widget.index);
                  //         },
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.delete,
                  //       size: 20,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 6),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.item.item_data.map<Widget>((data) {
                      // var splitter = json.decode(data);
                      var itemDataCount = widget.item.item_data.length;
                      var itemIndex = widget.item.item_data.indexOf(data);
                      return OrderItemsListMeasurement(
                        key: ObjectKey(data),
                        index: itemIndex,
                        item: widget.item,
                        itemDataCount: itemDataCount,
                        refreshState: widget.refreshState,
                        data: data,
                      );
                      // return const Text("sd");
                    }).toList(),
                  ),
                  // Row(

                  // ),
                  const SizedBox(width: 0.0, height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: SFButton(
                          title: "+ Measurements",
                          onTap: () {
                            setState(() {
                              widget.insertMeasurement(widget.item);
                            });
                          },
                          titleColor: const Color(0xFFffffff),
                          buttonBackgroundColor:
                              const Color(0xFFA74A45).withOpacity(0.5),
                          borderColor: const Color(0x00ffffff),
                          borderRadius: 15,
                          titleFontSize: 18,
                          text: '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
