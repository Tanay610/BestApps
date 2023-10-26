import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/Order%20pages/delivery_charges/add_delivery_charges-page.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:sizifi/modules/home/Order%20pages/delivery_charges/charges_provider/deli_provider.dart';

import '../../data/model/delivery_charges.dart';
import '../../notifiers/delivery_charges_state.dart';
//import '../../notifiers/delivery_charges_state.dart';

class DeliveryChargesPage extends StatefulWidget {
  DeliveryChargesPage({
    super.key,
  });
  @override
  State<DeliveryChargesPage> createState() => _DeliveryChargesPageState();
}

class _DeliveryChargesPageState extends State<DeliveryChargesPage> {
  List<DeliveryCharges> DC = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _getDeliveryCharges();
  // }

  // void _getDeliveryCharges() async {
  //   DC = await Provider.of<DeliveryChargesState>(context, listen: false)
  //       .deliveryChargesList;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    void _getDeliveryCharges() async {
      DC = await Provider.of<DeliveryChargesState>(context, listen: false)
          .deliveryChargesList;
      setState(() {});
    }

    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    _getDeliveryCharges();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Delivery Charges",
            style: GoogleFonts.koHo(
              fontSize: 20,
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            int reverseIndex = DC.length - 1 - index;
            DeliveryCharges item = DC[reverseIndex];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddDeliveryChargePage(
                      isEdit: true,
                      item: item,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size * 0.06),
                      child:
                          SvgPicture.asset("assets/images/delivery view.svg"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: size * 0.06, left: size * 0.06),
                        // child: Flexible(
                        child: SizedBox(
                          width: 90,
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    // Flexible(
                    // child:
                    SizedBox(
                      width: 70,
                      child: Text(
                        item.currency == 'rup'
                            ? "₹ ${item.price}"
                            : "\$ ${item.price}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        softWrap: true,
                      ),
                    ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.04),
                      child: const Icon(
                        Icons.chevron_right_outlined,
                        size: 36,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 0.0, height: 2.0);
          },
          itemCount: DC.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFA74A45),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDeliveryChargePage(
                  isEdit: false,
                  item: DeliveryCharges(
                    id: '',
                    name: '',
                    // charge: '',
                    currency: '',
                    price: '',
                    store_id: '',
                  ),
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:sizifi/modules/home/Order%20pages/delivery_charges/add_delivery_charges-page.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sizifi/modules/home/Order%20pages/delivery_charges/charges_provider/deli_provider.dart';

// import '../../data/model/delivery_charges.dart';
// import '../../notifiers/delivery_charges_state.dart';

// class DeliveryChargesPage extends StatefulWidget {
//   DeliveryChargesPage({
//     super.key,
//   });

//   // final List<DataModel> dataList;

//   @override
//   State<DeliveryChargesPage> createState() => _DeliveryChargesPageState();
// }

// class _DeliveryChargesPageState extends State<DeliveryChargesPage> {
//   // String namezone = AddDeliveryChargePage(name: '', charges: '').name;
//   // String currency = AddDeliveryChargePage(name: '', charges: '').charges;
//   List<DeliveryCharges> DC = [];
//   List<Widget> widgets = [];
//   @override
//   Widget build(BuildContext context) {
//     void _getDeliveryCharges() async {
//       DC = await Provider.of<DeliveryChargesState>(context, listen: false)
//           .deliveryChargesList;
//       setState(() {});
//     }

//     _getDeliveryCharges();

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           toolbarHeight: 80,
//           backgroundColor: Theme.of(context).primaryColor,
//           title: Text(
//             "Delivery Charges",
//             style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFFFFFFFF)),
//           ),
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               height: 24,
//               width: 24,
//               margin: EdgeInsets.symmetric(vertical: 27, horizontal: 15),
//               child: Center(
//                 child: Icon(Icons.arrow_back,
//                     color: Theme.of(context).iconTheme.color, size: 25),
//               ),
//             ),
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               child: Column(
//                 children: [
//                   ListView.separated(
//                     //itemCount: chargeProvider.items.length,
//                     shrinkWrap: true,
//                     itemBuilder: (BuildContext context, int index) {
//                       // Item item = chargeProvider.items[index];
//                       int reverseIndex = DC.length - 1 - index;
//                       DeliveryCharges item = DC[reverseIndex];

//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return AddDeliveryChargePage(
//                                 isEdit: true, item: item);
//                           }));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(top: 20, left: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SvgPicture.asset(
//                                   "assets/images/delivery view.svg"),
//                               Text(
//                                 item.name,
//                                 style: TextStyle(
//                                   fontFamily: 'poppins',
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               Text(
//                                 item.price,
//                                 style: TextStyle(
//                                   fontFamily: 'poppins',
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black.withOpacity(0.6),
//                                 ),
//                               ),
//                               Icon(
//                                 Icons.chevron_right_outlined,
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (BuildContext context, int index) {
//                       return const SizedBox(width: 0.0, height: 10.0);
//                     },
//                     itemCount: DC.length,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         //   },
//         // ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Color(0xFFA74A45),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return AddDeliveryChargePage(
//                     isEdit: false,
//                     item: DeliveryCharges(
//                       id: '', name: '', price: '', currency: '',
//                       // price: ''
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         child: Icon(
//           Icons.add,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
