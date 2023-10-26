import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';

class SellerSignupScreen extends StatefulWidget {
  const SellerSignupScreen({Key? key}) : super(key: key);

  @override
  _SellerSignupScreenState createState() => _SellerSignupScreenState();
}

class _SellerSignupScreenState extends State<SellerSignupScreen> {
  bool _isObscure1 = true;
  bool? check1 = false;
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
                        ]
                      ),
                      Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      Text(
                        "Enter your details for sign up!",
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
                            prefixIcon:const Icon(Icons.person,size:20), 
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
                            hintText: 'Enter name',  
                          ),  
                        ),  
                        const SizedBox(height:20),
                        TextField(   
                          decoration: InputDecoration( 
                            prefixIcon:const Icon(Icons.person,size:20), 
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
                          decoration: InputDecoration( 
                            prefixIcon:const Icon(Icons.phone,size:20), 
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
                            hintText: 'Phone number',  
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
                                      : Icons.visibility_off,size:20
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure1 = !_isObscure1;
                                  });
                                },
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                          ),  
                        ),
                        const SizedBox(height:10),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children:[
                            Checkbox( 
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              value: check1,
                              onChanged: (bool? value){
                                  setState(() {
                                      check1 = value;
                                  });
                              }
                            ),
                            Text(
                              "I agree with Terms & Privacy",
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
                            title: "Signup",
                            onTap: () {},
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFFA74A45),
                            borderColor: const Color(0x00ffffff),
                            borderRadius: 15,
                            titleFontSize: 18, text: '',
                          ),
                        ), 
                        const SizedBox(height:50),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Already have an account?",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF1F1F1F))),
                                  TextSpan(
                                      text: " Login",
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
