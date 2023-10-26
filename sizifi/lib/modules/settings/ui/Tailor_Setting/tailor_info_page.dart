import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sizifi/modules/home/ui/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'add_tailor_screen.dart';

class TailorInfoPage extends StatefulWidget {
  TailorInfoPage({super.key, required this.tailor});
  Tailor tailor;
  @override
  State<TailorInfoPage> createState() => _TailorInfoPageState();
}

class _TailorInfoPageState extends State<TailorInfoPage> {
  List<bool> _selected = [true, false];
  @override
  void initState() {
    super.initState();
    _selected = widget.tailor.type == "store" ? [true, false] : [false, true];
  }

  Object get userAct => true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    var store = Provider.of<StoreState>(context, listen: false).activeStore;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            widget.tailor.name,
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddTailorScreen(
                        tailor: widget.tailor,
                      );
                    },
                  ),
                );
              },
              child: Container(
                  height: 24,
                  width: 24,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  )),
            ),
          ],
          leading: InkWell(
              onTap: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil(Routes.profile, (_) => false);
                Navigator.pop(context);
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size * 0.95,
                height: sizee * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height,
                      height: MediaQuery.of(context).size.height * 0.085,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(
                              FontAwesomeIcons.warehouse,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: size * 0.3),
                            child: Text(
                              "Type",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF666666).withOpacity(0.6),
                                fontSize: 16,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: SizedBox(
                              height: size * 0.1,
                              child: ToggleButtons(
                                selectedBorderColor: const Color(0xFFA74A45),
                                selectedColor: Colors.white,
                                disabledBorderColor: Colors.black,
                                disabledColor: Colors.white,
                                fillColor: const Color(0xFFA74A45),
                                borderWidth: 1.0,
                                borderColor:
                                    const Color(0xFF000000).withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.elliptical(25, 25)),
                                isSelected: _selected,
                                onPressed: (index) {
                                  // setState(
                                  //   () {
                                  //     for (int i = 0;
                                  //         i < _selected.length;
                                  //         i++) {
                                  //       _selected[i] = i == index;
                                  //     }
                                  //   },
                                  // );
                                },
                                children: const [
                                  InkWell(
                                    child: SizedBox(
                                      width: 60,
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          "Store",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'poppins',
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        "WH",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'poppins',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.tailor.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          Icons.mail,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.tailor.email.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.phone,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.tailor.number,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.scissors,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.tailor.skills,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(children: [
                      const Icon(
                        FontAwesomeIcons.store,
                        size: 18,
                      ),
                      const SizedBox(width: 12),
                      Text(store!.store_name,
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          )),
                    ]),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        SvgPicture.asset(
                          "assets/icons/Vector.svg",
                          width: 32,
                          height: 32,
                          color: const Color(0xFFA74A45),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Tailor Status",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                        SizedBox(
                          width: size * 0.35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: widget.tailor.tailor_status == userAct
                                    ? Colors.green
                                    : Colors.red,
                                //  Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                              ),
                            ),
                            Text(
                              widget.tailor.tailor_status == userAct
                                  ? "Active"
                                  : "Inactive",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final link = WhatsAppUnilink(
                              phoneNumber: widget.tailor.number_country_code +
                                  widget.tailor.number,
                              text: "Hello",
                            );
                            await launch('$link');
                          },
                          child: Container(
                            width: size * 0.38,
                            height: MediaQuery.of(context).size.height * 0.057,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1BD741),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: const Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Icon(
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
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FlutterPhoneDirectCaller.callNumber(
                                widget.tailor.number);
                            // FlutterPhoneDirectCaller.callNumber(
                            //     widget.order.tailorObj!.number);
                          },
                          child: Container(
                            width: size * 0.38,
                            height: MediaQuery.of(context).size.height * 0.057,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFB888),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: const Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Icon(
                                    FontAwesomeIcons.phone,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    "Call",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: size * 0.8,
                      height: sizee * 0.07,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFA74A45),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {
                             Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                                    );
                          },
                          child: const Text(
                            "View Orders",
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              // Tail_store_container(size: size, sizee: sizee),
              // Tail_store_container(size: size, sizee: sizee),
            ]),
          ),
        ),
      ),
    );
  }
}

// class Tail_store_container extends StatelessWidget {
//   const Tail_store_container({
//     super.key,
//     required this.size,
//     required this.sizee,
//   });

//   final double size;
//   final double sizee;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//       width: size * 0.95,
//       height: sizee * 0.39,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(15),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             child: Container(
//               child: Image.asset("assets/images/Rectangle 23940.png"),
//             ),
//           ),
//           Positioned(
//             top: 70,
//             left: 50,
//             child: Container(
//               width: 84,
//               height: 84,
//               decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(42),
//                 ),
//                 border: Border.all(
//                     width: 3, color: const Color(0xFFF7A56D).withOpacity(0.1)),
//               ),
//             ),
//           ),

//           //// column comntaing the details of the store
//           ///
//           const Positioned(
//             top: 170,
//             left: 10,
//             child: Row(children: [
//               Icon(
//                 FontAwesomeIcons.store,
//                 size: 18,
//               ),
//               SizedBox(width: 7),
//               Text("Ralph polo store",
//                   style: TextStyle(
//                     fontFamily: 'poppins',
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   )),
//             ]),
//           ),

//           const Positioned(
//             top: 200,
//             left: 10,
//             child: Row(children: [
//               Icon(
//                 FontAwesomeIcons.locationCrosshairs,
//                 size: 18,
//               ),
//               SizedBox(width: 7),
//               Text("1, H1, Grand Trunk Road",
//                   style: TextStyle(
//                     fontFamily: 'poppins',
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   )),
//             ]),
//           ),
//           const Positioned(
//             top: 230,
//             left: 10,
//             child: Row(children: [
//               Icon(
//                 FontAwesomeIcons.solidFlag,
//                 size: 18,
//               ),
//               SizedBox(width: 7),
//               Text(
//                 "Brand Store #",
//                 style: TextStyle(
//                   fontFamily: 'poppins',
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
  // }
// }
