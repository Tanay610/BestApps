import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/splash/number_verification/otp_form.dart';
import 'package:get/get.dart';
import 'package:sizifi/modules/splash/number_verification/timer_controller.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_signup.dart';

class GetCodePage extends GetView<TimerController> {
  const GetCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TimerController());
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
                height: 25.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 49,
                ),
                child: SizedBox(
                    height: sizee * 0.4,
                    child: SvgPicture.asset("assets/images/VerifiedPage.svg")),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verify",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  "Enter code sent to your phone number and email!",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size * 1,
                height: sizee * 0.40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const OTPForm(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
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
                              return const SignupPage();
                            }));
                          },
                          child: const Text("Next",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    Obx(() => Center(
                          child: Text(
                            controller.time.value,
                            style:
                                const TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        )),
                    const Text.rich(
                      TextSpan(
                          text: 'Didn\'t recieve OTP ?',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                                text: 'Resend OTP',
                                style: TextStyle(
                                  color: Color(0xFFA74A45),
                                ))
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
