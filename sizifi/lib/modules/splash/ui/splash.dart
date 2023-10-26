import 'package:flutter/material.dart';
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:sizifi/modules/home/ui/home_bottom.dart';
import 'package:sizifi/modules/splash/ui/onboarding%20screens/onboarding.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // startTimeout() {
  //   // return Timer(const Duration(seconds: 3), handleTimeout);
  //   // Duration(seconds: 3)
  //   // Timer(const Duration(seconds: 3), () {
  //   //   handleTimeout();
  //   // });
  // }

  // void handleTimeout() {
  //   changeScreen();
  // }

  bool navigating = false;

  changeScreen(BuildContext context) {
    if (isInitiated) {
      // navigating = true;
      print('Change Screen called');
      isLoggedIn
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const HomeBottom();
              }),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const OnBoardingPage();
              }),
            );
    }

    //  Navigator.pushReplacement(
    //       context as BuildContext,
    //       MaterialPageRoute(
    //         builder: (context) => const MyApp(),
    //       ),
    //     );
  }

  @override
  void initState() {
    super.initState();

    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   changeScreen(context);
    // });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // print("WidgetsBinding");
    //   changeScreen();
    // });
    // Future.delayed(Duration.zero, () => changeScreen());
  }

  bool isLoggedIn = false;
  bool isInitiated = false;
  @override
  Widget build(BuildContext context) {
    // startTimeout();
    isLoggedIn = Provider.of<AuthState>(context, listen: false).isLoggedIn;
    isInitiated = Provider.of<AuthState>(context, listen: false).initiated;

    // // setState(() {});
    // mounted ? changeScreen()
    // if (mounted == false) {
    //   changeScreen();
    // }
    // if (isLoggedIn) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     changeScreen(context);
    //   });
    // changeScreen(context);
    // }
    // print(isLoggedIn);
    double size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/splash-bg.png'),
            fit: BoxFit.fill,
          )),
          child: Center(
            child: Image(
              image: const AssetImage(
                  'assets/icons/SIZIFI FASHION TRANSPARENT DARK R.png'),
              height: 113,
              width: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
