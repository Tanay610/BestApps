import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:sizifi/core/routing/routing.dart';

import '../notifiers/auth_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // final _formkey = GlobalKey<FormState>();
  var email;
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthState state = Provider.of<AuthState>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF7A56D),
      body: Form(
          // key: _formkey,
          child: Container(
              padding: const EdgeInsets.only(top: 40),
              child: Stack(children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              Routes.login, (_) => false);
                                    },
                                    child: Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFA74A45),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Center(
                                            child: Icon(Icons.arrow_back,
                                                color: Color(0xFFFFFFFF),
                                                size: 18)))),
                                // SizedBox()
                              ]),
                          const Image(
                              image: AssetImage(
                                  "assets/images/forgot-password.png"),
                              height: 160),
                          Text(
                            "Forgot Password",
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF)),
                          ),
                          Text(
                            "We need your registration email for reset password!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ])),
                Positioned(
                    bottom: 0,
                    child: Container(
                        height: 420,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                            color: Color(0xFFFFFFFF)),
                        child: ListView(children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field can not be empty!';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: const Color(0xFFF4F4F4),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Color(0xFFF4F4F4))),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: Color(0xFFF4F4F4)),
                              ),
                              hintText: 'Enter email address',
                            ),
                          ),
                          const SizedBox(height: 26),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: SFButton(
                              title: "Submit",
                              onTap: () async {
                                try{
                                  var formkey;
                                  if (formkey.currentState!.validate()) {
                                  setState(() {
                                    email = _email.text;
                                  });
                                  if (email.isNotEmpty ) {
                                      print("checking pass");
                                  }
                                  await state.recovery(email, "https://endpoint.sizifi.com/v1/account/recovery");
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recovery mail sent!!")));
                                }
                                } on AppwriteException catch(e){
                                  print(e.message);
                                }
                              },
                              titleColor: const Color(0xFFFFFFFF),
                              buttonBackgroundColor: const Color(0xFFA74A45),
                              borderColor: const Color(0x00ffffff),
                              borderRadius: 15,
                              titleFontSize: 18, text: '',
                            ),
                          ),
                        ])))
              ]))),
    ));
  }
}
