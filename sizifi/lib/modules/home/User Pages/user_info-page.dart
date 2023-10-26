import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../settings/ui/Tailor_Setting/tailor_info_page.dart';
// import 'package:sizifi/modules/settings/ui/tailor_info_page.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    bool kehndi = false;
    return Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Vrinda Singh",
          textAlign: TextAlign.left,
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.edit,
                color: Theme.of(context).iconTheme.color, size: 20),
          )
        ],
        leading: InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil(Routes.tailorList, (_) => false);
              Navigator.pop(context);
            },
            child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                child: Center(
                    child: Icon(Icons.arrow_back,
                        color: Theme.of(context).iconTheme.color, size: 25)))),
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
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size * 0.95,
                height: sizee * 0.67,
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
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.purple[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(60))),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 21,
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(
                          "Vrinda",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                        SizedBox(
                          width: size * 0.4,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: kehndi ? Colors.green : Colors.red,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                        ),
                        Text(
                          kehndi ? "Active" : "Inactive",
                          style: const TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.mail,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Vrinda9100@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.phone,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "9288393893",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.users,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Executive",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.signOut,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Notification Sign off",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF666666).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size * 0.38,
                          height: MediaQuery.of(context).size.height * 0.06,
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
                                padding: EdgeInsets.only(left: 28),
                                child: Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  "Chat",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size * 0.38,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFB888),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 28),
                                child: Icon(
                                  FontAwesomeIcons.phone,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  "Call",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: size * 0.813,
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
                        onPressed: () {},
                        child: const Text(
                          "View Orders",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Tail_store_container(size: size, sizee: sizee),
              // Tail_store_container(size: size, sizee: sizee),
            ],
          ),
        ),
      ),
    );
  }
}
