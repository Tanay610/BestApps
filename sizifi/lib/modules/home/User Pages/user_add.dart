import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizifi/modules/home/User%20Pages/dialog_boxes.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    var userAct = 'act';
    var defaultval = 'lev';
    return Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Add User",
          textAlign: TextAlign.left,
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        leading: InkWell(
            onTap: () {
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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(80)),
                      color: Colors.grey[300],
                    ),
                  ),
                  Positioned(
                    left: 125,
                    top: 120,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          color: Color(0xFFA74A45),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Name',
                    // label:Text(
                    //   'Name',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //     color:const Color(0xFF000000).withOpacity(0.6)
                    //   ),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 12),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email id',
                    // label:Text(
                    //   'hs0445547@gmail.com',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //     color:const Color(0xFF000000).withOpacity(0.6)
                    //   ),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 12),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone no.",
                    // label: Text(
                    //   'Update Password',
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w400,
                    //       color:
                    //           const Color(0xFF000000).withOpacity(0.6)),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 12),
              Container(
                width: size * 0.9,
                height: size * 0.17,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: size * 0.04,
                    ),
                    SvgPicture.asset(
                      "assets/icons/peoplefield.svg",
                      // color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Level",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      width: size * 0.13,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                            top: 6,
                            bottom: 6,
                          ),
                          padding: const EdgeInsets.only(),
                          height: sizee * 0.07,
                          decoration: const BoxDecoration(
                              color: Color(0xFFA74A45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 9,
                                right: 6,
                              ),
                              child: DropdownButtonFormField(
                                  alignment: AlignmentDirectional.topCenter,
                                  dropdownColor: const Color(0xFFA74A45),
                                  focusColor: Colors.black,
                                  iconDisabledColor: const Color(0xFFFFFFFF),
                                  iconEnabledColor: const Color(0xFFFFFFFF),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(17)),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.redAccent[900],

                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(20)),
                                    // ),
                                  ),
                                  value: defaultval,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'lev',
                                      child: Text(
                                        "Level",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'nsm',
                                      child: Text(
                                        "NSM",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'zm',
                                      child: Text(
                                        "ZM",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'rm',
                                      child: Text(
                                        "RM",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'arm',
                                      child: Text(
                                        "ARM",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'store',
                                      child: Text(
                                        "Store Manager",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'exe',
                                      child: Text(
                                        "Executive",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'admin',
                                      child: Text(
                                        "Admin",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (v) {}),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    prefixIcon: Icon(
                      FontAwesomeIcons.store,
                      size: 20,
                    ),
                    // label:Text(
                    //   'hs0445547@gmail.com',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //     color:const Color(0xFF000000).withOpacity(0.6)
                    //   ),
                    // ),
                    hintText: 'Store (Required)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 12),
              Container(
                width: size * 0.9,
                height: size * 0.17,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: size * 0.04,
                    ),
                    Image.asset("assets/icons/user2.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "User Status",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      width: size * 0.12,
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                            height: sizee * 0.07,
                            margin: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              color: Color(0xFFA74A45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 5,
                              ),
                              child: DropdownButtonFormField(
                                  alignment: AlignmentDirectional.topCenter,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  dropdownColor: const Color(0xFFA74A45),
                                  iconDisabledColor: const Color(0xFFFFFFFF),
                                  iconEnabledColor: const Color(0xFFFFFFFF),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(17)),
                                  value: userAct,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'act',
                                      child: Text(
                                        "Active",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ina',
                                      child: Text(
                                        "Inactive",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14),
                                      ),
                                    )
                                  ],
                                  onChanged: (v) {}),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                maxLength: 100,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    hintText: "Thank you.\n*${_userController.text}*\nStore Manager",
                    label: Text(
                      'Notification Sign off',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    prefixIcon: const Icon(Icons.edit_notifications),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 26,
              ),
              SizedBox(
                width: size * 0.9,
                height: 54,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA74A45),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const ErrorDialog();
                          });
                    },
                    child: const Text(
                      "Create User",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
