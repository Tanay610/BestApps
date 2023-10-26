import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class SellerResetPasswordScreen extends StatefulWidget {
  const SellerResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _SellerResetPasswordScreenState createState() => _SellerResetPasswordScreenState();
}

class _SellerResetPasswordScreenState extends State<SellerResetPasswordScreen> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;
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
                        "Reset Password",
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
                    height:510,
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
                            hintText: 'Old password',  
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
                        TextField(  
                        obscureText: _isObscure2,
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
                            hintText: 'New password',  
                            suffixIcon: IconButton(
                            icon: Icon(
                                  _isObscure2
                                      ? Icons.visibility
                                      : Icons.visibility_off,size:20
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
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
                        TextField(  
                        obscureText: _isObscure3,
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
                            hintText: 'Old password',  
                            suffixIcon: IconButton(
                            icon: Icon(
                                  _isObscure3
                                      ? Icons.visibility
                                      : Icons.visibility_off,size:20
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                },
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                          ),  
                        ),
                        const SizedBox(height:26),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: SFButton(
                            title: "Submit",
                            onTap: () {
                              showPlatformDialog(
                                context: context,
                                builder: (context) => BasicDialogAlert(
                                  //  title: Text("Current Location Not Available"),
                                  content: SizedBox(
                                      height: 300,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Image(image:AssetImage("assets/images/password.png"),height:93),
                                            const SizedBox(height:27),
                                            Text(
                                              "Password Changed",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xFF000000)),
                                            ),
                                            Text(
                                              "Your password has been successfully changed!",
                                              textAlign:TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color(0xFF5B5B5B)),
                                            ),
                                            const SizedBox(height:20),
                                            SizedBox(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width,
                                              child: SFButton(
                                                title: "Ok",
                                                onTap: () {Navigator.pop(context);},
                                                titleColor: const Color(0xFFFFFFFF),
                                                buttonBackgroundColor: const Color(0xFFA74A45),
                                                borderColor: const Color(0x00ffffff),
                                                borderRadius: 15,
                                                titleFontSize: 18, text: '',
                                              ),
                                            ),
                                          ])),
                                ),
                              );
                            },
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
