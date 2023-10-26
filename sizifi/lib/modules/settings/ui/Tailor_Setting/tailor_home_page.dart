import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_tailor_screen.dart';

class TailorHomePage extends StatefulWidget {
  const TailorHomePage({super.key});

  @override
  State<TailorHomePage> createState() => _TailorHomePageState();
}

class _TailorHomePageState extends State<TailorHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Tailor",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.tailorList, (_) => false);
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
        body: Column(
          children: [
            SvgPicture.asset("assets/images/Measure-bro 1.svg"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFA74A45),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTailorScreen();
            }));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 34,
          ),
        ),
      ),
    );
  }
}
