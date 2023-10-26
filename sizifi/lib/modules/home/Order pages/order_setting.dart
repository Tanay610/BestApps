import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/Order%20pages/delivery_charges/delivery_charges_page.dart';
import 'package:sizifi/modules/home/Order%20pages/delivery_mode_page.dart';
import 'package:sizifi/modules/home/Order%20pages/o_item_type.dart';
import 'package:sizifi/modules/home/Order%20pages/o_prefix_page.dart';

class OrderSetPage extends StatefulWidget {
  const OrderSetPage({super.key});

  @override
  State<OrderSetPage> createState() => _OrderSetPageState();
}

class _OrderSetPageState extends State<OrderSetPage> {
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
            "Order Setting",
            style: GoogleFonts.koHo(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 24,
                  width: 24,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  child: Center(
                      child: Icon(Icons.arrow_back,
                          color: Theme.of(context).iconTheme.color,
                          size: 25)))),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              SizedBox(
                height: sizee * 0.07,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OrderPrefixPage();
                  }));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: size * 0.05,
                    ),
                    SizedBox(
                      height: 23,
                      width: 23,
                      child: SvgPicture.asset(
                        "assets/images/order prefix.svg",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Order No. Prefix",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'poppins',
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: size * 0.303,
                    ),
                    const Icon(
                      Icons.chevron_right_outlined,
                      size: 26,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: sizee * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const ItemTypePage();
                  })));
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: size * 0.05,
                      ),
                      SizedBox(
                        height: 23,
                        width: 23,
                        child: SvgPicture.asset(
                          "assets/images/Item type.svg",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Item Types",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: size * 0.41,
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: sizee * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DeliveryPage();
                  }));
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: size * 0.05,
                      ),
                      SizedBox(
                        height: 23,
                        width: 23,
                        child: SvgPicture.asset(
                          "assets/images/deliver.svg",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Delivery Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: size * 0.33,
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: sizee * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DeliveryChargesPage();
                      },
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: size * 0.05,
                      ),
                      SizedBox(
                        height: 23,
                        width: 23,
                        child: SvgPicture.asset(
                          "assets/images/charges.svg",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Delivery Charges",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: size * 0.255,
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
