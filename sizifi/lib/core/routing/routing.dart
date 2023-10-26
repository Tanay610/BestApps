import 'package:sizifi/modules/home/ui/search_screen.dart';

import 'package:sizifi/modules/splash/signup%20screens/n2_login.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_login.dart';
import 'package:sizifi/modules/splash/ui/splash.dart';
import 'package:sizifi/modules/authentication/ui/forgot_password.dart';
import 'package:sizifi/modules/authentication/ui/reset_password.dart';
import 'package:sizifi/modules/onboarding/ui/onboarding_screen.dart';
import 'package:sizifi/modules/home/ui/home_screen.dart';
import 'package:sizifi/modules/home/ui/home_bottom.dart';
import 'package:sizifi/modules/home/ui/add_order.dart';
import 'package:sizifi/modules/settings/ui/settings.dart';
import 'package:sizifi/modules/settings/ui/edit_profile.dart';
import 'package:sizifi/modules/settings/ui/Order_setting/order_setting.dart';
import 'package:sizifi/modules/store/ui/add_store.dart';
import 'package:sizifi/modules/store/ui/add_new_user.dart';
import 'package:sizifi/modules/store/ui/all_stores.dart';
import 'package:sizifi/modules/store/ui/single_store.dart';
import 'package:sizifi/modules/seller_authentication/ui/seller_login.dart';
import 'package:sizifi/modules/seller_authentication/ui/seller_forgot_password.dart';
import 'package:sizifi/modules/seller_authentication/ui/seller_reset_password.dart';
import 'package:sizifi/modules/seller_authentication/ui/seller_signup.dart';
import 'package:sizifi/modules/seller_authentication/ui/seller_verify.dart';
import 'package:flutter/material.dart';

import '../../modules/settings/ui/Tailor_Setting/add_tailor_screen.dart';
import '../../modules/settings/ui/Tailor_Setting/tailor_details_screen.dart';
import '../../modules/settings/ui/Tailor_Setting/tailor_list_screen.dart';

part 'routes.dart';

class Routing {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => const SplashPage(), settings: settings);
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) =>  LoginPage2(), settings: settings);
      case Routes.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordScreen(), settings: settings);
      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => const SearchScreen(), settings: settings);
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordScreen(), settings: settings);
      // case Routes.signup:
      //   return MaterialPageRoute(
      //       builder: (_) => const SignupScreen(), settings: settings);
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (_) => const OnboardingScreen(), settings: settings);
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);
      case Routes.homeBottom:
        return MaterialPageRoute(
            builder: (_) => const HomeBottom(), settings: settings);
      // case Routes.singleOrder:
      //   return MaterialPageRoute(
      //       builder: (_) =>  SingleOrderScreen(order: null,), settings: settings);
      case Routes.addOrder:
        return MaterialPageRoute(
            builder: (_) => const AddOrderScreen(), settings: settings);
      case Routes.profile:
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen(), settings: settings);
      case Routes.editProfile:
        return MaterialPageRoute(
            builder: (_) => const EditProfileScreen(), settings: settings);
      case Routes.tailorList:
        return MaterialPageRoute(
            builder: (_) => const TailorListScreen(), settings: settings);
      case Routes.addTailor:
        return MaterialPageRoute(
            builder: (_) => AddTailorScreen(), settings: settings);
      case Routes.tailorsDetails:
        return MaterialPageRoute(
            builder: (_) => const TailorDetailsScreen(), settings: settings);
      case Routes.orderSetting:
        return MaterialPageRoute(
            builder: (_) => const OrderSettingScreen(), settings: settings);
      case Routes.addStore:
        return MaterialPageRoute(
            builder: (_) => AddStoreScreen(), settings: settings);
      case Routes.addNewUser:
        return MaterialPageRoute(
            builder: (_) => AddNewUserScreen(), settings: settings);
      case Routes.allStores:
        return MaterialPageRoute(
            builder: (_) => const AllStoresScreen(), settings: settings);
      case Routes.singleStore:
        return MaterialPageRoute(
            builder: (_) => SingleStoreScreen(), settings: settings);
      case Routes.sellerLogin:
        return MaterialPageRoute(
            builder: (_) => const SellerLoginScreen(), settings: settings);
      case Routes.sellerForgotPassword:
        return MaterialPageRoute(
            builder: (_) => const SellerForgotPasswordScreen(),
            settings: settings);
      case Routes.sellerResetPassword:
        return MaterialPageRoute(
            builder: (_) => const SellerResetPasswordScreen(),
            settings: settings);
      case Routes.sellerSignup:
        return MaterialPageRoute(
            builder: (_) => const SellerSignupScreen(), settings: settings);
      case Routes.sellerVerify:
        return MaterialPageRoute(
            builder: (_) => const SellerVerifyScreen(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const SplashPage(), settings: settings);
    }
  }
}
