import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TailorDetails extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onShare;
  // ignore: prefer_typing_uninitialized_variables
  final tailor;
  const TailorDetails({
    Key? key,
    required this.tailor,
    this.onShare,
  }) : super(key: key);
  @override
  State<TailorDetails> createState() => _TailorDetailsState();
}

class _TailorDetailsState extends State<TailorDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var siw = MediaQuery.of(context).size.width;
    var sih = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF8C8C8C)),
                        ),
                        Text(
                          widget.tailor == null
                              ? "no tailor"
                              : widget.tailor.name.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF333333)),
                        ),
                      ]),
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
                        (widget.tailor == null
                                ? "NA"
                                : widget.tailor.number_country_code
                                    .toString()) +
                            (widget.tailor == null
                                ? ""
                                : widget.tailor!.number),
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF333333)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                widget.onShare(false, context);
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
                                    widget.tailor.number);
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
                    ])),
            Container(
                padding: const EdgeInsets.only(bottom: 7),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tailor Type",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8C8C8C)),
                      ),
                      Text(
                        widget.tailor == null ? "" : widget.tailor.skills,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF333333)),
                      ),
                    ])),
          ])),
    );
  }
}
