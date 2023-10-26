import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  _SellerLoginScreenState createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  bool _isObscure1 = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:const Color(0xFFF7A56D),
          body: Container(
            padding:const EdgeInsets.only(top:40),
            child:Stack(
              children:[
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding:const EdgeInsets.symmetric(horizontal:20,vertical:20),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      Text(
                        "Glad to meet you again!",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ]
                  )
                ),
                Positioned(
                  bottom:0,
                  child:Container(
                    height:550,
                    padding:const EdgeInsets.symmetric(horizontal:20,vertical:20),
                    width:MediaQuery.of(context).size.width,
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                      ),
                      color:Color(0xFFFFFFFF)
                    ),
                    child:ListView(
                      children:[
                        const SizedBox(height:10),
                        TextField(   
                          decoration: InputDecoration( 
                            prefixIcon:const Icon(Icons.person), 
                            filled:true, 
                            fillColor:const Color(0xFFF4F4F4),
                            border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Color(0xFFF4F4F4))
                            ), 
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                            ),
                            hintText: 'Enter email address',  
                          ),  
                        ),  
                        const SizedBox(height:20),
                        TextField(  
                        obscureText: _isObscure1,
                        keyboardType: TextInputType.text, 
                          decoration: InputDecoration( 
                            prefixIcon:const Icon(Icons.lock,size:20), 
                            filled:true, 
                            fillColor:const Color(0xFFF4F4F4),
                            border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Color(0xFFF4F4F4))
                            ), 
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                            ),
                            hintText: 'Enter password',  
                            suffixIcon: IconButton(
                            icon: Icon(
                                  _isObscure1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure1 = !_isObscure1;
                                  });
                                },
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 25,
                                minHeight: 25,
                              ),
                          ),  
                        ),
                        const SizedBox(height:7),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.end,
                          children:[
                            Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF000000).withOpacity(0.6)),
                            ),
                          ]
                        ),
                        const SizedBox(height:10),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: SFButton(
                            title: "Login",
                            onTap: () {},
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFFA74A45),
                            borderColor: const Color(0x00ffffff),
                            borderRadius: 15,
                            titleFontSize: 18, text: '',
                          ),
                        ),
                        const SizedBox(height:10),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Don’t have an account?",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF1F1F1F))),
                                  TextSpan(
                                      text: " Sign Up",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFA74A45))),
                                ],
                              ),
                            )
                          ]
                        ),
                      ]
                    )
                  )
                )
              ]
            )
          ),
    ));
  }
}
