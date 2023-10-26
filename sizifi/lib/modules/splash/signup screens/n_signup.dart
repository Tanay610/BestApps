import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:sizifi/modules/splash/signup%20screens/n2_login.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_login.dart';
import 'package:sizifi/modules/splash/signup%20screens/signupDialog.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _enterName = TextEditingController();
  TextEditingController _enterEmail = TextEditingController();
  TextEditingController _enterPassword = TextEditingController();
  TextEditingController _recheckpass = TextEditingController();
  var _isObsecure;
  var _reObsecure;
  bool? check1 = false;
  final _formkey = GlobalKey<FormState>();
  var email, pass, name, number;
  String? _number = "";
  String? _number_country = 'IN';
  String? _number_country_code = '+91';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isObsecure = true;
    _reObsecure = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _enterPassword.dispose();
    _recheckpass.dispose();
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 13),
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Color(0xFFA74A45),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: sizee * 0.2138,
                          child: SvgPicture.asset(
                              "assets/images/Mobile login-bro 1.svg")),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter your details for sign up!",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: size * 1,
                    height: sizee * 0.58,
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
                          children: [
                            TextFormField(
                              controller: _enterName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field can not be empty!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Enter Name',
                                  filled: true,
                                  prefixIcon: Icon(Icons.person_rounded),
                                  fillColor: Color(0xFFF4F4F4),
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
                            TextFormField(
                              controller: _enterEmail,
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
                                  hintText: 'Enter email address',
                                  filled: true,
                                  prefixIcon: Icon(Icons.person_rounded),
                                  fillColor: Color(0xFFF4F4F4),
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
                            TextFormField(
                              controller: _enterPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field can not be empty!';
                                }
                                return null;
                              },
                              obscureText: _isObsecure,
                              decoration: InputDecoration(
                                  hintText: 'Enter password',
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObsecure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObsecure = !_isObsecure;
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
                              controller: _recheckpass,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field can not be empty!';
                                }
                                return null;
                              },
                              obscureText: _reObsecure,
                              decoration: InputDecoration(
                                  hintText: 'Re-check password',
                                  filled: true,
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _reObsecure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _reObsecure = !_reObsecure;
                                      });
                                    },
                                  ),
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
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  backgroundColor: const Color(0xFFA74A45),
                                ),
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    var number;
                                    setState(() {
                                      email = _enterEmail.text;
                                      pass = _enterPassword.text;
                                      name = _enterName.text;
                                      number = _number_country_code.toString() +
                                          _number.toString();
                                    });

                                    bool isValid = false;

                                    if (email.isNotEmpty &&
                                        pass.isNotEmpty &&
                                        name.isNotEmpty &&
                                        number.isNotEmpty) {
                                      print("checking pass");
                                      if (_enterPassword.text.length >= 8) {
                                        isValid = true;
                                      }
                                    }
                                    print(isValid);
                                    if (isValid) {
                                      await state.createAccount(
                                          _enterName.text,
                                          _enterEmail.text,
                                          _enterPassword.text,
                                          _number.toString(),
                                          _number_country.toString(),
                                          _number_country_code.toString(),
                                          true);
                                      EasyLoading.dismiss();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              Routes.login, (_) => false);
                                      // Navigator.pop(context);
                                    }
                                  }
                                },
                                child: const Text("Sign up",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginPage2();
                                }));
                              },
                              child: const Text.rich(
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Login',
                                          style: TextStyle(
                                            color: Color(0xFFA74A45),
                                          ))
                                    ]),
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
      ),
    );
  }
}
