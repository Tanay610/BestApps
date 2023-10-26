import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/Order%20pages/increment_provider.dart';

class OrderPrefixPage extends StatefulWidget {
  const OrderPrefixPage({
    super.key,
  });

  @override
  State<OrderPrefixPage> createState() => _OrderPrefixPageState();
}

class _OrderPrefixPageState extends State<OrderPrefixPage> {
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
            "Order No. Prefix",
            style: GoogleFonts.koHo(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          leading: InkWell(
            onTap: () {
              //? Navigator.of(context)
              //?     .pushNamedAndRemoveUntil(Routes.profile, (_) => false);
              Navigator.pop(context);
            },
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
              child: Center(
                child: Icon(Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color, size: 25),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: sizee * 0.05,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          "assets/images/order prefix.svg",
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Prefix",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 27,
                      ),
                      Container(
                        width: size * 0.68,
                        height: sizee * 0.078,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Color(0xFfFFFFFF),
                        ),
                        child: Center(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8)),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFf000000).withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          "assets/images/pincode.svg",
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Next No.",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        width: size * 0.68,
                        height: sizee * 0.078,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Color(0xFfFFFFFF),
                        ),
                        child: Center(
                          child: Text(
                            Provider.of<OrderCountProvider>(context,
                                    listen: false)
                                .orderCOunt
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFf000000).withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizee * 0.03,
                ),
                Column(
                  children: [
                    const Text(
                      "Sample",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 13,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Color(0xFfFFFFFF),
                      ),
                      child: Text(
                        "ZARA/Banglore/Com street/2324-03",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xFF000000).withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 190),
                  height: 55,
                  width: 320,
                  decoration: const BoxDecoration(
                    color: Color(0xffA74A45),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
