import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class SellerVerifyScreen extends StatefulWidget {
  const SellerVerifyScreen({Key? key}) : super(key: key);

  @override
  _SellerVerifyScreenState createState() => _SellerVerifyScreenState();
}

class _SellerVerifyScreenState extends State<SellerVerifyScreen> {
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
                    crossAxisAlignment:CrossAxisAlignment.center,
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
                      const Image(image:AssetImage("assets/images/verify.png"),height:160),
                      Text(
                        "Verify",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      Text(
                        "Enter code sent to your phone number & email!",
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
                    height:430,
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: PinCodeTextField(
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              activeColor: const Color(0xFFF6F6F6),
                              activeFillColor: const Color(0xFFF6F6F6),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              inactiveFillColor: const Color(0xFFF6F6F6),
                              inactiveColor: const Color(0xFFF6F6F6),
                              selectedFillColor: const Color(0xFFF6F6F6),
                              selectedColor: const Color(0xFFF6F6F6),
                              errorBorderColor: const Color(0xFFF6F6F6),
                            ),
                            errorAnimationController: null, // Pass it here
                            textStyle: GoogleFonts.poppins(
                              color: const Color(0xFF1F1F1F),
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            appContext: context,
                          ),
                        ),
                        Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              const Icon(Icons.timer_outlined, size: 20),
                              OtpTimerButton(
                                onPressed: () {},
                                text: const Text('00 :'),
                                textColor: const Color(0xFF000000),
                                duration: 60,
                                buttonType: ButtonType.text_button,
                                backgroundColor: const Color(0xFF000000),
                              ),
                            ])),
                        const SizedBox(height:30),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: SFButton(
                            title: "Signup",
                            onTap: () {
                              showPlatformDialog(
                                context: context,
                                builder: (context) => BasicDialogAlert(
                                  //  title: Text("Current Location Not Available"),
                                  content: SizedBox(
                                      height: 350,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Image(image:AssetImage("assets/images/verify-popup.png"),height:160),
                                            const SizedBox(height:27),
                                            Text(
                                              "Account Created",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xFF000000)),
                                            ),
                                            Text(
                                              "Your account has been successfully created!",
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
                        const SizedBox(height:25),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Didn't recieve OTP?",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF1F1F1F))),
                                  TextSpan(
                                      text: " Resend OTP",
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
