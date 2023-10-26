import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/splash/signup%20screens/n2_login.dart';
import 'package:sizifi/modules/splash/ui/onboarding%20screens/dot_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();

  int _pageindex = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  // _storeOnboarInfo() async {
  //   int isViewed = 0;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt("onboard", isViewed);
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: _list.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageindex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardBuilder(
                      image: _list[index].image,
                      title: _list[index].title,
                      description: _list[index].description);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: SizedBox(
              width: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                      _list.length,
                      (index) => DotPresenter(
                            isActive: index == _pageindex,
                          ))
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size * 0.95,
                  height: 60.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        // await _storeOnboarInfo();
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeIn);

                        if (_pageindex == 2) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.login,
                            (_) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA74A45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

class OnboardData {
  final String image, description, title;

  OnboardData(
      {required this.image, required this.description, required this.title});
}

final List<OnboardData> _list = [
  OnboardData(
      image: 'assets/images/Frame.png',
      description:
          'There are tons of creative and fun ways to customize your clothes to make them look unique and represent your own personal style. If you are interested in adding a \n'
          'few touches of flair to an article of clothing, you can do things such as use fabric paint to create designs, sew patches onto jackets, or add lace to shorts or tank tops.',
      title: 'Customize your clothes'),
  OnboardData(
      image: 'assets/images/frame1.png',
      description:
          'There are tons of creative and fun ways to customize your clothes to make them look unique and represent your own personal style. If you are interested in adding a \n'
          'few touches of flair to an article of clothing, you can do things such as use fabric paint to create designs, sew patches onto jackets, or add lace to shorts or tank tops.',
      title: 'Alter your clothes'),
  OnboardData(
      image: 'assets/images/Frame3.png',
      description:
          'There are tons of creative and fun ways to customize your clothes to make them look unique and represent your own personal style. If you are interested in adding a \n'
          'few touches of flair to an article of clothing, you can do things such as use fabric paint to create designs, sew patches onto jackets, or add lace to shorts or tank tops.',
      title: 'Get measured via AR'),
];

class OnboardBuilder extends StatefulWidget {
  const OnboardBuilder(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image, title, description;

  @override
  State<OnboardBuilder> createState() => _OnboardBuilderState();
}

class _OnboardBuilderState extends State<OnboardBuilder> {
  // _storeOnboarInfo() async {
  //   int isViewed = 0;
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt("onboard", isViewed);
  // }

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(25, 247, 165, 109).withOpacity(0.07),
              ),
              height: sizee * 0.9,
              width: size * 1,
              child: Stack(
                children: [
                  Positioned(
                    top: 20.0,
                    right: 0,
                    child: TextButton(
                        onPressed: () async {
                          // await _storeOnboarInfo();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginPage2();
                          }));
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                              color: Color(0xFFA74A45),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Positioned(
                      top: 30,
                      child: SvgPicture.asset('assets/images/scisy.svg')),
                  Positioned(
                    top: 80.0,
                    right: 20.0,
                    child: SizedBox(
                        height: 200.0, child: Image.asset(widget.image)),
                  ),
                  Positioned(
                      top: 280.0,
                      right: 0,
                      child: SvgPicture.asset("assets/images/needle.svg")),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0, top: 390.0),
                    child: Container(
                      width: size * 1,
                      height: sizee * 0.32,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25.0, left: 8, right: 8),
                            child: Text(
                              widget.description,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 350.0,
                      child: SvgPicture.asset("assets/images/tapesvg.svg")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
