import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:sizifi/core/routing/routing.dart';

class OrderSettingScreen extends StatefulWidget {
  const OrderSettingScreen({Key? key}) : super(key: key);

  @override
  _OrderSettingScreenState createState() => _OrderSettingScreenState();
}

class _OrderSettingScreenState extends State<OrderSettingScreen> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.profile, (_) => false);
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: ListView(children: [
              Text(
                "Tailor Details",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333)),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Order ID Prefix',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 21),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Order ID Sufix',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 21),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: SFButton(
                  title: "Save Setting",
                  onTap: () {},
                  titleColor: const Color(0xFFFFFFFF),
                  buttonBackgroundColor: const Color(0xFFA74A45),
                  borderColor: const Color(0x00ffffff),
                  borderRadius: 15,
                  titleFontSize: 18,
                  text: '',
                ),
              ),
              const SizedBox(height: 38),
              Text(
                "Notification Template",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333)),
              ),
              const SizedBox(height: 12),
              Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Customer Template",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF333333)),
                        ),
                        const Icon(Icons.arrow_right_alt, size: 26)
                      ])),
              const SizedBox(height: 18),
              Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tailor Template",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF333333)),
                        ),
                        const Icon(Icons.arrow_right_alt, size: 26)
                      ])),
              const SizedBox(height: 18),
            ])),
      ),
    );
  }
}
