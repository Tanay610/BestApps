import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/core/config/providers.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:sizifi/modules/home/Order%20pages/delivery_charges/charges_provider/deli_provider.dart';
import 'package:sizifi/modules/home/Order%20pages/increment_provider.dart';
//import 'package:sizifi/modules/home/Templates/text_provider.dart';
import 'package:sizifi/modules/home/notifiers/delivery_mode_state.dart';
import 'package:sizifi/modules/home/notifiers/item_type_state.dart';
import 'package:sizifi/modules/home/notifiers/templates_state.dart';
import 'package:sizifi/modules/home/ui/criteria.dart';
import 'package:sizifi/modules/home/ui/home_bottom.dart';
//import 'package:sizifi/modules/authentication/ui/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizifi/modules/home/ui/home_screen.dart';
import 'package:sizifi/modules/onboarding/ui/onboarding_screen.dart';
// import 'package:sizifi/modules/settings/ui/profile.dart';
import 'package:sizifi/modules/splash/number_verification/enter_number.dart';
import 'package:sizifi/modules/splash/number_verification/timer_controller.dart';
import 'package:sizifi/modules/splash/signup%20screens/n2_login.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_forgot_pass.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_login.dart';
import 'package:sizifi/modules/splash/ui/splash.dart';
// import 'package:sizifi/modules/splash/signup%20screens/n_signup.dart';
// import 'package:sizifi/modules/splash/ui/onboarding%20screens/onboarding.dart';
// import 'package:sizifi/modules/splash/ui/splash.dart';

import 'modules/home/notifiers/store_state.dart';
// import 'modules/home/Order pages/item_add_page.dart';
import 'modules/home/notifiers/delivery_charges_state.dart';
import 'modules/home/notifiers/order_state.dart';
import 'modules/home/notifiers/point_of_measurement_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'modules/splash/ui/onboarding screens/onboarding.dart';

// import 'core/store.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // isViewed = prefs.getInt("onboard");

  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthState()),
      ChangeNotifierProvider(create: (context) => ItemTypeState()),
      ChangeNotifierProvider(create: (context) => PointOfMeasurementState()),
      // ChangeNotifierProvider(create: (context) => TextProvider()),
      ChangeNotifierProvider(create: (context) => ChargesProvider()),
      ChangeNotifierProvider(create: (context) => DeliveryChargesState()),
      ChangeNotifierProvider(create: (context) => OrderCountProvider()),
      ChangeNotifierProvider(create: (context) => CsvProvider()),
      ChangeNotifierProvider(create: (context) => TemplatesState()),
      ChangeNotifierProvider(create: (context) => Criteria()),
      ChangeNotifierProvider(create: (context) => DeliveryModeState()),
    ],
    child: const MyApp(),
  ));

//  FlutterNativeSplash.remove();
}

void configLoading(context) {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..animationDuration = const Duration(milliseconds: 100)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..progressColor = const Color(0xffff7043)
    ..backgroundColor = Colors.white
    ..indicatorColor = const Color(0xffff7043)
    ..textColor = const Color(0xffff7043)
    ..maskColor = Colors.white;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  bool fetched = false;
  @override
  Widget build(BuildContext context) {
    bool initLoader = false;
    if (!initLoader) {
      configLoading(context);
      initLoader = false;
    }
    EasyLoading.init();

    return MultiProvider(
        providers: providers,
        child: RefreshConfiguration(
          headerTriggerDistance: 40.0,
          footerTriggerDistance: 10.0,
          child: MaterialApp(
            title: 'SIZIFI',
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // highlightColor: Colors.transparent,
              // splashFactory: NoSplash.splashFactory,
              primarySwatch: const MaterialColor(
                0xFFF7A56D, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
                <int, Color>{
                  50: Color(0xFFF7A56D), //10%
                  100: Color(0xFFF7A56D), //20%
                  200: Color(0xFFF7A56D), //30%
                  300: Color(0xFFF7A56D), //40%
                  400: Color(0xFFF7A56D), //50%
                  500: Color(0xFFF7A56D), //60%
                  600: Color(0xFFF7A56D), //70%
                  700: Color(0xFFF7A56D), //80%
                  800: Color(0xFFF7A56D), //90%
                  900: Color(0xFFF7A56D), //100%
                },
              ),
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: const MaterialColor(
                  0xFFF7A56D, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
                  <int, Color>{
                    50: Color(0xFFF7A56D), //10%
                    100: Color(0xFFF7A56D), //20%
                    200: Color(0xFFF7A56D), //30%
                    300: Color(0xFFF7A56D), //40%
                    400: Color(0xFFF7A56D), //50%
                    500: Color(0xFFF7A56D), //60%
                    600: Color(0xFFF7A56D), //70%
                    700: Color(0xFFF7A56D), //80%
                    800: Color(0xFFF7A56D), //90%
                    900: Color(0xFFF7A56D), //100%
                  },
                ),
              ),
              splashColor: const Color(0xFFF7A56D), //snackbar color
              primaryColor: const Color(0xFFF7A56D), //appbars color
              primaryColorDark:
                  const Color(0xFFF7A56D).withOpacity(0.1), //background color
              iconTheme: const IconThemeData(color: Color(0xFFA74A45)),
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme(
                  brightness: Brightness.light,
                  primary: const Color(0xFFFFFF),
                  onPrimary: const Color(0xFFFFFF),
                  secondary: const Color(0xFFFFFF),
                  onSecondary: const Color(0xFFFFFF),
                  error: const Color(0xFFFFFF),
                  onError: const Color(0xFFFFFF),
                  background: const Color(0xFFA74A45),
                  onBackground: const Color(0xFFA74A45)
                      .withOpacity(0.3), //background of bottombar buttons
                  surface: const Color(0xFFFFFF),
                  onSurface: const Color(0xFFFFFF),
                ),
              ),
              textTheme: TextTheme(
                  displayLarge: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF), //FFFFFF
                      fontFamily:
                          GoogleFonts.poppins().fontFamily), //appbar textstyle
                  displaySmall: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF333333),
                  ), //333333//store headlines
                  displayMedium: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(
                          0xFF333333)) //333333//section headlines(settings)
                  ),
            ),
            home: Consumer<AuthState>(
              builder: (context, state, child) {
                state.setContext = context;
                // print(state.initiated);
                // state.context=context;
                // if (!state.initiated) {
                //   EasyLoading.show(maskType: EasyLoadingMaskType.custom);
                // } else {
                //   EasyLoading.dismiss();
                // }
                if (state.initiated && !fetched) {
                  if (state.isLoggedIn) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // Add Your Code here.

                      // print("userdata: "+state.userData.toString());

                      // Provider.of<OrderState>(context, listen: false)
                      //     .getOrders(state.user.id);

                      StoreState ss =
                          Provider.of<StoreState>(context, listen: false);

                      ss.getStores(state.userData);

                      // print("Team id" + ss.activeStore!.team_id);
                      ss.getStoreData(context, null);
                      // Provider.of<TemplatesState>(context, listen: false)
                      //     .getTemplates(ss.activeStore.team_id);

                      setState(() {
                        // if (Provider.of<OrderState>(context, listen: false)
                        //         .orders
                        //         .length >
                        //     0) {
                        // print(Provider.of<OrderState>(context, listen: false)
                        //     .orders);
                        fetched = true;
                        // }
                      });
                    });
                  }
                }

                // print();

                return state.initiated
                    ? state.isLoggedIn
                        ? const HomeBottom()
                        : const OnBoardingPage()
                    : const SplashPage();
              },
            ),
            onGenerateRoute: Routing.allRoutes,
          ),
        ));
  }
}
