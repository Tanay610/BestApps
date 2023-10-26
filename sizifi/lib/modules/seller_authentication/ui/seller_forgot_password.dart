import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';

class SellerForgotPasswordScreen extends StatefulWidget {
  const SellerForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _SellerForgotPasswordScreenState createState() => _SellerForgotPasswordScreenState();
}

class _SellerForgotPasswordScreenState extends State<SellerForgotPasswordScreen> {
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
                  padding:const EdgeInsets.symmetric(horizontal:20),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        mainAxisAlignment:MainAxisAlignment.start,
                        children:[
                          Container(
                            height:24,
                            width:24,
                            decoration:BoxDecoration(
                              color:const Color(0xFFA74A45),
                              borderRadius:BorderRadius.circular(5)
                            ),
                            child:const Center(
                              child:Icon(Icons.arrow_back,color:Color(0xFFFFFFFF),size:18)
                            )
                          ),
                          // SizedBox()
                        ]
                      ),
                      Text(
                        "Forgot Password",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      Text(
                        "We need your registration email for reset password!",
                        textAlign:TextAlign.center,
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
                    height:520,
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
                        const SizedBox(height:26),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: SFButton(
                            title: "Submit",
                            onTap: () {},
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFFA74A45),
                            borderColor: const Color(0x00ffffff),
                            borderRadius: 15,
                            titleFontSize: 18, text: '',
                          ),
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
