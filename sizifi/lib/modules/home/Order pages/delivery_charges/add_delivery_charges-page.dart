import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
//import 'package:sizifi/modules/home/Order%20pages/delivery_charges/data_model.dart';

import '../../data/model/delivery_charges.dart';
import '../../notifiers/delivery_charges_state.dart';

class AddDeliveryChargePage extends StatefulWidget {
  const AddDeliveryChargePage(
      {Key? key, required this.isEdit, required this.item})
      : super(key: key);

  final bool isEdit;
  final DeliveryCharges item;

  @override
  State<AddDeliveryChargePage> createState() => _AddDeliveryChargePageState();
}

class _AddDeliveryChargePageState extends State<AddDeliveryChargePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController chargesController = TextEditingController();
  // List<DataModel> dataList = [];
  String val = 'rup'; // Assuming `rup` is the default currency value

  @override
  void initState() {
    super.initState();
    nameController.text = widget.item.name;
    chargesController.text = widget.item.price;
  }

  void submitData() {
    String text1 = nameController.text;
    String text2 = chargesController.text;

    DeliveryCharges deliveryCharges = DeliveryCharges(
      name: text1,
      currency: val,
      price: text2,
      store_id:
          Provider.of<StoreState>(context, listen: false).activeStore!.team_id,
      //charge: '',
    );

    Provider.of<DeliveryChargesState>(context, listen: false)
        .addDeliveryCharges(deliveryCharges);

    nameController.clear();
    chargesController.clear();

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            widget.isEdit
                ? "Edit - " + widget.item.name
                : "Add-Delivery Charges",
            style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                  size: 25,
                ),
              ),
            ),
          ),
          actions: [
            widget.isEdit
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).pop();

                      Provider.of<DeliveryChargesState>(context, listen: false)
                          .deleteDeliveryCharges(widget.item);
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 15),
                      child: Center(
                        child: Icon(Icons.delete,
                            color: Theme.of(context).iconTheme.color, size: 25),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size * 0.9,
                  height: sizee * 0.078,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color(0xFfFFFFFF),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8),
                      ),
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFf000000).withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: size * 0.9,
                  height: sizee * 0.078,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color(0xFfFFFFFF),
                  ),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: chargesController,
                      decoration: const InputDecoration(
                        hintText: 'Charges',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8),
                      ),
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFf000000).withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: size * 0.9,
                  height: sizee * 0.078,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color(0xFfFFFFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4,
                      left: 7,
                      right: 7,
                      top: 5,
                    ),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: val,
                      items: [
                        DropdownMenuItem(
                          value: 'rup',
                          child: Text(
                            "₹ Rupee",
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFf000000).withOpacity(0.6),
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'dol',
                          child: Text(
                            "\$ Dollar",
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFf000000).withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() {
                          val = v.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: sizee * 0.4),
                widget.isEdit
                    ? GestureDetector(
                        onTap: () {
                          String newitemName = nameController.text;
                          String newitemCharge = chargesController.text;
                          Provider.of<DeliveryChargesState>(context,
                                  listen: false)
                              .editCharges(
                            widget.item.id.toString(),
                            newitemName,
                            newitemCharge,
                          );
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: size * 0.9,
                          height: 54,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xFFA74A45),
                          ),
                          child: const Center(
                            child: Text(
                              "Update",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: submitData,
                        child: Container(
                          width: size * 0.9,
                          height: 54,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xFFA74A45),
                          ),
                          child: const Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:sizifi/modules/home/Order%20pages/delivery_charges/charges_provider/deli_provider.dart';
// import 'package:sizifi/modules/home/Order%20pages/delivery_charges/data_model.dart';
// import 'package:sizifi/modules/home/data/model/delivery_charges.dart';
// import 'package:sizifi/modules/home/notifiers/delivery_charges_state.dart';



// class AddDeliveryChargePage extends StatefulWidget {
//   AddDeliveryChargePage({super.key, required this.isEdit, required this.item});

//   final bool isEdit;
//   final Item item;

//   @override
//   State<AddDeliveryChargePage> createState() => _AddDeliveryChargePageState();
// }

// class _AddDeliveryChargePageState extends State<AddDeliveryChargePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController chargesController = TextEditingController();
//   List<DataModel> dataList = [];

//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.item.name;
//     chargesController.text = widget.item.charge;
//   }

//   void submitData() {
//     String text1 = nameController.text;
//     String text2 = chargesController.text;

//     DataModel data = DataModel(textName: text1, textCharges: text2);

//     setState(() {
//       dataList.add(data);
//     });

//     nameController.clear();
//     chargesController.clear();

//     // Navigator.push(context, MaterialPageRoute(builder: (context) {
//     //   return DeliveryChargesPage(dataList: dataList);
//     // }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size.width;
//     var sizee = MediaQuery.of(context).size.height;
//     var val = 'rup';
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Color(0xFFF7A56D).withOpacity(0.1),
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         toolbarHeight: 80,
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Text(
//           "Add-Delivery Charges",
//           style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFFFFFFFF)),
//         ),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             height: 24,
//             width: 24,
//             margin: EdgeInsets.symmetric(vertical: 27, horizontal: 15),
//             child: Center(
//               child: Icon(Icons.arrow_back,
//                   color: Theme.of(context).iconTheme.color, size: 25),
//             ),
//           ),
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: size * 0.9,
//                 height: sizee * 0.078,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(15),
//                   ),
//                   color: Color(0xFfFFFFFF),
//                 ),
//                 child: Center(
//                   child: TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                         hintText: 'Name',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.all(8)),
//                     style: TextStyle(
//                       fontFamily: 'poppins',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       color: Color(0xFf000000).withOpacity(0.6),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 width: size * 0.9,
//                 height: sizee * 0.078,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(15),
//                   ),
//                   color: Color(0xFfFFFFFF),
//                 ),
//                 child: Center(
//                   child: TextFormField(
//                     controller: chargesController,
//                     decoration: InputDecoration(
//                         hintText: 'Charges',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.all(8)),
//                     style: TextStyle(
//                       fontFamily: 'poppins',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       color: Color(0xFf000000).withOpacity(0.6),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   width: size * 0.9,
//                   height: sizee * 0.078,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(15),
//                     ),
//                     color: Color(0xFfFFFFFF),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       bottom: 4,
//                       left: 7,
//                       right: 7,
//                       top: 5,
//                     ),
//                     child: DropdownButtonFormField(
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                         value: val,
//                         items: [
//                           DropdownMenuItem(
//                             child: Text(
//                               "₹ Rupee",
//                               style: TextStyle(
//                                 fontFamily: 'poppins',
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                                 color: Color(0xFf000000).withOpacity(0.6),
//                               ),
//                             ),
//                             value: 'rup',
//                           ),
//                           DropdownMenuItem(
//                             child: Text(
//                               "\$ Dollar",
//                               style: TextStyle(
//                                 fontFamily: 'poppins',
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14,
//                                 color: Color(0xFf000000).withOpacity(0.6),
//                               ),
//                             ),
//                             value: 'dol',
//                           ),
//                         ],
//                         onChanged: (v) {}),
//                   )),
//               SizedBox(
//                 height: sizee * 0.4,
//               ),
//               widget.isEdit
//                   ? GestureDetector(
//                       onTap: () {
//                         String newitemName = nameController.text;
//                         String newitemCharge = chargesController.text;
//                         Provider.of<ChargesProvider>(context, listen: false)
//                             .editCharges(
//                                 widget.item.id, newitemName, newitemCharge);
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         width: size * 0.9,
//                         height: sizee * 0.08,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(15),
//                           ),
//                           color: Color(0xFFA74A45),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Update",
//                             style: TextStyle(
//                               fontFamily: 'poppins',
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   : GestureDetector(
//                       onTap: () {
//                         String itemName = nameController.text;
//                         String itemCharge = chargesController.text;
//                         Provider.of<ChargesProvider>(context, listen: false)
//                             .addCharges(itemName, itemCharge);
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         width: size * 0.9,
//                         height: sizee * 0.08,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(15),
//                           ),
//                           color: Color(0xFFA74A45),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Save",
//                             style: TextStyle(
//                               fontFamily: 'poppins',
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
