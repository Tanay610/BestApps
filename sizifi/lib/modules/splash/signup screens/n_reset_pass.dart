import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:appwrite/models.dart' as models;
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:sizifi/modules/splash/signup%20screens/passDialog.dart';

import '../../authentication/models/user.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  var _newObs;
  var _oldObs;
  var _confirmObs;
  late User user;

  TextEditingController newController = TextEditingController();

  TextEditingController oldController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newObs = true;
    _oldObs = true;
    _confirmObs = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    oldController.dispose();
    newController.dispose();
    confirmController.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthState state = Provider.of<AuthState>(context, listen: false);
    Provider.of<AuthState>(context, listen: false).getAccount();
    user = Provider.of<AuthState>(context, listen: false).user;
    models.Preferences pref = user.preferences;
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF7A56D),
      body: Form(
        key: _formkey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 24,
                    width: 24,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Color(0xFFA74A45),
                    ),
                  ),
                ),
                SizedBox(
                    height: sizee * 0.3,
                    child: SvgPicture.asset(
                        "assets/images/Reset password-pana 1.svg")),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We need your registration email for reset password!",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: size * 1,
                  height: sizee * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            obscureText: _oldObs,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can not be empty!';
                              }
                              //  if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+[{\]};:<>|./?]).{10,}$').hasMatch(value)) {
                              //   return "Please enter a valid password";
                              // }
                              return null;
                            },
                            controller: oldController,
                            decoration: InputDecoration(
                                hintText: 'Old password',
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _oldObs
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _oldObs = !_oldObs;
                                    });
                                  },
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                fillColor: const Color(0xFFF4F4F4),
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
                          TextFormField(
                            obscureText: _newObs,
                            controller: newController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can not be empty!';
                              }
                              if (!RegExp(
                                      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+[{\]};:<>|./?]).{10,}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'New password',
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _newObs
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _newObs = !_newObs;
                                    });
                                  },
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                fillColor: const Color(0xFFF4F4F4),
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
                          TextFormField(
                            obscureText: _confirmObs,
                            controller: confirmController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can not be empty!';
                              }
                              if (!RegExp(
                                      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+[{\]};:<>|./?]).{10,}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Confirm password',
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _confirmObs
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _confirmObs = !_confirmObs;
                                    });
                                  },
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                fillColor: const Color(0xFFF4F4F4),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                backgroundColor: const Color(0xFFA74A45),
                              ),
                              onPressed: () async {
                                try {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {});
                                    if (_newObs == _confirmObs) {
                                      print("checking pass");
                                    }
                                    // bool isCorrect = await state.checkOldPassword(user.id, oldController.text);
                                    // if(isCorrect){
                                    var status = await state.editAccount(
                                        null,
                                        null,
                                        newController.text,
                                        oldController.text,
                                        null);

                                    print("status: " + status.toString());
                                    if (status == true) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Password Changed!!")));
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const PasswordDialog();
                                          });
                                    } else {
                                      
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Password Not Changed, Please check your password!!")));
                                    }
                                  }
                                } on AppwriteException catch (e) {
                                  print(e.message);
                                }
                              },
                              child: const Text("Submit",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
