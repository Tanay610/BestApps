import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizifi/modules/splash/number_verification/get_code_page.dart';

class EnterNumber extends StatelessWidget {
  const EnterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController countrycode = TextEditingController();
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Container(
                    height: 29,
                    width: 29,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Icon(Icons.arrow_back,
                        size: 25, color: Color(0xFFA74A45)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  "Enter your phone number",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "We will send you a 4 digit verification code.",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: sizee * 0.4,
                      child: SvgPicture.asset("assets/images/1st page.svg")),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                width: size * 1,
                height: sizee * 0.34,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 10,
                      ),
                      child: Text(
                        "Enter mobile no.*",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 5),
                      child: IntlPhoneField(
                        controller: countrycode,
                        decoration: const InputDecoration(
                            filled: true,
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
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: Text.rich(
                        TextSpan(
                            text: 'By continuing you agree to the',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.normal,
                            ),
                            children: [
                              TextSpan(
                                text: " terms of service ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "and",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: " Privacy Policy ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            backgroundColor: const Color(0xFFA74A45),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const GetCodePage();
                            }));
                          },
                          child: const Text("Get Code",
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
            ],
          ),
        ),
      ),
    );
  }
}
