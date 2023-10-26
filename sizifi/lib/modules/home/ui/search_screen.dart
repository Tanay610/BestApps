import 'dart:async';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';
import 'package:sizifi/modules/home/widgets/orders_widget.dart';
import '../../../core/routing/routing.dart';
import '../data/model/orders.dart';
import '../notifiers/order_state.dart';
import '../notifiers/tailor_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedValue;
  final TextEditingController _queryController = TextEditingController();
  Timer? _debounce;

  String? _typeController;
  String? _sortController;
  String? _orderController = 'Created On - ASC';
  String? _statusController;
  int? _tailor;
  List<Tailor> _tailors = [];
  String store_id = "";

  _onFilterChanged(
    String? typeController,
    String? sortController,
    String? orderController,
    String? statusController,
  ) {
    _typeController = typeController;
    // _sortController = sortController;
    // _orderController = orderController;
    _statusController = statusController;
    _onSearchChanged(_queryController.text, store_id);
  }

  _onSearchChanged(String? search, store_id) {
    // print("debounce " + _debounce!.isActive.toString());

    try {
      if (_debounce != null && _debounce!.isActive) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 1000), () {
        if (mounted) {
          var qb = {};
          qb["store_id"] = store_id;
          if (_typeController != null) {
            qb["name"] = _typeController;
          } else {
            qb["name"] = "customer_name";
          }

          if (_statusController != null) {
            qb["status"] = _statusController;
          }
          // print(_typeController);

          Provider.of<OrderState>(context, listen: false).queryBuilder = qb;
          Provider.of<OrderState>(context, listen: false).query =
              search.toString();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tailors = Provider.of<TailorState>(context).tailors;

    StoreState ss = Provider.of<StoreState>(context, listen: false);
    store_id = ss.activeStore!.team_id;
    List<Order> orders = Provider.of<OrderState>(context).searchResults;
    print("orders:$orders");
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.homeBottom,
                (_) => false,
              );
            },
            child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                child: Center(
                    child: Icon(Icons.arrow_back,
                        color: Theme.of(context).iconTheme.color, size: 25)))),
        title: TextField(
          controller: _queryController,
          cursorColor: Colors.white,
          style: GoogleFonts.koHo(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFFFFFFF)),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFFFFFFF)),
          ),
          onChanged:
              _onSearchChanged(_queryController.text, ss.activeStore!.team_id),
        ),
        actions: [
          SearchFIlters(
            onFilterChanged: _onFilterChanged,
            typeController: _typeController,
            statusController: _statusController,
            sortController: _sortController,
            orderController: _orderController,
            tailor: _tailor,
            tailors: _tailors,
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _orderController,
                items: <String>[
                  'Created On - ASC',
                  'Customer Name - ASC',
                  'Created On - DESC',
                  'Customer Name - DESC',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (status) {
                  _orderController = status!;
                  // updateFilters();
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: orders.length,
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                  bottom: kFloatingActionButtonMargin + 62,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Order order = orders[index];
                  return OrderWidget(
                    order: order,
                    items: order.items,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 10.0);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SearchFIlters extends StatefulWidget {
  var onFilterChanged;
  String? typeController;
  String? sortController;
  String? orderController;
  String? statusController;
  int? tailor;
  List<Tailor> tailors = [];
  SearchFIlters({
    Key? key,
    this.onFilterChanged,
    this.typeController,
    this.sortController,
    this.orderController,
    this.statusController,
    this.tailor,
    required this.tailors,
  }) : super(key: key);

  @override
  State<SearchFIlters> createState() => _SearchFIltersState();
}

class _SearchFIltersState extends State<SearchFIlters> {
  updateFilters() {
    widget.onFilterChanged(
      widget.typeController,
      widget.sortController,
      widget.orderController,
      widget.statusController,
    );
  }

  resetFilters() {
    widget.onFilterChanged(null, null, null, null);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text("Search Filters"),
                      const SizedBox(width: 0.0, height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Search Type',
                        ),
                        isExpanded: true,
                        value: widget.typeController,
                        items: [
                          {'name': 'Customer Name', 'id': "customer_name"},
                          // {'name': 'Customer Email', 'id': "customer_email"},
                          {'name': 'Customer Number', 'id': "customer_number"},
                          {'name': 'Invoice Number', 'id': "invoice_number"},
                        ].map((var value) {
                          // print(value['id']);
                          return DropdownMenuItem<String>(
                            value: value['id'],
                            child: Text(value['name'].toString()),
                          );
                        }).toList(),
                        onChanged: (status) {
                          widget.typeController = status;
                          updateFilters();
                        },
                      ),
                      const SizedBox(width: 0.0, height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Status',
                        ),
                        isExpanded: true,
                        value: widget.statusController,
                        items: <String>[
                          'Initiated',
                          'Under Alteration',
                          'Measurement/ Notes update',
                          'Altered & Ready',
                          'Delivered',
                          'On hold',
                          'Cancled',
                          'Reassigned Tailor',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (status) {
                          widget.statusController = status;
                          updateFilters();
                        },
                      ),
                      const SizedBox(width: 0.0, height: 16.0),
                      DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        initialValue: "",
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Expected Delivery',
                        onChanged: (date) {
                          setState(() {
                            // print(date);
                            // _deliveryDate = DateTime.parse(date);
                          });
                        },
                      ),
                      DropdownButton<String>(
                        hint: const Text("Select Tailor"),
                        // ignore: prefer_null_aware_operators
                        value: widget.tailor == null
                            ? null
                            : widget.tailor.toString(),
                        isExpanded: true,
                        itemHeight: null,
                        items: widget.tailors.map((Tailor tailor) {
                          return DropdownMenuItem<String>(
                            value: tailor.id.toString(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.0, color: Colors.grey),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(tailor.name.toString()),
                                        Text(
                                          "Skills:${tailor.skills}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "Pending Orders: ${tailor.pending_orders}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (tailorID) {
                          setState(
                            () {
                              widget.tailor = int.parse(tailorID.toString());
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () async {
                      resetFilters();
                      Navigator.pop(context);
                    },
                    child: const Text('Reset'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text('Set Filters'),
                  ),
                ],
              );
            });
        // Navigator.pushNamed(context, AppRoutes.editProfile);
      },
      icon: Icon(
        Icons.settings_suggest,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
