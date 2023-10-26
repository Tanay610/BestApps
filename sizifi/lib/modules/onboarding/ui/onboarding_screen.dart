import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:sizifi/components/sf_button.dart';
//import 'package:sizifi/modules/authentication/ui/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int selectedPage;
  late final PageController? _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFfff6f1),
            body: Stack(alignment: AlignmentDirectional.center, children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(children: [
                    InkWell(
                      child: IgnorePointer(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Text(
                              "Skip",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFA74A45)),
                            ),
                          ])),
                      onTap: () {
                        // Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //           builder: (ctx) =>  LoginScreen()));
                      },
                    )
                  ])),
              PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  children: [
                    Container(
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                          Container(
                              child: Column(children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14),
                            const Image(
                                image: AssetImage(
                                    "assets/images/onboarding-2.png"),
                                height: 200),
                          ])),
                          Positioned(
                              bottom: 1,
                              child: Container(
                                  height: 308,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 22),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                      color: Color(0xFFFFFFFF)),
                                  child: Column(children: [
                                    Text(
                                      "Customize your clothes",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF000000)),
                                    ),
                                    const SizedBox(height: 11),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the dummy content.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B5B5B)),
                                    ),
                                  ])))
                        ])),
                    Container(
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                          Container(
                              child: Column(children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14),
                            const Image(
                                image: AssetImage(
                                    "assets/images/onboarding-1.png"),
                                height: 200),
                          ])),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                  height: 308,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 22),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                      color: Color(0xFFFFFFFF)),
                                  child: Column(children: [
                                    Text(
                                      "Alter your clothes",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF000000)),
                                    ),
                                    const SizedBox(height: 11),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the dummy content.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B5B5B)),
                                    ),
                                  ])))
                        ])),
                    Container(
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                          Container(
                              child: Column(children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14),
                            const Image(
                                image: AssetImage(
                                    "assets/images/onboarding-3.png"),
                                height: 200),
                          ])),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                  height: 308,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 22),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                      color: Color(0xFFFFFFFF)),
                                  child: Column(children: [
                                    Text(
                                      "Get messured Via AR",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF000000)),
                                    ),
                                    const SizedBox(height: 11),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the dummy content.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B5B5B)),
                                    ),
                                  ])))
                        ])),
                  ]),
              Positioned(
                  top: 0,
                  child: Image(
                      image: const AssetImage("assets/images/onboarding-bg.png"),
                      width: MediaQuery.of(context).size.width)),
              Positioned(
                  bottom: 30,
                  child: Center(
                    child: Column(children: [
                      DotsIndicator(
                        dotsCount: 3,
                        // position: selectedPage.toDouble(),
                        decorator: DotsDecorator(
                          colors: [
                            const Color(0xFFA74A45).withOpacity(0.11),
                            const Color(0xFFA74A45).withOpacity(0.11),
                            const Color(0xFFA74A45).withOpacity(0.11)
                          ],
                          activeColors: [
                            const Color(0xFFA74A45),
                            const Color(0xFFA74A45),
                            const Color(0xFFA74A45)
                          ],
                          size: const Size(26.0, 7.0),
                          activeSize: const Size(26.0, 7.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: SFButton(
                          title: "Next",
                          onTap: () {
                            // Navigator.of(context).pushReplacement(
                            // MaterialPageRoute(
                            //     builder: (ctx) =>  LoginScreen()));
                          },
                          titleColor: const Color(0xFFFFFFFF),
                          buttonBackgroundColor: const Color(0xFFA74A45),
                          borderColor: const Color(0x00ffffff),
                          borderRadius: 15,
                          titleFontSize: 18,
                          text: '',
                        ),
                      ),
                    ]),
                  ))
            ])));
  }
}
