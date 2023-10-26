// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
// import 'package:sizifi/modules/splash/number_verification/enter_number.dart';
// import 'package:sizifi/modules/splash/signup%20screens/n_forgot_pass.dart';
// import 'package:sizifi/modules/splash/signup%20screens/n_signup.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   var _isobs;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _isobs = true;
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _enterPass.dispose();
//   }

//   TextEditingController _enterEmail = TextEditingController();

//   TextEditingController _enterPass = TextEditingController();

//   final _formkey = GlobalKey<FormState>();
//   var email, pass;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size.width;
//     var sizee = MediaQuery.of(context).size.height;
//     AuthState state = Provider.of<AuthState>(context, listen: false);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffF7A56D),
//         body: Form(
//           key: _formkey,
//           child: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 35,
//                     ),
//                     child: SizedBox(
//                         height: sizee * 0.4,
//                         child:
//                             SvgPicture.asset("assets/images/Login-pana.svg")),
//                   ),
//                   Text(
//                     "Login",
//                     style: TextStyle(
//                       fontFamily: 'poppins',
//                       fontSize: 30.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Glad to meet you again.",
//                     style: TextStyle(
//                       fontFamily: 'poppins',
//                       fontSize: 12.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 25),
//                     width: size * 1,
//                     height: 310,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(24.0),
//                         topRight: Radius.circular(24.0),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFF4F4F4),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(15.0)),
//                               border: Border.all(color: Colors.white),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: TextFormField(
//                               controller: _enterEmail,
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Field can not be empty!';
//                                 }
//                                 if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//                                   return "Please enter a valid email address";
//                                 }
//                                 return null;
//                               },
//                               decoration: const InputDecoration(
//                                   filled: true,
//                                   hintText: "Enter email address",
//                                   fillColor: Color(0xFFF4F4F4),
//                                   prefixIcon: Icon(Icons.person),
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide: BorderSide(color: Colors.white),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide: BorderSide(color: Colors.white),
//                                   )),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 6),
//                             child: TextFormField(
//                               controller: _enterPass,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Field can not be empty!';
//                                 }
//                                 return null;
//                               },
//                               obscureText: _isobs,
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   hintText: "Enter password",
//                                   prefixIcon: Icon(Icons.lock),
//                                   fillColor: Color(0xFFF4F4F4),
//                                   suffixIcon: IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _isobs = !_isobs;
//                                         });
//                                       },
//                                       icon: Icon(_isobs
//                                           ? Icons.visibility
//                                           : Icons.visibility_off)),
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide: BorderSide(color: Colors.white),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide: BorderSide(color: Colors.white),
//                                   )),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 13,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                   right: 8,
//                                 ),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(context,
//                                         MaterialPageRoute(builder: (context) {
//                                       return ForgotPassPage();
//                                     }));
//                                   },
//                                   child: Text(
//                                     "Forgot Password?",
//                                     style: TextStyle(
//                                       color: Colors.black54,
//                                       fontSize: 15.0,
//                                       fontFamily: 'poppins',
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 13,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 6.0),
//                             child: SizedBox(
//                               width: MediaQuery.of(context).size.width,
//                               height: 50,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(15.0))),
//                                   backgroundColor: const Color(0xFFA74A45),
//                                 ),
//                                 onPressed: () async {
//                                   if (_formkey.currentState!.validate()) {
//                                     setState(() {
//                                       email = _enterEmail.text;
//                                       pass = _enterPass.text;
//                                     });
//                                     bool isValid = false;
//                                     if (_enterEmail.text != "" &&
//                                         _enterPass.text != "") {
//                                       if (_enterPass.text.length >= 8) {
//                                         isValid = true;
//                                       }
//                                     }
//                                     print(isValid);
//                                     if (isValid) {
//                                       print("valid");
//                                       try {
//                                         EasyLoading.show(
//                                             status: "Logging in..",
//                                             maskType:
//                                                 EasyLoadingMaskType.custom);
//                                         // state.error = AppwriteException();
//                                         // Future ls =
//                                         await state.login(
//                                             _enterEmail.text, _enterPass.text);
//                                         EasyLoading.dismiss();
//                                       } catch (e) {
//                                         showLoginError(
//                                             context, state.error.toString());
//                                         EasyLoading.dismiss();
//                                         // print(e);
//                                       }
//                                     }
//                                   } else {}
//                                 },
//                                 child: const Text("Login",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     )),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 13,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return EnterNumber();
//                                   }));
//                                 },
//                                 child: Text.rich(
//                                   TextSpan(
//                                     text: 'Don\'t have an account?',
//                                     style: TextStyle(
//                                       fontFamily: 'poppins',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14,
//                                     ),
//                                     children: [
//                                       TextSpan(
//                                         text: " Sign Up",
//                                         style: TextStyle(
//                                           color: Color(0xFFA74A45),
//                                           fontFamily: 'poppins',
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<String?> showLoginError(BuildContext context, String Error) {
//     Error = Error != "" ? Error : "Invalid Login";
//     return showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text("Invalid Login"),
//         content: const Text("Please check your email and password."),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Okay'),
//           ),
//         ],
//       ),
//     );
//   }
// }
