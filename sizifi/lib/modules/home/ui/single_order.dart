// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:sizifi/components/sf_button.dart';
import 'package:sizifi/modules/home/data/model/order_item.dart';
import 'package:sizifi/modules/home/notifiers/templates_state.dart';
import 'package:sizifi/modules/home/ui/add_order.dart';
import 'package:sizifi/modules/home/ui/change_log_model.dart';
import 'package:sizifi/modules/home/widgets/order_item.dart';
import 'package:sizifi/modules/home/widgets/tailor_details.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../notifiers/store_state.dart';
import '../data/model/orders.dart';
import '../notifiers/order_state.dart';

class SingleOrderScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Order order;
  // ignore: prefer_const_constructors_in_immutables
  SingleOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  _SingleOrderScreenState createState() => _SingleOrderScreenState();
}

class _SingleOrderScreenState extends State<SingleOrderScreen> {
  String? selectedValue;
  late Order order;
  late Order order1;
  late String defaultvalue = widget.order.status;
  bool visilogs = true;

  //! change log variables
  String? selectedDropdownValue = 'Initiated';
  List dropdownItems = [];

  // getTemplates(){
  // List<Templates> templates = Provider.of<TemplatesState>(context, listen:  false).templates;
  // }

  // _generateMessage(bool isCustomer) {
  //   var message = "";
  //   // print(isCustomer);
  //   if (isCustomer) {
  //     if (widget.order.status != "Altered & Ready") {
  //       if (widget.order.status != "Canceled") {
  //         message = "Hello ${widget.order.customer_name}\n\nYour Alteration Order is ${widget.order.status} and it is expected to be ready by ${DateFormat.yMMMEd().format(widget.order.delivery_date)}.\n\nYour order number is #${widget.order.id}\n\n";
  //         List<OrderItem> oil = widget.order.items;
  //         for (var item in oil) {
  //           message +=
  //               "${oil.indexOf(item) + 1}) ${item.name}\n";
  //           for (var data in item.item_data) {
  //             var conv = data;
  //             message += conv["pom"] +
  //                 ": " +
  //                 conv["measurement"].toString() +
  //                 " " +
  //                 conv["unit"] +
  //                 "\n";
  //           }
  //         }
  //         message +=
  //             ". \n\nWe will notify you again once it is ready to be collected from the store.";
  //       } else {
  //         // ignore: prefer_interpolation_to_compose_strings
  //         message = "Hello " +
  //             widget.order.customer_name +
  //             "\n\nYour Alteration Order is " +
  //             widget.order.status +
  //             ".\n\nYour order number is #" +
  //             widget.order.id.toString();
  //       }
  //     } else {
  //       // ignore: prefer_interpolation_to_compose_strings
  //       message = "Hello" +
  //           widget.order.customer_name +
  //           "Your Alteration Order is Altered & Ready. Please collect your items from the store. ";
  //     }
  //   } else {
  //     if (widget.order.status != "Altered & ready") {
  //       if (widget.order.status != "Cancled") {
  //         // ignore: prefer_interpolation_to_compose_strings
  //         message = "*Order*: #" +
  //             widget.order.id.toString() +
  //             "\n*Total Items*: " +
  //             widget.order.items.length.toString() +
  //             "\n\n";
  //         List<OrderItem> oil = widget.order.items;
  //         for (var item in oil) {
  //           message +=
  //               "${oil.indexOf(item) + 1}) ${item.name}\n";
  //           for (var data in item.item_data) {
  //             var conv = data;
  //             message += conv["pom"] +
  //                 ": " +
  //                 conv["measurement"].toString() +
  //                 " " +
  //                 conv["unit"] +
  //                 "\n";
  //           }
  //         }
  //         message += "\n*Expected delivery*: ${DateFormat.yMMMEd().format(widget.order.delivery_date)}\n\n*Notes*: ${widget.order.customer_notes}";
  //       } else {
  //         message = "*Order*: #${widget.order.id}is${widget.order.status}";
  //       }
  //     }
  //   }
  //   return message;
  // }

  _onShareData(bool isCustomer, BuildContext context) async {
    if (isCustomer) {
      final link = WhatsAppUnilink(
        phoneNumber: widget.order.customer_number_country_code +
            widget.order.customer_number,
        // text: _generateMessage(isCustomer),
        text: Provider.of<TemplatesState>(context, listen: false)
            .genrateUserTemplate(widget.order),
      );
      await launch('$link');
    } else {
      final link = WhatsAppUnilink(
        phoneNumber: widget.order.tailorObj!.number_country_code +
            widget.order.tailorObj!.number,
        // text: _generateMessage(isCustomer),
        text: Provider.of<TemplatesState>(context, listen: false)
            .genrateTailorTemplate(widget.order),
      );
      await launch('$link');
    }
  }

  @override
  void initState() {
    super.initState();
    order = widget.order;
    selectedDropdownValue = widget.order.status;
    setState(() {});
  }

  @override
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    var siw = MediaQuery.of(context).size.width;
    var sih = MediaQuery.of(context).size.height;
    print(widget.order);

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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.homeBottom, (_) => false);
              },
              child: Container(
                  height: 24,
                  width: 24,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: const Icon(Icons.arrow_back,
                      color: Color(0xFFA74A45), size: 20))),
          title: Text(
            'Order Details',
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, Routes.addOrder,
                //         arguments: widget.order);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddOrderScreen(
                      order: widget.order,
                    ),
                  ),
                );

                // .then((_) => setState(() {
                //       print("THis runs");
                //     }));
              },
              child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Icon(Icons.edit, color: Color(0xFFA74A45), size: 20),
                ),
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Status",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFA74A45),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: DropdownButtonFormField(
                            value: defaultvalue,
                            iconDisabledColor:
                                const Color.fromARGB(255, 252, 250, 250),
                            iconEnabledColor: Colors.white,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: const Color(0xFFA74A45),
                            alignment: AlignmentDirectional.bottomCenter,
                            items: const [
                              DropdownMenuItem(
                                value: "Initiated",
                                child: Text("Initiated"),
                              ),
                              DropdownMenuItem(
                                value: "Under Alteration",
                                child: Text("Under Alteration"),
                              ),
                              DropdownMenuItem(
                                value: "Measurement/Notes Update",
                                child: Text("Measurement/Notes Update"),
                              ),
                              DropdownMenuItem(
                                value: "Altered & Ready",
                                child: Text("Altered & Ready"),
                              ),
                              DropdownMenuItem(
                                value: "Delivered",
                                child: Text("Delivered"),
                              ),
                              DropdownMenuItem(
                                value: "On hold",
                                child: Text("On hold"),
                              ),
                              DropdownMenuItem(
                                value: "Canceled",
                                child: Text("Canceled"),
                              )
                            ],
                            onChanged: (newValue) async {
                              OrderState os = Provider.of<OrderState>(context,
                                  listen: false);
                              order.status = newValue.toString();
                              print(
                                  "printing the status of order: ${order.status}");

                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('yyyy/MM/dd – kk:mm').format(now);
                              // String format =
                              //     DateFormat('yyyy-MM-dd – kk:mm').format(now);

                              ChangeLog changelog = ChangeLog(
                                  userName: "jenny",
                                  previousItem: selectedDropdownValue ?? "",
                                  currentItem: newValue.toString(),
                                  dateTime: formattedDate);

                              changeLogs.add(changelog);

                              setState(
                                () {
                                  StoreState ss = Provider.of<StoreState>(
                                      context,
                                      listen: false);
                                  selectedDropdownValue = newValue.toString();
                                  os.updateOrder(
                                      order, ss.activeStore!.team_id);
                                },
                              );
                            },
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                "Order id: #${widget.order.id}",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333)),
              ),
              const SizedBox(height: 8),
              Row(children: [
                const Image(
                    image: AssetImage("assets/icons/calender.png"), height: 13),
                const SizedBox(width: 6),
                Text(
                  DateFormat("H:m EEEE, dd-MM-yyyy")
                      .format(widget.order.created_at),
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000).withOpacity(0.6)),
                ),
              ]),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Name",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF8C8C8C)),
                              ),
                              Text(
                                widget.order.customer_name,
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF333333)),
                              ),
                            ]),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact No.",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF8C8C8C)),
                                  ),
                                  Text(
                                    widget.order.customer_number_country_code +
                                        widget.order.customer_number,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF333333)),
                                  ),
                                ])),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _onShareData(true, context);
                                },
                                child: Container(
                                  height: sih * 0.057,
                                  width: siw * 0.38,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF1BD741),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: const Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 25),
                                        child: FaIcon(
                                          FontAwesomeIcons.whatsapp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Chat",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  FlutterPhoneDirectCaller.callNumber(
                                      widget.order.customer_number);
                                  // FlutterPhoneDirectCaller.callNumber(
                                  //     widget.order.tailorObj!.number);
                                },
                                child: Container(
                                  height: sih * 0.057,
                                  width: siw * 0.38,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFB888),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: const Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 25),
                                        child: FaIcon(
                                          FontAwesomeIcons.phone,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 13),
                                        child: Text(
                                          "Call",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Invoice No & Date",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF8C8C8C)),
                                  ),
                                  Text(
                                    "${widget.order.invoice}  ${widget.order.invoice_date}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF333333)),
                                  ),
                                ])),
                        Container(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expected Delivery Date",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF8C8C8C)),
                                  ),
                                  Text(
                                    widget.order.delivery_date,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF333333)),
                                  ),
                                ])),
                        Container(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Mode",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C8C8C)),
                                ),
                                Text(
                                  widget.order.delivery_mode,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF333333)),
                                ),
                              ]),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery Charges",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF8C8C8C)),
                              ),
                              Text(
                                "₹ 150",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "No. of Items",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF8C8C8C)),
                              ),
                              Text(
                                widget.order.items.length.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF333333)),
                              ),
                            ],
                          ),
                        ),
                      ])),
              const SizedBox(height: 15),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "Number of Items",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                    const SizedBox(height: 7),
                    // Container(
                    //   height: 55,
                    //   padding: const EdgeInsets.only(left: 10),
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFFFFFFFF),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         widget.order.customer_name,
                    //         style: GoogleFonts.poppins(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w400,
                    //             color: const Color(0xFF000000).withOpacity(0.6)),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    OrderItems(
                      items: widget.order.items,
                      edit: false,
                    )
                  ])),
              const SizedBox(height: 24),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tailor Info",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                    const SizedBox(height: 15),
                    TailorDetails(
                      onShare: _onShareData,
                      tailor: widget.order.tailorObj,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "Customer Notes",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order.customer_notes.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xFF000000).withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                  ])),
              const SizedBox(height: 13),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "Store Notes",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order.store_notes.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xFF000000).withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Change log ",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '(${changeLogs.length})',
                          style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                visilogs = !visilogs;
                              });
                            },
                            child: visilogs
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                    Visibility(
                      visible: visilogs,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: changeLogs.length,
                        itemBuilder: (context, index) {
                          ChangeLog log = changeLogs[index];
                          return Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${log.dateTime.toString()} - ",
                                      style: const TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      widget.order.tailorObj == null
                                          ? ""
                                          : widget.order.tailorObj!.name
                                              .toString(),
                                      style: const TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Text(
                                      " changed ",
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Text(
                                      "status ",
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Text(
                                      "from ",
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      log.previousItem,
                                      style: const TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Text(
                                      " to ",
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      log.currentItem,
                                      style: const TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ])),
              const SizedBox(height: 13),
            ])),
      ),
    );
  }
}
