import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/ui/home_bottom.dart';
import 'package:sizifi/modules/splash/number_verification/enter_number.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_forgot_pass.dart';
import 'package:sizifi/modules/splash/ui/onboarding%20screens/onboarding.dart';

import '../../authentication/notifiers/auth_state.dart';
import '../../home/notifiers/store_state.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  var _isobs;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
    _isobs = true;
  }

  @override
  void dispose() {
    super.dispose();
    _enterPass.dispose();
  }

  final TextEditingController _enterEmail = TextEditingController();

  final TextEditingController _enterPass = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  var email, pass;

//Consumer

  bool fetched = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return Consumer<AuthState>(builder: (context, state, child) {
      state.setContext = context;

      if (!fetched && state.initiated) {
        if (state.isLoggedIn) {
          AuthState state = Provider.of<AuthState>(context, listen: false);
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            // Provider.of<OrderState>(context, listen: false)
            //     .getOrders(state.user.id);

            StoreState ss = Provider.of<StoreState>(context, listen: false);

            ss.getStores(state.userData);

            // print("Team id" + ss.activeStore!.team_id);
            // Provider.of<TemplatesState>(context, listen: false)
            //     .getTemplates(ss.activeStore!.team_id);

            setState(() {
              fetched = true;
            });
          });
        }
      }

      // print();

      return state.initiated
          ? state.isLoggedIn
              ? const HomeBottom()
              : SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Form(
                      key: _formkey,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/splash-bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Stack(
                            //   children: [
                            //     // Container(
                            //     //     decoration: const BoxDecoration(
                            //     //         image: DecorationImage(
                            //     //   image: AssetImage('assets/images/splash-bg.png'),
                            //     //   fit: BoxFit.fill,
                            //     // ))),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: sizee * 0.2,
                                  ),
                                  Image(
                                    image: const AssetImage(
                                        'assets/icons/SIZIFI FASHION TRANSPARENT DARK R.png'),
                                    height: 113,
                                    width: size * 0.7,
                                  ),
                                  SizedBox(
                                    height: 80,
                                    width: size * 0.9,
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: _enterEmail,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Field can not be empty!';
                                        }
                                        if (!RegExp(r'\S+@\S+\.\S+')
                                            .hasMatch(value)) {
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
                                  ),
                                  SizedBox(
                                    height: sizee * 0.001,
                                  ),
                                  SizedBox(
                                    height: 64,
                                    width: size * 0.9,
                                    child: TextFormField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: _enterPass,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Field can not be empty!';
                                        }
                                        return null;
                                      },
                                      obscureText: _isobs,
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Enter password",
                                          prefixIcon: const Icon(Icons.lock),
                                          fillColor: const Color(0xFFF4F4F4),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isobs = !_isobs;
                                                });
                                              },
                                              icon: Icon(_isobs
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizee * 0.015,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const ForgotPassPage();
                                            }));
                                          },
                                          child: const Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15.0,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizee * 0.01,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 54,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        backgroundColor:
                                            const Color(0xFFA74A45),
                                      ),
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          setState(() {
                                            email = _enterEmail.text;
                                            pass = _enterPass.text;
                                          });
                                          bool isValid = false;
                                          if (_enterEmail.text != "" &&
                                              _enterPass.text != "") {
                                            if (_enterPass.text.length >= 8) {
                                              isValid = true;
                                            }
                                          }
                                          print(isValid);
                                          if (isValid) {
                                            print("valid");
                                            try {
                                              EasyLoading.show(
                                                  status: "Logging in..",
                                                  maskType: EasyLoadingMaskType
                                                      .custom);
                                              // state.error = AppwriteException();
                                              // Future ls =
                                              await state.login(
                                                  _enterEmail.text,
                                                  _enterPass.text);
                                              setState(() {});
                                              EasyLoading.dismiss();
                                            } catch (e) {
                                              showLoginError(context,
                                                  state.error.toString());
                                              EasyLoading.dismiss();
                                              // print(e);
                                            }
                                          }
                                        } else {}
                                      },
                                      child: const Text("Login",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: sizee * 0.185,
                                  // ),
                                ],
                              ),
                            ),
                            // Positioned(
                            //   bottom: 0,
                            //   child: Container(
                            //     width: size,
                            //     height: 63,
                            //     decoration: const BoxDecoration(
                            //       color: Color(0xffF7A56D),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         GestureDetector(
                            //           onTap: () {
                            //             Navigator.push(context,
                            //                 MaterialPageRoute(
                            //                     builder: (context) {
                            //               return const EnterNumber();
                            //             }));
                            //           },
                            //           child: const Text.rich(
                            //             TextSpan(
                            //               text: 'Don\'t have an account?',
                            //               style: TextStyle(
                            //                 fontFamily: 'poppins',
                            //                 fontWeight: FontWeight.w400,
                            //                 fontSize: 14,
                            //               ),
                            //               children: [
                            //                 TextSpan(
                            //                   text: " Sign Up",
                            //                   style: TextStyle(
                            //                     color: Color(0xFFA74A45),
                            //                     fontFamily: 'poppins',
                            //                     fontSize: 14,
                            //                     fontWeight: FontWeight.w400,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // )
                            //   ],
                            // ),
                            const Expanded(child: SizedBox()),
                            Container(
                              width: size,
                              height: 63,
                              decoration: const BoxDecoration(
                                color: Color(0xffF7A56D),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const EnterNumber();
                                      }));
                                    },
                                    child: const Text.rich(
                                      TextSpan(
                                        text: 'Don\'t have an account?',
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: " Sign Up",
                                            style: TextStyle(
                                              color: Color(0xFFA74A45),
                                              fontFamily: 'poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
          : const OnBoardingPage();
    });
  }

  Future<String?> showLoginError(BuildContext context, String Error) {
    Error = Error != "" ? Error : "Invalid Login";
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Invalid Login"),
        content: const Text("Please check your email and password."),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }
}
