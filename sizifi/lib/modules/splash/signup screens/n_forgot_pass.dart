import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final TextEditingController _emailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  var email;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    AuthState state = Provider.of<AuthState>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF7A56D),
      body: Form(
        key: _formkey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: size * 0.85, top: 15),
                    height: 29,
                    width: 29,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Color(0xFFA74A45),
                    ),
                  ),
                ),
                SizedBox(
                    height: sizee * 0.45,
                    child: SvgPicture.asset(
                        "assets/images/New Forgot password-pana 1.svg")),

                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Text(
                  "We need your registration email for reset password.",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 27),
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  width: size * 1,
                  height: sizee * 0.34,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F4F4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          controller: _emailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field can not be empty!';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              filled: true,
                              hintText: "Enter email address",
                              fillColor: Color(0xFFF4F4F4),
                              prefixIcon: Icon(Icons.person),
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
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
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
                                    setState(() {
                                      email = _emailcontroller.text;
                                    });
                                    if (email.isNotEmpty) {
                                      print("checking pass");
                                    }
                                    await state.recovery(email,
                                        "https://sizifi.com/recover-password");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Recovery mail sent!!")));
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
