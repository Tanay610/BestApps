import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:sizifi/core/routing/routing.dart';
//import 'package:sizifi/core/store_model.dart';

import '../../authentication/models/user.dart';
import '../../authentication/notifiers/auth_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final AuthState? state;
  const EditProfileScreen({Key? key, this.state}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedValue;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final TextEditingController _oldpassController = TextEditingController();
  TextEditingController _signController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
    TextEditingController _numcontroller = TextEditingController();
   late User user;

  var prefs;

  @override
  void initState() {
    super.initState();
    user = Provider.of<AuthState>(context, listen: false).user;
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
    _passController = TextEditingController(text: null);
    _signController =
        TextEditingController(text: user.preferences.data["signoff"]);
            String? number = user.preferences.data["number"];
    String? NumberCountry = user.preferences.data["country"] ?? 'IN';
    String? NumberCountryCode = user.preferences.data["countryCode"] ?? '+91';
    _numcontroller.text = number ?? ' ';
    // _levelController =
    //     TextEditingController(text: user.preferences.data["level"]);
    // _statusController = TextEditingController(text: user.preferences.data["status"]);
  }

  File? _image1;

  final picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image1 = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;

    String level = user.preferences.data["level"] ?? "level";
    TextEditingController levelController = TextEditingController();
    levelController.text = level;
    String status = user.preferences.data["status"] ?? "act";
    TextEditingController statusController = TextEditingController();
    statusController.text = status;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColorDark,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'Profile',
              style: GoogleFonts.koHo(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil(Routes.profile, (_) => false);
                  Navigator.of(context).pop();
                },
                child: Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.symmetric(
                        vertical: 27, horizontal: 15),
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
          body: Consumer<AuthState>(builder: (context, state, child) {
            if (!state.isLoggedIn) return Container();
            var defaultval = 'lev';
            var userAct = 'act';
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                            onTap: _openImagePicker,
                            child: CircleAvatar(
                              radius: 73,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: _image1 != null
                                  ? Image.file(
                                      _image1!,
                                      fit: BoxFit.cover,
                                    ).image
                                  : const AssetImage(""),
                            )
                            //*Container(
                            //*   height: sizee * 0.2,
                            //*   width: size * 0.4,
                            //*   decoration: BoxDecoration(
                            //*     borderRadius:
                            //*         BorderRadius.all(Radius.circular(80)),
                            //*     color: Colors.grey[300],
                            //*   ),
                            //* ),
                            ),
                        Positioned(
                          left: size * 0.3,
                          top: sizee * 0.14,
                          child: Container(
                            height: sizee * 0.03,
                            width: size * 0.06,
                            decoration: const BoxDecoration(
                                color: Color(0xFFA74A45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
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
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          prefixIcon: Icon(Icons.person),
                          // label:Text(
                          //   'Name',
                          //   style: TextStyle(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w400,
                          //     color:const Color(0xFF000000).withOpacity(0.6)
                          //   ),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          prefixIcon: Icon(Icons.mail),
                          // label:Text(
                          //   'hs0445547@gmail.com',
                          //   style: TextStyle(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w400,
                          //     color:const Color(0xFF000000).withOpacity(0.6)
                          //   ),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _numcontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                          SvgPicture.asset("assets/icons/peoplefield.svg"),
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
                              padding: const EdgeInsets.only(),
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 8, top: 9, bottom: 6, left: 14),
                                height: sizee * 0.07,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFA74A45),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 7, right: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 6,
                                    ),
                                    child: DropdownButtonFormField(
                                        alignment:
                                            AlignmentDirectional.topCenter,
                                        dropdownColor: const Color(0xFFA74A45),
                                        focusColor: Colors.black,
                                        iconDisabledColor:
                                            const Color(0xFFFFFFFF),
                                        iconEnabledColor:
                                            const Color(0xFFFFFFFF),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(17)),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Colors.redAccent[900],

                                          // enabledBorder: OutlineInputBorder(
                                          //   borderRadius:
                                          //       BorderRadius.all(Radius.circular(20)),
                                          // ),
                                        ),
                                        value: levelController.text,
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'level',
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
                                                  fontSize: 14),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'arm',
                                            child: Text(
                                              "ARM",
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 14),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'store',
                                            child: Text(
                                              "Store Manager",
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 14),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'exe',
                                            child: Text(
                                              "Executive",
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 14),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'admin',
                                            child: Text(
                                              "Admin",
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                        onChanged: (v) {
                                          levelController.text = v.toString();
                                        }),
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
                          hintText: "Store",
                          // label:Text(
                          //   'hs0445547@gmail.com',
                          //   style: TextStyle(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w400,
                          //     color:const Color(0xFF000000).withOpacity(0.6)
                          //   ),
                          // ),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                            width: size * 0.13,
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 8, top: 10, bottom: 6, left: 8),
                                height: sizee * 0.07,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFA74A45),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 6,
                                      right: 7,
                                    ),
                                    child: DropdownButtonFormField(
                                        alignment:
                                            AlignmentDirectional.topCenter,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        dropdownColor: const Color(0xFFA74A45),
                                        iconDisabledColor:
                                            const Color(0xFFFFFFFF),
                                        iconEnabledColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(17)),
                                        value: statusController.text,
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'act',
                                            child: Text(
                                              "Active",
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'ina',
                                            child: Text(
                                              "Inactive",
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 14,
                                              ),
                                            ),
                                          )
                                        ],
                                        onChanged: (v) {
                                          statusController.text = v.toString();
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _signController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      maxLength: 100,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          hintText:
                              "Thank you.\n*${_nameController.text}*\nStore Manager",
                          label: Text(
                            'Notification Sign off',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xFF000000).withOpacity(0.6)),
                          ),
                          prefixIcon: const Icon(Icons.edit_notifications),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: SFButton(
                        title: "Update",
                        onTap: () async {
                          prefs = user.preferences.data;
                          prefs["signoff"] = _signController.text;
                          prefs["level"] = levelController.text;
                          prefs["status"] = statusController.text;
                          prefs["number"] = _numcontroller.text;
                          //POPUP / MODAL ask current password

                          String oldPassword = "";
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Enter Old Password!!!"),
                              content: TextField(
                                controller: _oldpassController,
                                onChanged: (value) {
                                  oldPassword = value;
                                },
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFfff6f1),
                                    suffixIcon: Icon(Icons.lock),
                                    hintText: "Old Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () async {
                                    AuthState state = Provider.of<AuthState>(
                                        context,
                                        listen: false);
                                    await state.editAccount(
                                      _nameController.text,
                                      _emailController.text,
                                      _passController.text,
                                      _oldpassController.text,
                                      prefs,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Update',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFA74A45)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        titleColor: const Color(0xFFFFFFFF),
                        buttonBackgroundColor: const Color(0xFFA74A45),
                        borderColor: const Color(0x00ffffff),
                        borderRadius: 15,
                        titleFontSize: 18,
                        text: '',
                      ),
                    ),
                    const SizedBox(height: 21),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
